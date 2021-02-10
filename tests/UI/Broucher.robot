*** Settings ***
Library           SeleniumLibrary  timeout=40
Library           JSONLibrary
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Resource          ../../resources/keywords.robot


*** Variables ***


*** Test Cases ***

Scenario: verify user can access models from the menu
  Given access model listing page 
   When I download the broucher
   Then I should see the broucher being loaded



*** Keywords ***

#Given


#When---------------------------------------------------------------------------
I download the broucher
  Wait Until Element Is Visible    ${downloadBroucherButton}
  Click Element    ${downloadBroucherButton}
  Wait Until Element Is Visible    ${downloadBroucherModal}
  Input Text    
#Then---------------------------------------------------------------------------