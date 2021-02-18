*** Settings ***
Library           SeleniumLibrary  timeout=40
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Resource          ../../resources/keywords.robot


*** Variables ***


*** Test Cases ***

Scenario: verify user can access download broucher button
  Given access model listing page 
   When I choose an item
   Then I sould see the download a broucher

Scenario: verify user can access download broucher request
  Given access model listing page 
   When I click download broucher button
   Then I should see the download brochure request

Scenario: verify user can submit download broucher request
  Given access model listing page 
   When I fill the form
   Then I should see the thank you page

Scenario: verify user can download the broucher
  Given access model listing page 
   When I see the thank you page
   Then I should be able to download broucher

*** Keywords ***

#Given


#When---------------------------------------------------------------------------
I click download broucher button
  Wait Until Element Is Visible    ${menuModels}
  Click Element                    ${menuModels}
  Wait Until Page Contains         Class A
  Click Element                    ${journeyCoach}
  Wait Until Element Is Visible    ${shoppingTools}
  Scroll Element Into View         ${downloadBroucherButton}
  Element Should Be Visible        ${downloadBroucherButton} 

I fill the form
  Wait Until Element Is Visible     ${menuModels}
  Click Element                    ${menuModels}
  Wait Until Page Contains         Class A
  Wait Until Element Is Visible    ${journeyCoach}
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

#Then---------------------------------------------------------------------------
I sould see the download a broucher
  Wait Until Element Is Visible    ${shoppingTools}
  Scroll Element Into View         ${downloadBroucherButton}
  Element Should Be Visible        ${downloadBroucherButton} 

I should see the download brochure request  
  Click Element                    ${downloadBroucherButton}
  Wait Until Page Contains         Download Brochure Request

I should see the thank you page
  Wait Until Page Contains        Thank You!
  Wait Until Element Is Visible   ${downloadBroucherPdf}

I should be able to download broucher
  Click Element                   ${downloadBroucherPdf}
  Sleep                           15s

