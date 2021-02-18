*** Settings ***
Library           SeleniumLibrary  timeout=40
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Resource          ../../resources/keywords.robot


*** Variables ***


*** Test Cases ***

Scenario: verify user can access specifications
  Given access model listing page 
  When I choose an item
  Then I should be able to access the specifications


*** Keywords ***

#Given


#When---------------------------------------------------------------------------


#Then---------------------------------------------------------------------------
I should be able to access the specifications
  Mouse Over                       ${specifications}
  Click Element                    ${specifications} 
  Wait Until Page Contains         Specifications
