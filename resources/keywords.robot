# This file contains global variables and keywords that are shared across all
# tests. Please do not add any test specific keywords here!

*** Settings ***

Library           SeleniumLibrary  timeout=40
Library           RequestsLibrary
Library           JSONLibrary
Library           Collections
Library           OperatingSystem



*** Variables ***


*** Keywords ***
#Given

#-----------------------------------------Keywords for User Interface tests----------------------

access wgo
  Open Browser  ${SERVER}  ${BROWSER}
  Maximize Browser Window
  Wait until page contains element    ${homepageLogo}

I succesfuly login to the Calvin user account
  Wait until page contains element    ${Username}
  ${json_object}=    Load JSON From File   ${CURDIR}/credentials.json
  Set Test Variable    ${json_object}    ${json_object}
  ${Valid_Username}=    Get Value From Json  ${json_object}    $.users.${env}.calvin.validusername
  Input Text    ${Username}    ${Valid_Username[0]}
  ${Valid_Password}=    Get Value From Json  ${json_object}    $.users.${env}.calvin.validpassword
  Input Text    ${Password}   ${Valid_Password[0]}
  Click Element    ${Login_Button}


a logged in calvin user
  Open Browser  ${SERVER}  ${BROWSER}
  Maximize Browser Window
  Wait until page contains element    ${Username}
  ${json_object}=    Load JSON From File   ${CURDIR}/credentials.json
  Set Test Variable    ${json_object}    ${json_object}
  ${Valid_Username}=    Get Value From Json  ${json_object}    $.users.${env}.calvin.validusername
  Input Text    ${Username}    ${Valid_Username[0]}
  ${Valid_Password}=    Get Value From Json  ${json_object}    $.users.${env}.calvin.validpassword
  Input Text    ${Password}   ${Valid_Password[0]}
  Click Element    ${Login_Button}

a logged in labeler
  Open Browser  ${SERVER}  ${BROWSER}
  Maximize Browser Window
  Wait until page contains element    ${Username}
  ${json_object}=    Load JSON From File   ${CURDIR}/credentials.json
  Set Test Variable    ${json_object}    ${json_object}
  ${Valid_Username}=    Get Value From Json  ${json_object}    $.users.${env}.labeler.validusername
  Input Text    ${Username}    ${Valid_Username[0]}
  ${Valid_Password}=    Get Value From Json  ${json_object}    $.users.${env}.labeler.validpassword
  Input Text    ${Password}   ${Valid_Password[0]}
  Click Element    ${Login_Button}
  Wait Until Page Contains Element    ${DropDown_Menu}
  Page Should Contain Element    ${DropDown_Menu}

I submit a task
  Wait until Element Is Not Visible    ${Progress_Loader}
  Wait Until Element Is Visible    ${Submit_Button}
  Sleep    0.5s
  Wait until Element Is Not Visible    ${Progress_Loader}
  Wait Until Element Is Enabled    ${Submit_Button}
  Click Element    ${Submit_Button}
  Wait until page Contains Element    ${Submission_Popup}
  Wait until Page Contains Element    ${Submit_Session}
  Click Element    ${Submit_Session}

a logged in QA
  Open Browser  ${SERVER}  ${BROWSER}
  Maximize Browser Window
  Wait until page contains element    ${Username}
  ${json_object}=    Load JSON From File   ${CURDIR}/credentials.json
  Set Test Variable    ${json_object}    ${json_object}
  ${Valid_Username}=    Get Value From Json  ${json_object}    $.users.${env}.QA.validusername
  Input Text    ${Username}    ${Valid_Username[0]}
  ${Valid_Password}=    Get Value From Json  ${json_object}    $.users.${env}.QA.validpassword
  Input Text    ${Password}   ${Valid_Password[0]}
  Click Element    ${Login_Button}
  Wait Until Page Contains    Dashboard
  Page Should Contain    Dashboard
  Wait Until Page Contains Element    ${DropDown_Menu}
  Page Should Contain Element    ${DropDown_Menu}

