8.6.7 Release notes

The GlobalSight 8.6.7 release contains the following enhancements:

[GBS-3731] - Ability to have mixed encodings using the same workflow
A new target encoding option, Same as Source, is available for workflow template. Set target encoding to Same as Source allows mixed encoding files sharing one workflow in a single localization profile/job. Modify existing workflow template’s target encoding to Same as Source, it takes effect on existing jobs too.

[GBS-3743] - Support Xliff 2.0 Specification
Offline download translation kit now supports Xliff 2.0 format. All download options working on Xliff 1.2 are also effective in Xliff 2.0 bilingual files. Elements (including structure elements and inline elements) and their attributes in Xliff 2.0 standard differ from those in Xliff 1.2 standard. The elements and attributes validation is based on Okapi Xliff 2 Toolkit (https://code.google.com/p/okapi-xliff-toolkit/).

[GBS-3817] - Add Google MT connector to Dispatcher Middleware
Google MT Engine has been integrated into the new Dispatcher Middleware bundle. Translate text online or translate xliff 1.2 documents with Google MT is now available.

[GBS-3818] - export TM with single source target tuv's
Export the tm in a single tuv - tuv mapping. multiple target tuv's to source tuv should be split out to be multiple tu's with single source tuv to single target tuv mapping.

[GBS-3821] - new webservice log
Webservice.log was added now, it is in Server\GlobalSight\Logs\webservice.log, when there are operations in APIs, logs will be producted in webservice.log.

[GBS-3822] - stash connector 
Configure Git connector and create jobs with files from remote Git repository is introduced in GlobalSight since 8.6.1 version.

[GBS-3824] - Translation Edit Report Attached to email notification 
Auto-accept Translation Task and Auto-send Translations Edit Report checkbox are added on Create new Projects page.

[GBS-3870] - Request change of default value on 'Set MT Creation ID...' offline kit option checkbox
For a new user, this option is checked by default. For the existing user, this option is not checked. If they want this option, they would have already changed their options.

[GBS-3881] - Addition of Secondary Post Filter to Plain Text Filter
Element post-filter (support html post filter) is added in Plain Text Filter.

[GBS-3886] - Make operations.log downloadable via the GUI
Operation.log and Webservice.log are added onto UI. Superadmin can download log files on Log Files page.

[GBS-2926] - Get Java link should redirect to proper java download site.
Where there is a message present in Globalsight asking users to update Java, it will direct users to a webpage to download Java 

[GBS-3076] - Outdated text in Import Data GUI
The test is now updated to read “Use this screen to import terminology data into an existing GlobalSight Termbase. You can import files in any of the formats listed below.” 
The Inline help for importing terminology page was updated too.

[GBS-3396] - smart box: add robustness for web connectivity
Two parameters have been added in GSSmartBox.cfg.xml to control GlobalSight state detection when launching GSSmartBox or start GSSmartBox service. 
initCheckTime: interval in seconds to check GlobalSight state; 
initCheckTimes: frequency to check GlobalSight state; 

GSSmartBox will exit when GlobalSight is not available in the given duration. The above parameters are not applicable to the running of GSSmartBox. When the running GSSmartBox loses connection to GlobalSight, all work will suspend until the connection is recovered.

[GBS-3545] - search tm options
The following advanced search criteria are added in GlobalSight 8.6.2 build: 
TU ID, String ID, Attribute Name, Attribute Value, Creation User, Modification User; 
and Creation Date and Modification Date are changed to separate fields. 

Search TU ID supports individual id, multiple ids and id ranges, e.g. 1,2,3, 4-9; Search String ID supports regular expression if IS Regex is checked. 

Creation User, Modification User, Created on date and Modified on date are based on tuv scope. Their values may vary for source and target TM entries.

[GBS-3720] - Timed/Automatic Completion of Workflow Activities
Auto Complete Activity is added on Activity Type detail page. 
It is unchecked by default. If checked and activity has been accepted, it will be completed automatically after the configured time. 
After Job Creation: Activity complete time is calculated from job is created. 
After Job Dispatch: Activity complete time is calculated from job is dispatched. 
After Activity Start: Activity complete time is calculated from activity is accepted. 

Note: Auto Complete Activity doesn't check for not translated segment now.

[GBS-3726] - GlobalSight plugin for AEM (CQ5)
A GlobalSight plugin for AEM/CQ5 is now available. 

[GBS-3806] - recreate button to work with ready jobs
Added a new button "Re-Create" under the Ready jobs list page. It's controlled by permission My Jobs -> Jobs (View) -> Re-Create.

[GBS-3809] - In Context Review Tool for INDD/IDML and Office 2010
1. A new context menu "Open In Context Review" is added when right click on the file in job or activity details page. 
  1.1 In the in context review, we can translate or add a comment by right clicking on a segment. 
  1.2 When select segment in the segment list, corresponding segment is selected in another side of pdf. 

2. In the installation UI, added a new adapter "In Context Review Tool". 
  2.1 Only if it's selected, "Open In Context Review" can be found. 
  2.2 If it's selected, during creating idml or indd jobs, pdf will be created for Source and Target files to in context review. 
  2.3 In Context Review Tool uses INDD 6 converter.

[GBS-3839] - Add Multi-select to My Jobs - Job ID filter
Multi-select for My Jobs - JobID filter is added. 
If select ">" or "<", the jobID can only be pure number; 
If select "=", the jobID can like "1,2,3" or "3-5,7-10" or mixed "1,2,3,7-10". 

This is only fixed for My Jobs - JobID filter, is not fix for My Activities- JobID filter now. 

[GBS-3879] - Support Dynamic Contents in Eloqua
Dynamic Contents in Eloqua are now supported

[GBS-3912] - Optimize codes for script on import
In Globalsight, there are some codes that are used to handle script on import, the same codes are in 5-10 places/java files. They have now been cleaned into the one place for sharing.

[GBS-3644] - AuthorIT object id as SID
A new Source File Format called AuthorIT XML is added to handle this particular xml. 

XML rule can be used in the AuthorIT file profile. 
If use XML rule, extract according XML rule and set sid as \\Object\ID 
If don't use XML rule, only extract the "Text" nodes and set sid as \\Object\ID

[GBS-3918] - Custom Flat Text File Filter with Multiline and SID options
Multiline Option: Custom Text Rule check support Mutiline with the option "Multiline". 
i.e. 
Source: 
"Full scan ODS did 
not run" 

Extracted segment: Full scan ODS did not run 

SID Option: A new rule type named “Custom SID Rule” is added to the Plain Text Filter configuration. Only one SID Rule can be selected in one Plain Text Filter. 

When a valid string for translation is extracted via the Custom Text Rules, the SID pattern should be checked to find a match for that particular string, and if matched the result should be used as the SID for that string.

[GBS-3919] - Ability to Batch Download QA Reports
Users with My Jobs permissions now may batch download QA Checks reports via Download QA Reports button. 
This button is available on My Jobs -In Progress page, My Jobs - Exported page, and Job details > Workflows page. 
To show this button, make sure that: 
1. The company has enabled QA Checks feature; 
2. The project has enabled Allow Manual Running of QA Checks feature. 
Note: 2 is required to show Download QA Reports button on Job details > Workflow page, but not required to other two pages. 

Users can select multiple jobs/workflows to generate new QA Checks reports for in progress workflows. For completed workflows, the latest existing QA Checks reports will be included in download package. 

A new web service API generateQAChecksReports() is added to get batch QA Checks reports for specified job ids and/or workflow ids.

[GBS-3945] - Workflow Notifications & Listener URL
The new introduced Workflow State Posts feature can notify remote server of the workflow state changes via HTTP post requests. 

To enable this feature, check Enable Workflow State Posts in the company settings page. Then Workflow State Post Profiles option gets available under Setup menu. 

To use this feature, you need create a Workflow State Post profile first, and then attach it to a localization profile. As workflow proceeding, the state change will be sent to remote server. 

Known limitations: 
1. There is no individual permission defined for the access to Workflow State Post Profiles option. Users in default SuperAdministrator, SuperProjectManager Administrator, ProjectManager groups can see Workflow State Post Profiles option under Setup menu. Other users need at least one of permission in Setup group and the Manage Projects permission in Project Management group. 
2. The workflow state post requests for skipped activity are also sent. And in current implement there is no indicator for skipped activity in the notification body.

[GBS-3954] - Support InDesign CC for In Context Review
A new Context Review Tool that uses InDesign CC converter. 
In the installation UI, a new illustrator adapter "Adobe (CS6) Adapter Conversion Directory" was added. 

[GBS-3955] - Upgrade JBoss and JDK version
JBoss is upgraded to EAP 6.4.0 GA version with GS 8.6.3 installation package. 

This release requires upgrading Oracle JDK version to 1.8.0 update 45. And system variables JAVA_HOME and PATH should also be updated. 

The detailed upgrade procedures are addressed in GlobalSight_Upgrade_Installer.pdf, which is bundled in GlobalSight Installer package.

[GBS-3976] - Remove JMS usage in job export
Jms is removed from job export process. Threads control to job export has added just like create job and offline upload. 

Thread number limitation can be configured in the file exportJob.properties, which can be found under the location "<GlobalSight Home>\jboss\server\standalone\deployments\globalsight.ear\lib\classes\properties. The default number is 10 if it's not configured. Superadmin user can watch the waiting and Exporting requests from Setup -> System Activities -> Job Exporting Status.

[GBS-4009] - Change to make "createJobOnInitial(..)" API to support both "Vector" and "String" parameters.
"createJobOnInitial(..)" API to support both "Vector" and "String" parameters. 
Priority value will be set to "3" as default whether you input another number or not. 

[GBS-3676] - Record job name at TUV level in Translation Memory
User will be able to identify what job a given string within the translation memory was created/last updated by. This information is  viewable on TM search (results) and included in any GMX/TMX exports (manual or via API).
Job Id and Job Name have been added to the tuv element as attributes, as per below: 
< tuv> 
< prop type="x-creationjobid">XX</prop> 
< prop type="x-creationjobname">XX</prop> 
< /tuv>

[GBS-3877] - RCR reports downloaded from within a task, now include compact tags
When selecting the Review Comments Report or the Review Comments Report (Simplified), a checkbox "Include Compact Tags" will be shown, users can check it to include compact tags in reports. 

[GBS-3929] - Implementation of Reviewer Changes
1. In the My jobs and My Activities detail page, right click on a file link, a new context menu "Open in post review editor" is added from which users can open the post review editor. 
2. If a workflow, goes more than one translation activity and the translation is inconsistent in the two activities, then the previous translation will also be presented in the list of Preview Translation. 
3. Users can select several segments and click on the icon in the right top corner of the editor, to do Approval, un-approval and revert operation. It can be done from any type of activities in activity details page. The operation is not allowed in the job details page. 
4. A new font color "light blue" is added for the approved segments. 
5. A new option "Save Approved Segments to TM" is added in the TM Profile. 
If a segment is exact Match and not manually translated, then the status is "Exact Match" 
If it's un-translated, the status is "Unlocalized"; 
If it's manually translated, the status is "Localized"; 
If it's approved (regardless it's translated or un-translated), the status is "Approved"; 
6. Unlock segment link is not provided in this version.

