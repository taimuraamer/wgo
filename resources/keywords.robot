# This file contains global variables and keywords that are shared across all
# tests. Please do not add any test specific keywords here!

*** Settings ***

Library           SeleniumLibrary  timeout=40
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

access model listing page 
  Open Browser  ${SERVER}models/product/motorhomes/era  ${BROWSER}
  Maximize Browser Window
  Wait until page contains element    ${homepageLogo}

I choose an item
  Wait Until Element Is Visible    ${menuModels}
  Click Element                    ${menuModels}
  Wait Until Page Contains         Class A
  Click Element                    ${journeyCoach}

I see the thank you page
  Wait Until Element Is Visible     ${menuModels}
  Click Element                    ${menuModels}
  Wait Until Page Contains         Class A
  Click Element                    ${journeyCoach}
  Wait Until Element Is Visible    ${shoppingTools}
  Scroll Element Into View         ${downloadBroucherButton}
  Element Should Be Visible        ${downloadBroucherButton}
  Click Element                    ${downloadBroucherButton}
  Wait Until Element Is Visible    ${city}   
  Input Text                       ${firstName}       Test
  Input Text                       ${lastName}        Test
  Input Text                       ${postalCode}      12344
  Input Text                       ${phone}           1234123412
  Input Text                       ${eMail}           asdf@yopmail.com
  Click Element                    ${sendByMail}
  Input Text                       ${addressLine1}    this is the actual address
  Input Text                       ${addressLine2}    this is the actual address
  Input Text                       ${city}            Newyork  
  Click Element                    ${selectCountry}
  Wait Until Element Is Visible    ${selectCountryOption}
  Click Element                    ${selectCountryOption}
  Click Element                    ${selectState}
  Wait Until Element Is Visible    ${selectStateOption}
  Click Element                    ${selectStateOption}
  Click Element                    ${submitButton}
  Wait Until Page Contains         Thank You!
  Wait Until Element Is Visible    ${downloadBroucherPdf}