a logged in dario user
  Open Browser  ${SERVER}  ${BROWSER}
  Maximize Browser Window
  Wait until page contains element    ${Username}
  ${json_object}=    Load JSON From File   ${CURDIR}/credentials.json
  Set Test Variable    ${json_object}    ${json_object}
  ${Valid_Username}=    Get Value From Json  ${json_object}    $.users.${env}.dario.validusername
  Input Text    ${Username}    ${Valid_Username[0]}
  ${Valid_Password}=    Get Value From Json  ${json_object}    $.users.${env}.dario.validpassword
  Input Text    ${Password}   ${Valid_Password[0]}
  Click Element    ${Login_Button}

a logged in lara user
  Open Browser  ${SERVER}  ${BROWSER}
  Maximize Browser Window
  Wait until page contains element    ${Username}
  ${json_object}=    Load JSON From File   ${CURDIR}/credentials.json
  Set Test Variable    ${json_object}    ${json_object}
  ${Valid_Username}=    Get Value From Json  ${json_object}    $.users.${env}.lara.validusername
  Input Text    ${Username}    ${Valid_Username[0]}
  ${Valid_Password}=    Get Value From Json  ${json_object}    $.users.${env}.lara.validpassword
  Input Text    ${Password}   ${Valid_Password[0]}
  Click Element    ${Login_Button}
  Wait until Page Contains    Dashboard

a Calvin homepage
  Open Browser  ${SERVER}  ${BROWSER}
  Maximize Browser Window
  Wait until page contains element    ${Username}
  ${json_object}=    Load JSON From File   ${CURDIR}/credentials.json
  Set Test Variable    ${json_object}    ${json_object}
  ${Valid_Username}=    Get Value From Json  ${json_object}    $.users.${env}.calvin.validusername
  Input Text    ${Username}    ${Valid_Username[0]}
  ${Valid_Password}=    Get Value From Json  ${json_object}    $.users.${env}.calvin.validpassword
  Input Text    ${Password}   ${Valid_Password[0]}
  Click Element    ${Login_Button}
  Wait Until Page Contains    Campaigns
  Page Should Contain    Campaigns
  Wait Until Page Contains Element    ${DropDown_Menu}
  Page Should Contain Element    ${DropDown_Menu}
  page Should Contain element    ${PageSizeDD}
  page Should Contain element    ${SortByDD_Campaigns}

I login to labeler after loging out of Calvin
  Wait Until Page Contains Element    ${DropDown_Userr}
  Click Element    ${DropDown_Userr}
  Wait Until Element Is Visible    ${Logout_Calvin}
  Wait Until Element Is Enabled    ${Logout_Calvin}
  Wait Until Page Contains Element    ${Logout_Calvin}
  Click Element    ${Logout_Calvin}
  Wait until page contains element    ${Username}
  ${json_object}=    Load JSON From File   ${CURDIR}/credentials.json
  Set Test Variable    ${json_object}    ${json_object}
  ${Valid_Username}=    Get Value From Json  ${json_object}    $.users.${env}.labeler.validusername
  Input Text    ${Username}    ${Valid_Username[0]}
  ${Valid_Password}=    Get Value From Json  ${json_object}    $.users.${env}.labeler.validpassword
  Input Text    ${Password}   ${Valid_Password[0]}
  Click Element    ${Login_Button}

I delete the campaign
  Wait until page Contains Element    ${CreateCampaignButton}
  Wait until Page Contains Element    ${FirstCampaign_CB}
  Click Element    ${FirstCampaign_CB}
  Wait until element Is Enabled    ${DeleteCampaignButton}
  Click Element    ${DeleteCampaignButton}
  Wait until Element Is Visible    ${ConfirmDeleteButton}
  Wait until page Contains Element    ${ConfirmDeleteButton}
  Wait until element is Enabled    ${ConfirmDeleteButton}
  Wait until Element Contains    ${ConfirmDeleteButton}     Delete
  Click Element    ${ConfirmDeleteButton}
  Wait until Page Contains    Campaigns Deleted