[GBS-3956] - add last usage date to tm
If job was exported, the last usage date will be added to TM as a tuv attribute. 
The data before 8.6.4 will keep previous status, if some segments were used and last usage date will be added to TM as tuv attribute.

[GBS-4019] - New Translation Verification Report
The new Translation Verification Report is available for translation and editable review activity. Users can generate and download the report from Work Offline > Download Report pane and/or from Reports screen, depending on permissions and user roles.

Target segment changes after initial translation will be highlighted in yellow. Users can modify the translation and make their comments as what they do with Translation Edit Report.

[GBS-4035] - TM Search: Allow searching only String ID 
When using TM Search, users can now search for String ID without also having to enter text in the text field.

[GBS-4044] - Display Percentage Complete before Dispatch
Users can acquire translation percentage information in Job Details > Workflows screen by two means.

Button Translated Text in Workflows table:
Click it to show the proportion of translated segments per target locale for all workflows.

Button Translated Text... under Workflows table:
Click it to show Translated Text Statistics screen, on which the proportions of translated segments per file/page show for the selected workflows.
You need corresponding permission to see this button.

To enable button Translated Text...
Check My Jobs > Jobs > Job Details > Workflows > Translated Text option.

Known limitations:
1. For segment containing sub segment, either the main segment or sub segment is translated, the whole segment is regarded as translated. This is a legacy issue of GlobalSight. In this case, when you see a job is 100% translated, make sure that all segments are translated. 
2. For import failed files, no value will show on Translated Text Statistics screen.

