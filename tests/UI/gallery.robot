*** Settings ***
Library           SeleniumLibrary  timeout=40
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Resource          ../../resources/keywords.robot


*** Variables ***


*** Test Cases ***

Scenario: verify user can access gallery
  Given access model listing page 
  When I choose an item
  Then I should be able to access the gallery

*** Keywords ***

#Given


#When---------------------------------------------------------------------------


#Then---------------------------------------------------------------------------
I should be able to access the gallery
  Mouse Over                       ${gallery}
  Click Element                    ${gallery} 
  Wait Until Element Is Visible    ${exterior}