I am on labeler homepage
  Open Browser  ${SERVER}  ${BROWSER}
  Maximize Browser Window
  Wait until page contains element    ${Username}
  ${json_object}=    Load JSON From File   ${CURDIR}/credentials.json
  Set Test Variable    ${json_object}    ${json_object}
  ${Valid_Username}=    Get Value From Json  ${json_object}    $.users.${env}.labeler.validusername
  Input Text    ${Username}    ${Valid_Username[0]}
  ${Valid_Password}=    Get Value From Json  ${json_object}    $.users.${env}.labeler.validpassword
  Input Text    ${Password}   ${Valid_Password[0]}
  Click Element    ${Login_Button}
  Wait Until Page Contains    Dashboard
  Page Should Contain    Dashboard
  Wait Until Page Contains Element    ${DropDown_Menu}
  Page Should Contain Element    ${DropDown_Menu}
  Wait until Page Contains Element    ${ResumeButton}
  Click Element    ${ResumeButton}
  Wait Until Page Contains Element    ${Progress_Loader}
  Page Should Contain Element    ${Progress_Loader}
  Wait Until Element Is Not Visible    ${Progress_Loader}
  Wait Until Element Is Visible    ${Pause_Button}
  Wait Until Element Is Enabled    ${Pause_Button}

I am on QA homepage
  Open Browser  ${SERVER}  ${BROWSER}
  Maximize Browser Window
  Wait until page contains element    ${Username}
  ${json_object}=    Load JSON From File   ${CURDIR}/credentials.json
  Set Test Variable    ${json_object}    ${json_object}
  ${Valid_Username}=    Get Value From Json  ${json_object}    $.users.${env}.QA.validusername
  Input Text    ${Username}    ${Valid_Username[0]}
  ${Valid_Password}=    Get Value From Json  ${json_object}    $.users.${env}.QA.validpassword
  Input Text    ${Password}   ${Valid_Password[0]}
  Click Element    ${Login_Button}
  Wait Until Page Contains    Dashboard
  Page Should Contain    Dashboard
  Wait Until Page Contains Element    ${DropDown_Menu}
  Page Should Contain Element    ${DropDown_Menu}
  Wait until Page Contains Element    ${ResumeButton}
  Click Element    ${ResumeButton}
  Wait Until Page Contains Element    ${Progress_Loader}
  Page Should Contain Element    ${Progress_Loader}
  Wait Until Element Is Not Visible    ${Progress_Loader}  

labeler submits a task
  Open Browser  ${SERVER}  ${BROWSER}
  Maximize Browser Window
  Wait until page contains element    ${Username}
  ${json_object}=    Load JSON From File   ${CURDIR}/credentials.json
  Set Test Variable    ${json_object}    ${json_object}
  ${Valid_Username}=    Get Value From Json  ${json_object}    $.users.${env}.labeler.validusername
  Input Text    ${Username}    ${Valid_Username[0]}
  ${Valid_Password}=    Get Value From Json  ${json_object}    $.users.${env}.labeler.validpassword
  Input Text    ${Password}   ${Valid_Password[0]}
  Click Element    ${Login_Button}
  Wait Until Page Contains    Dashboard
  Page Should Contain    Dashboard
  Wait Until Page Contains Element    ${DropDown_Menu}
  Page Should Contain Element    ${DropDown_Menu}
  Wait until Page Contains Element    ${ResumeButton}
  Click Element    ${ResumeButton}
  Wait Until Page Contains Element    ${Progress_Loader}
  Page Should Contain Element    ${Progress_Loader}
  Wait Until Element Is Not Visible    ${Progress_Loader}
  Page Should Contain Element    ${Progress_Loader}
  Wait Until Element Is Visible    ${Pause_Button}
  Wait Until Element Is Enabled    ${Pause_Button}
  Wait until page Contains Element    ${Submit_Button}
  Click Element    ${Submit_Button}
  Wait until Page Contains Element    ${Submission_Popup}
  Wait until Page Contains Element    ${SubmitSession}
  Click Element    ${SubmitSession}
  Wait until page Contains    Dashboard