[GBS-4062] - Make modifyUser() less restricted
userId parameter is now the only required parameter. All others, if not specified during the API call, will be ignored and not changed.

[GBS-4066] - Special characters (emojis) 
For txt and xml format, emoji unicodes will be displayed as tags. 

[GBS-4072] - A Webservice to Allow Editing Some of the Job Detail Information
The new Webservice method editJobDetailInfo allows user to modify the job name, estimated translation completion date, estimated workflow completion date, and job priority. 

Some limitations to modify job details: 
1. Only jobs in ready state can modify names. 
2. Workflows in ready to dispatch and in dispatched can modify estimated translation/workflow completion dates. 

Known issues: 
1. It changes job's full name. If random number was appended during the job creation, it won't be preserved. 
2. The timezone info is omitted, the estimated translation/workflow completion date stored in database depends on the operating system's timezone of GlobalSight instance.

[GBS-3869] - Reviewer Comments Enhancement Request
A new option, Include Source and Target, is added to Comments report web form. Users can check this option to track the comments history for each translation unit.

[GBS-3873] - add job id option to activity report
A radio button is added for job IDs, which is used to select multiple job IDs separated by comma, e.g. ID1,ID2,ID3.

[GBS-4046] - TER: add job ID field in downloading report UI
As the job name list becomes longer and longer, it is difficult to find some job name. Users now can filter jobs by Job ID when they generate Translations Edit Report, Translation Verification Report, and Post-Review QA Report via the report web form. 

