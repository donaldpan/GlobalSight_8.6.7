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
package com.globalsight.ling.tm2.lucene;

import java.io.Reader;

import org.apache.log4j.Logger;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.Tokenizer;

import com.globalsight.util.GlobalSightLocale;

/**
 * Lucene analyzer for GlobalSight. It tokenizes a string using Java's word
 * break iterator. It also filters out the stopwords.
 */

public class GsAnalyzer extends Analyzer
{
    private static final Logger c_logger = Logger.getLogger(GsAnalyzer.class);

    private GlobalSightLocale m_locale;
    private boolean m_careStopWordFile = true;// default true

    // / Constructor
    public GsAnalyzer(GlobalSightLocale p_locale)
    {
        super(new ReuseStrategyNo());
        m_locale = p_locale;
    }

    public GsAnalyzer(GlobalSightLocale p_locale, boolean careStopWordFile)
    {
        super(new ReuseStrategyNo());
        m_locale = p_locale;
        m_careStopWordFile = careStopWordFile;
    }

    public GlobalSightLocale getLocale()
    {
        return m_locale;
    }

    @Override
    protected TokenStreamComponents createComponents(String fieldName,
            Reader reader)
    {
        TokenStreamComponents result = null;
        try
        {
            Tokenizer t = new GsTokenizer(reader, m_locale);
            TokenStream tok = null;
            if (m_careStopWordFile)
            {
            	tok = new GsStopFilter(t, m_locale);
            }
            else
            {
            	tok = new GsStopFilter(t, m_locale, false);
            }
            tok = new GsStemFilter(tok, m_locale);

            result = new TokenStreamComponents(t, tok);
        }
        catch (Exception e)
        {
            // can't throw checked exception
            c_logger.error("An error occured in tokenStream", e);

            throw new RuntimeException(e);
        }

        return result;
    }
}