I switch to QA from labeler
  Wait Until Page Contains Element    ${DropDown_Userr}
  Click Element    ${DropDown_Userr}
  Wait Until Element Is Visible    ${Logout_Labeler}
  Wait Until Element Is Enabled    ${Logout_Labeler}
  wait until Element Contains    ${Logout_Labeler}    Logout
  Wait Until Page Contains Element    ${Logout_Labeler}
  Click Element    ${Logout_Labeler}
  Wait until Page Contains Element    ${}  
  Wait until page contains element    ${Username}
  ${json_object}=    Load JSON From File   ${CURDIR}/credentials.json
  Set Test Variable    ${json_object}    ${json_object}
  ${Valid_Username}=    Get Value From Json  ${json_object}    $.users.${env}.QA.validusername
  Input Text    ${Username}    ${Valid_Username[0]}
  ${Valid_Password}=    Get Value From Json  ${json_object}    $.users.${env}.QA.validpassword
  Input Text    ${Password}   ${Valid_Password[0]}
  Click Element    ${Login_Button}
  Wait Until Page Contains    Dashboard
  Page Should Contain    Dashboard
  Wait Until Page Contains Element    ${DropDown_Menu}
  Page Should Contain Element    ${DropDown_Menu}



I switch to labeler from calvin 
  Wait Until Page Contains Element    ${DropDown_Userr}
  Click Element    ${DropDown_Userr}
  Wait Until Element Is Visible    ${Logout_Calvin}
  Wait Until Element Is Enabled    ${Logout_Calvin}
  wait until Element Contains    ${Logout_Calvin}    Logout
  Wait Until Page Contains Element    ${Logout_Calvin}
  Click Element    ${Logout_Calvin}  
  Wait until page contains element    ${Username}
  ${json_object}=    Load JSON From File   ${CURDIR}/credentials.json
  Set Test Variable    ${json_object}    ${json_object}
  ${Valid_Username}=    Get Value From Json  ${json_object}    $.users.${env}.labeler.validusername
  Input Text    ${Username}    ${Valid_Username[0]}
  ${Valid_Password}=    Get Value From Json  ${json_object}    $.users.${env}.labeler.validpassword
  Input Text    ${Password}   ${Valid_Password[0]}
  Click Element    ${Login_Button}

I navigate to labeler homepage
  wait until Page Contains Element    ${ResumeButton}
  wait until Element Is Enabled    ${ResumeButton}
  Click Element    ${ResumeButton}

I navigate to labeler homepagee
  Wait Until Page Contains    Dashboard
  Page Should Contain    Dashboard
  Wait Until Page Contains Element    ${DropDown_Menu}
  Page Should Contain Element    ${DropDown_Menu}
  Wait until Page Contains Element    ${ResumeButton}
  Click Element    ${ResumeButton}
  Wait Until Page Contains Element    ${Progress_Loader}
  Page Should Contain Element    ${Progress_Loader}
  Wait Until Element Is Not Visible    ${Progress_Loader}
  Wait Until Element Is Visible    ${Pause_Button}
  Wait Until Element Is Enabled    ${Pause_Button}

I switch to lara from calvin
  Wait Until Page Contains Element    ${DropDown_Userr}
  Click Element    ${DropDown_Userr}
  Wait Until Element Is Visible    ${Logout_Calvin}
  Wait Until Element Is Enabled    ${Logout_Calvin}
  Wait Until Page Contains Element    ${Logout_Calvin}
  wait until Element Contains    ${Logout_Calvin}    Logout
  Click Element    ${Logout_Calvin} 
  Wait until page contains element    ${Username}
  ${json_object}=    Load JSON From File   ${CURDIR}/credentials.json
  Set Test Variable    ${json_object}    ${json_object}
  ${Valid_Username}=    Get Value From Json  ${json_object}    $.users.${env}.lara.validusername
  Input Text    ${Username}    ${Valid_Username[0]}
  ${Valid_Password}=    Get Value From Json  ${json_object}    $.users.${env}.lara.validpassword
  Input Text    ${Password}   ${Valid_Password[0]}
  Click Element    ${Login_Button}  

