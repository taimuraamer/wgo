*** Settings ***
Library           SeleniumLibrary  timeout=40
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Resource          ../../resources/keywords.robot


*** Variables ***


*** Test Cases ***

Scenario: verify user can access floorplans
  Given access model listing page 
  When I choose an item
  Then I should be able to access the floorplans


*** Keywords ***

#Given


#When---------------------------------------------------------------------------


#Then---------------------------------------------------------------------------
I should be able to access the floorplans
  Mouse Over                       ${floorPlans}
  Click Element                    ${floorPlans} 
  Wait Until Page Contains         Floorplans