[GBS-3907] - Add export by project option to TM Export API
Export by project option has been added to TM Export API 

[GBS-3936] - support xliff 2.0 as a source format
GlobalSight now supports the translation for xliff 2.0 bilingual files. To create jobs with xliff 2.0 files, make sure to create an xliff 2.0 file profile first. 

Key Features: 
- All Xliff 2.0 core elements (structure & inline elements) are supported. 
- Translation Candidate module is supported. The match items will show as xliff alternative translations for reference. 
- Other optional modules defined in Xliff 2.0 Specs will be preserved when exporting xliff 2.0 files, but no functionality is supported. 
- Attributes of inline elements like canCopy, canDelete, canReorder, and canOverlap etc. are not supported. Inline elements will be handled as GlobalSight mandatory tags, and they follow GlobalSight rules.

[GBS-4097] - Process Job Import and Export Request Queues Based on Job Priority First
A new Change Priority panel is available now on Waiting Requests screen for job creation queue and job export queue. Admin users can modify the import/export priority for selected items. 

Known limitation: 
The import/export priority is based on file type (extension). So duplicate priority may appear for different files. 

[GBS-4064] - able to export a ready job 
Sometimes users may wish to test an export, but not set the job to in progress. Users now can export and download a ready job when they have related permissions. 

[GBS-4100] - Update for Drupal <==> GS connector for Drupal 8
A new version of GlobalSight translator plugin for Translation Management Tools (TMGMT) is available for Drupal 8 now. 

Other changes in GlobalSight translator configuration include: 
- remove proxy settings; 
- replace file profile id field with file profile name. 
  Note that the file profile name is case sensitive, inconsistent case will lead to job submit failure. 

GlobalSight translator requires installing below modules in TMGMT: 
- Translation Management Core 
- Export / Import File 
- Content Entity Source 

Build version: 
- GlobalSight translator: 8.x-1.0-alpha1 
- Drupal core: 8.0.1 
- TMGMT: 8.x-1.0-alpha1 (2015-Nov-19) and 8.x-1.x-dev (2015-Dec-28) 
  Note that module Local Translator should not be installed for any TMGMT version released before Dec. 28, 2015. The latest development version of TMGMT, i.e., 8.x-1.x-dev (2015-Dec-28), is safe to install Local Translator module.