I switch to calvin from lara
  Wait Until Page Contains Element    ${DropDown_Userr}
  Click Element    ${DropDown_Userr}
  Wait Until Element Is Visible    ${Logout_Lara}
  Wait Until Element Is Enabled    ${Logout_Lara}
  wait until Element Contains    ${Logout_Lara}    Logout
  Wait Until Page Contains Element    ${Logout_Lara}
  Click Element    ${Logout_Lara} 
  Wait until page contains element    ${Username}
  ${json_object}=    Load JSON From File   ${CURDIR}/credentials.json
  Set Test Variable    ${json_object}    ${json_object}
  ${Valid_Username}=    Get Value From Json  ${json_object}    $.users.${env}.calvin.validusername
  Input Text    ${Username}    ${Valid_Username[0]}
  ${Valid_Password}=    Get Value From Json  ${json_object}    $.users.${env}.calvin.validpassword
  Input Text    ${Password}   ${Valid_Password[0]}
  Click Element    ${Login_Button}

I create a campaign
  Wait Until Element Is Visible       ${CreateCampaignButton}
  Wait Until Element Is Enabled       ${CreateCampaignButton}
  Click Element                       ${CreateCampaignButton}
  Wait Until Page Contains            Campaign Creation
  Wait Until Page Contains Element    ${CreateButton}
  Input Text                          ${CampaignNameFeild}           ui_testing_campaign
  Click Element                       ${ModuleDropDown}
  Wait Until Page Contains Element    ${ModuleSelection}
  Click Element                       ${ModuleSelection}
  Click Element                       ${ModelID}
  Wait Until Element Is Enabled       ${ModelID_Option}
  Click Element                       ${ModelID_Option}
  Click Element                       ${LabelerGroup}
  Wait Until Element Is Enabled       ${LabelerGroupSelection4}
  Click Element                       ${LabelerGroupSelection4}
  Click Element                       ${QAGroup}
  Wait Until Element Is Enabled       ${QASelection4}
  Click Element                       ${QASelection4}
  Input Text                          ${DescriptionField}            Automated Description of ui_testing_campaign
  Click Element                       ${CreateandAddButton}
  Wait Until Page Contains            Add batch jobs
  Wait Until Page Contains Element    ${ImportButton}
  Wait Until Page Contains Element    ${SequenceCheckbox_1}
  Wait Until Element Is Visible       ${SequenceCheckbox_1}
  Wait Until Element Is Enabled       ${SequenceCheckbox_1}
  Click Element                        ${SequenceCheckbox_1}
  Click Element                       ${SequenceCheckbox_2}
  Click Element                       ${SequenceCheckbox_3}
  Click Element                       ${TasksDropDownButton}
  Wait Until Element Is Enabled       ${TasksDropDownSelection_2}
  Click Element                       ${TasksDropDownButton}
  Wait Until Element Is Enabled       ${TasksDropDownSelection_1}
  Click Element                       ${TasksDropDownSelection_1}
  Click Element                       ${ImportButton}
  Wait Until Page Contains            Description
  Wait Until Page Contains Element    ${StartCampaignButton}
  Wait Until Element Is Enabled       ${StartCampaignButton}
  Click Element                       ${StartCampaignButton}
  Wait until Page Contains Element    ${CreateCampaignButton}

