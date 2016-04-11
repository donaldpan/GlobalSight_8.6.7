/**
 *  Copyright 2009 Welocalize, Inc. 
 *  
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  
 *  You may obtain a copy of the License at 
 *  http://www.apache.org/licenses/LICENSE-2.0
 *  
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *  
 */
package com.globalsight.cxe.adapter.serviceware;

import java.util.HashMap;

import org.w3c.dom.Element;

import com.globalsight.cxe.adapter.BaseAdapter;
import com.globalsight.cxe.message.CxeMessage;
import com.globalsight.cxe.message.CxeMessageType;
import com.globalsight.cxe.message.MessageDataReader;
import com.globalsight.cxe.util.EventFlowXmlParser;
import com.globalsight.diplomat.util.Logger;
import com.globalsight.util.GeneralException;

/**
 * Helper class used by the ServiceWareAdapter for exporting
 */
public class Exporter
{
    // ////////////////////////////////////
    // Private Constants //
    // ////////////////////////////////////
    private static final char UNIX_SEPARATOR = '/';
    private static final char WIN_SEPARATOR = '\\';
    private static final String MSG_CREATE = "Created by GlobalSight";
    private static final String MSG_EDIT = "Edited by GlobalSight";

    // ////////////////////////////////////
    // Private Members //
    // ////////////////////////////////////
    private CxeMessage m_cxeMessage;
    private org.apache.log4j.Logger m_logger;
    private String m_targetLocale = null; // target locale name
    private String m_sourceLocale = null; // target locale name
    private EventFlowXmlParser m_parser = null;
    private String m_koId = null;

    // ////////////////////////////////////
    // Constructor //
    // ////////////////////////////////////

    /**
     * Creates an Exporter object
     * 
     * @param p_cxeMessage
     *            a CxeMessage to work from
     */
    Exporter(CxeMessage p_cxeMessage, org.apache.log4j.Logger p_logger)
            throws GeneralException
    {
        m_cxeMessage = p_cxeMessage;
        m_logger = p_logger;
        m_parser = new EventFlowXmlParser();
    }

    /**
     * private constructor for testing
     */
    private Exporter()
    {
        m_logger = org.apache.log4j.Logger.getLogger(Exporter.class);
        m_targetLocale = "fr_FR";
    }

    // ////////////////////////////////////
    // Package Private Methods //
    // ////////////////////////////////////

    /**
     * Actually performs the write-back to serviceware
     * 
     * @return New CxeMessage result
     */
    CxeMessage export()
    {
        CxeMessage exportStatusMsg;
        try
        {
            Logger.writeDebugFile("swta_ef.xml", m_cxeMessage.getEventFlowXml());
            parseEventFlowXml();
            String sessionId = ServiceWareAPI.connect();
            String localizedXml = MessageDataReader.readString(m_cxeMessage
                    .getMessageData());
            ServiceWareAPI.updateKnowledgeAndConceptObjects(sessionId,
                    localizedXml, m_targetLocale);
            ServiceWareAPI.disconnect(sessionId);
            exportStatusMsg = makeExportSuccessMessage();
            BaseAdapter.preserveOriginalFileContent(
                    m_cxeMessage.getMessageData(),
                    exportStatusMsg.getParameters());
            m_cxeMessage.setDeleteMessageData(true);
        }
        catch (ServiceWareAdapterException fsae)
        {
            exportStatusMsg = makeExportErrorMessage(fsae);
        }
        catch (Exception e)
        {
            m_logger.error("Could not write file back.", e);
            String errorArgs[] = new String[1];
            errorArgs[0] = m_logger.getName();
            ServiceWareAdapterException fsae = new ServiceWareAdapterException(
                    "CxeInternalEx", errorArgs, e);
            exportStatusMsg = makeExportErrorMessage(fsae);
        }

        return exportStatusMsg;
    }

    // ////////////////////////////////////
    // Private Methods //
    // ////////////////////////////////////

    /**
     * Prepares the export success status message for sending to the next
     * adapter
     * 
     * @param p_exceptionMsg
     *            an error/status string
     * @param p_finalFile
     * @return CxeMessage
     */
    private CxeMessage makeExportSuccessMessage() throws Exception
    {
        CxeMessageType type = CxeMessageType
                .getCxeMessageType(CxeMessageType.CXE_EXPORT_STATUS_EVENT);
        CxeMessage newCxeMessage = new CxeMessage(type);
        newCxeMessage.setEventFlowXml(m_cxeMessage.getEventFlowXml());
        HashMap newParams = m_cxeMessage.getParameters();
        newParams.put("ExportedTime", new Long(System.currentTimeMillis()));
        newParams.put("Exception", null);

        // copy parameters that were preset by other adapters
        // (office adapter calls this code once per batch)
        // (quark and frame call this code once per file)
        String isComp = (String) m_cxeMessage.getParameters().get(
                "IsComponentPage");
        if (isComp != null)
        {
            newParams.put("IsComponentPage", isComp); // copy to new params
        }
        String absoluteExportPath = (String) m_cxeMessage.getParameters().get(
                "AbsoluteExportPath");
        if (absoluteExportPath != null)
        {
            newParams.put("AbsoluteExportPath", absoluteExportPath); // copy to
                                                                     // new
                                                                     // params
        }

        // for all other files, we set the absolute path here
        if (isComp == null || isComp.equalsIgnoreCase("false"))
        {
            newParams.put("AbsoluteExportPath", "KnowedgeObject id " + m_koId);
        }

        newCxeMessage.setParameters(newParams);
        return newCxeMessage;
    }

    /**
     * Prepares the export error message for sending to the next adapter
     * 
     * @param p_fsae
     *            a File System Adapter Exception
     * @return CxeMessage
     */
    private CxeMessage makeExportErrorMessage(ServiceWareAdapterException p_fsae)
    {
        CxeMessageType type = CxeMessageType
                .getCxeMessageType(CxeMessageType.CXE_EXPORT_STATUS_EVENT);
        CxeMessage newCxeMessage = new CxeMessage(type);
        newCxeMessage.setEventFlowXml(m_cxeMessage.getEventFlowXml());
        HashMap newParams = new HashMap();
        newParams.put("Exception", p_fsae);
        newCxeMessage.setParameters(newParams);
        return newCxeMessage;
    }

    /**
     * Reads the Event Flow Xml for some needed values
     * 
     * @exception Exception
     */
    private void parseEventFlowXml() throws Exception
    {
        m_parser.parse(m_cxeMessage.getEventFlowXml());
        Element msCategory = m_parser.getCategory("ServiceWare");
        m_koId = m_parser.getCategoryDaValue(msCategory, "KOID")[0];
        m_targetLocale = m_parser.getTargetLocale();
        m_sourceLocale = m_parser.getSourceLocale();
    }
}