[GBS-4139] - Add SID Field to Add/Edit Comment Dialog
Previously there was no way for a reviewer to view SID information when reviewing online (this information is present in the offline RCR). A new field is now added in the Add/Edit Comment dialog to display the SID information (see screenshot below)  

[GBS-4143] – TM search pop up
L10n participant users now can see a TM Search option on the Segment Editor's menu bar, and the Inline Editor's Actions drop-down menu. 

The new TM Search option is controlled by My Activities > Enable TM Search permission. Meanwhile, if users have My Activities > Enable Term Search permission, they can access Term Search tab in the pop-up window too.
Segment editor

Inline Editor


[GBS-4154] - Blaise Connector
A new connector named "Blaise Connector" can be found under the menu "Data Sources". It is permission controlled. We can create/connect the connector, and create GlobalSight job to Translate. 

If exported from GlobalSight Job, the translation will be uploaded to Blaise server. If GlobalSight job is completed, the translation will be uploaded and submitted in Blaise server.

[GBS-4146] - api to delete tu's and tuv's
A new webservice API deleteTuByTuIds is added. 
public String deleteTuByTuIds(String accessToken, String tmName, String companyName, String tuIds) throws WebServiceException 
Detailed information can be found in the wiki page. http://wiki.welocalize.com/index.php/GlobalSight_Web_Services_API_(Internal)#Translation_Memory_management

[GBS-4149] - create job API to return error if file profile id is not active
If a user uses an inactive or incorrect file profile id, they will be alerted with the error: “Below file profiles do not exist or have been inactive” 

[GBS-4156] - Add "signed-off" as a target string status that will allow a translated string to be over-written by complete English string
If in the Xliff 1.2 offline translation kit file, the target segment status is "final", "signed-off" or "translated", and the target is the same as the source, then after offline upload, the target segment will be same as source, and the status is changed to "Approved"

[GBS-4172] - Demoted option does not work well
The option "Multiple Exact Matches: Demoted" is now independent of the option "Leverage Options for Reimport: Choose Latest Match".

[GBS-4198] - Move webservice logs from activity.log to webservices.log
All webservice relevant logs will be in "webservices.log" file since now, not in the "activity.log" as before.

[GBS-4201] - Can't select nb_no and no_no as languages to leverage from on a workflow.
When users create or edit a workflow template, Norwegian and its two official forms, Bokmål and Nynorsk, are now available as Leverage From options when the target locale is any one of Norwegian (Norway), Norwegian Bokmål (Norway), or Norwegian Nynorsk (Norway). 
Option Norwegian Bokmål (Norway) and/or Norwegian Nynorsk (Norway) will shows when related locales have been defined in the super company. 

[GBS-4206] - API create job bad input 
Occasionally bad input is included in the Create Job API. When this occurs, users will be alerted with following descriptive error messages: 
1.inactive or invalid file profile id 
2.jobid - missing/incorrect

[GBS-4217] - re-try MT
Users can resend segments to MT engine by two means: 
o The translate link on Segment Editor window for individual segments 
o Re-try MT option on Update Leverage window for all un-translated segments. 
These two options will be available when workflows in jobs have a MT profile attached. 

Known issues/limitations: 
1. Show in Editor option in MT profile configuration page is deprecated, and will be removed in later build. 
2. The translation returned from MT engine on Segment Editor doesn't contain tags. 
3. No clues for MT failure on user interface.

[GBS-4248] - Allow to remove multiple locale pairs in one action
The following 2 functions are now available:
1. Now allow to remove multiple locale pairs once a time. 
2. Add filter search for "Source Locale" and "Target Locale". 

[GBS-4250] - Allow to select multiple files in one action for "Create Job without Java"
Users can now select multiple files in one action for "Create Job without Java" 

[GBS-4260] - Add "Include Compact Tags" for character count report
“Include Compact Tags" for character count report now appears in following locations: 
1.job Details Reports 
2.Reports 
3.My activity - open in popup editor 
4.My activity - open in post review editor

[GBS-4261] - Extra span tags added for BIDI html file
A new option named "Add rtl directionality" is added to html filter (default unchecked), for controlling adding span tags with rtl attribute for BIDI html file or not.