campaign creation for Object Detection
  Open Browser  ${SERVER}  ${BROWSER}
  Maximize Browser Window
  Wait until page contains element    ${Username}
  ${json_object}=    Load JSON From File   ${CURDIR}/credentials.json
  Set Test Variable    ${json_object}    ${json_object}
  ${Valid_Username}=    Get Value From Json  ${json_object}    $.users.${env}.calvin.validusername
  Input Text    ${Username}    ${Valid_Username[0]}
  ${Valid_Password}=    Get Value From Json  ${json_object}    $.users.${env}.calvin.validpassword
  Input Text    ${Password}   ${Valid_Password[0]}
  Click Element    ${Login_Button}
  Wait Until Element Is Visible       ${CreateCampaignButton}
  Wait Until Element Is Enabled       ${CreateCampaignButton}
  Click Element                       ${CreateCampaignButton}
  Wait Until Page Contains            Campaign Creation
  Wait Until Page Contains Element    ${CreateButton}
  Input Text                          ${CampaignNameFeild}           ui_testing_campaign
  Click Element                       ${ModuleDropDown}
  Wait Until Page Contains Element    ${MODModule}
  Click Element                       ${MODModule}
  Click Element                       ${ModelID}
  Wait Until Element Is Enabled       ${ModelID_Option}
  Click Element                       ${ModelID_Option}
  Click Element                       ${LabelerGroup}
  Wait Until Element Is Enabled       ${ui_LAB}
  Click Element                       ${ui_LAB}
  Click Element                       ${QAGroup}
  Wait Until Element Is Enabled       ${ui_QA}
  Click Element                       ${ui_QA}
  Input Text                          ${DescriptionField}            Automated Description of ui_testing_campaign
  Click Element                       ${CreateandAddButton}
  Wait Until Page Contains            Add batch jobs
  Wait Until Page Contains Element    ${ImportButton}
  Wait Until Page Contains Element    ${SequenceCheckbox_1}
  Wait Until Element Is Visible       ${SequenceCheckbox_1}
  Wait Until Element Is Enabled       ${SequenceCheckbox_1}
  Click Element                        ${SequenceCheckbox_1}
  Click Element                       ${SequenceCheckbox_2}
  Click Element                       ${SequenceCheckbox_3}
  Click Element                       ${TasksDropDownButton}
  Wait Until Element Is Enabled       ${TasksDropDownSelection_2}
  Click Element                       ${TasksDropDownButton}
  Wait Until Element Is Enabled       ${TasksDropDownSelection_1}
  Click Element                       ${TasksDropDownSelection_1}
  Click Element                       ${ImportButton}
  Wait Until Page Contains            Description
  Wait Until Page Contains Element    ${StartCampaignButton}
  Wait Until Element Is Enabled       ${StartCampaignButton}
  Click Element                       ${StartCampaignButton}
  Wait until Page Contains Element    ${CreateCampaignButton}
  # Wait Until Page Contains Element    ${DropDown_Userr}
  # Click Element    ${DropDown_Userr}
  # Wait Until Element Is Visible    ${Logout_Button}
  # Wait Until Element Is Enabled    ${Logout_Button}
  # Wait Until Page Contains Element    ${Logout_Button}
  # Click Element    ${Logout_Button}

a lara campaign
  Open Browser  ${SERVER}  ${BROWSER}
  Maximize Browser Window
  Wait until page contains element    ${Username}
  ${json_object}=    Load JSON From File   ${CURDIR}/credentials.json
  Set Test Variable    ${json_object}    ${json_object}
  ${Valid_Username}=    Get Value From Json  ${json_object}    $.users.${env}.calvin.validusername
  Input Text    ${Username}    ${Valid_Username[0]}
  ${Valid_Password}=    Get Value From Json  ${json_object}    $.users.${env}.calvin.validpassword
  Input Text    ${Password}   ${Valid_Password[0]}
  Click Element    ${Login_Button}
  Wait Until Element Is Visible       ${CreateCampaignButton}
  Wait Until Element Is Enabled       ${CreateCampaignButton}
  Click Element                       ${CreateCampaignButton}
  Wait until Page Does Not Contain    Loading
  Wait Until Page Contains            Campaign Creation
  Wait Until Page Contains Element    ${CreateButton}
  Input Text                          ${CampaignNameFeild}           ui_testing_campaign
  Click Element                       ${ModuleDropDown}
  Wait Until Page Contains Element    ${ModuleSelection}
  Click Element                       ${ModuleSelection}
  Click Element                       ${ModelID}
  Wait Until Element Is Enabled       ${ModelID_Option}
  Click Element                       ${ModelID_Option}
  Click Element                       ${LabelerGroup}
  Wait Until Element Is Enabled       ${ui_Lara1}
  Click Element                       ${ui_Lara1}
  Click Element                       ${QAGroup}
  Wait Until Element Is Enabled       ${ui_Lara2}
  Click Element                       ${ui_Lara2}
  Input Text                          ${DescriptionField}            Automated Description of ui_testing_campaign
  Click Element                       ${CreateandAddButton}
  Wait Until Page Contains            Add batch jobs
  Wait Until Page Contains Element    ${ImportButton}
  Wait Until Page Contains Element    ${SequenceCheckbox_1}
  Wait Until Element Is Visible       ${SequenceCheckbox_1}
  Wait Until Element Is Enabled       ${SequenceCheckbox_1}
  Click Element                        ${SequenceCheckbox_1}
  Click Element                       ${SequenceCheckbox_2}
  Click Element                       ${SequenceCheckbox_3}
  Click Element                       ${TasksDropDownButton}
  Wait Until Element Is Enabled       ${TasksDropDownSelection_2}
  Click Element                       ${TasksDropDownButton}
  Wait Until Element Is Enabled       ${TasksDropDownSelection_1}
  Click Element                       ${TasksDropDownSelection_1}
  Click Element                       ${ImportButton}
  Wait Until Page Contains            Description
  Wait Until Page Contains Element    ${StartCampaignButton}
  Wait Until Element Is Enabled       ${StartCampaignButton}
  Click Element                       ${StartCampaignButton}
  Wait until Page Contains Element    ${CreateCampaignButton} 
  Wait Until Page Contains Element    ${DropDown_Userr}
  # Click Element    ${DropDown_Userr}
  # Wait Until Element Is Visible    ${Logout_Button}
  # Wait Until Element Is Enabled    ${Logout_Button}
  # Wait Until Page Contains Element    ${Logout_Button}
  # Click Element    ${Logout_Button}


I login with valid credentials for dario
  Wait until page contains element    ${Username}
  ${json_object}=    Load JSON From File   ${CURDIR}/credentials.json
  Set Test Variable    ${json_object}    ${json_object}
  ${Valid_Username}=    Get Value From Json  ${json_object}    $.users.${env}.dario.validusername
  Input Text    ${Username}    ${Valid_Username[0]}
  ${Valid_Password}=    Get Value From Json  ${json_object}    $.users.${env}.dario.validpassword
  Input Text    ${Password}   ${Valid_Password[0]}
  Click Element    ${Login_Button}

a dario dashboard
  Open Browser  ${SERVER}  ${BROWSER}
  Maximize Browser Window
  Wait until page contains element    ${Username}
  ${json_object}=    Load JSON From File   ${CURDIR}/credentials.json
  Set Test Variable    ${json_object}    ${json_object}
  ${Valid_Username}=    Get Value From Json  ${json_object}    $.users.${env}.dario.validusername
  Input Text    ${Username}    ${Valid_Username[0]}
  ${Valid_Password}=    Get Value From Json  ${json_object}    $.users.${env}.dario.validpassword
  Input Text    ${Password}   ${Valid_Password[0]}
  Click Element    ${Login_Button}
  Wait Until Page Contains    Sequences
  Page Should Contain Element    ${TagButton}
  Page Should Contain    Filter

a lara dashboard
  Open Browser  ${SERVER}  ${BROWSER}
  Maximize Browser Window
  Wait until page contains element    ${Username}
  ${json_object}=    Load JSON From File   ${CURDIR}/credentials.json
  Set Test Variable    ${json_object}    ${json_object}
  ${Valid_Username}=    Get Value From Json  ${json_object}    $.users.${env}.lara.validusername
  Input Text    ${Username}    ${Valid_Username[0]}
  ${Valid_Password}=    Get Value From Json  ${json_object}    $.users.${env}.lara.validpassword
  Input Text    ${Password}   ${Valid_Password[0]}
  Click Element    ${Login_Button}
  Wait until Page Contains    Dashboard

the selected campaign should get deleted
    Wait until Page Contains    Campaigns Deleted

# --- Views ------------------------------------------------------------------


# --- Content ----------------------------------------------------------------
