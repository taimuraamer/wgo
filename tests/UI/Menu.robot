*** Settings ***
Library           SeleniumLibrary  timeout=40
Library           JSONLibrary
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Resource          ../../resources/keywords.robot


*** Variables ***


*** Test Cases ***

Scenario: verify user can access models from the menu
  Given access wgo
   When I access models from the menu
   Then I should see models being loaded

Scenario: verify user can access shopping tools from the menu
  Given access wgo
   When I access shopping tools from the menu
   Then I should see shopping tools being loaded

Scenario: verify user can access lifestyle from the menu
  Given access wgo
   When I access lifestyle from the menu
   Then I should see lifestyle being loaded

Scenario: verify user can access owners from the menu
  Given access wgo
   When I access owners from the menu
   Then I should see owners being loaded

Scenario: verify user can access about us from the menu
  Given access wgo
   When I access about us from the menu
   Then I should see about us being loaded

*** Keywords ***

#Given


#When---------------------------------------------------------------------------
I access models from the menu
  Wait Until Page Contains Element    ${menuModels}
  Click Element    ${menuModels}

I access shopping tools from the menu
  Wait Until Element Is Visible    ${menuShoppingTools}
  Click Element    ${menuShoppingTools}

I access lifestyle from the menu
  Wait Until Element Is Visible    ${menuLifestyle}
  Click Element    ${menuLifestyle}

I access owners from the menu
  Wait Until Element Is Visible    ${menuOwners}
  Click Element    ${menuOwners}

I access about us from the menu
  Wait Until Element Is Visible    ${menuAboutUs}
  Click Element    ${menuAboutUs}

#Then---------------------------------------------------------------------------
I should see models being loaded
  Wait Until Element Is Visible    ${modelItems}
  Wait Until Element Is Visible    ${modelDetails}

I should see shopping tools being loaded
  Wait Until Element Is Visible    ${parts&Service}
  Wait Until Element Is Visible    ${shoppingToolsOverview}
  Page Should Contain    Locate A Dealer
  
I should see lifestyle being loaded
  Wait Until Page Contains    Overview
  Wait Until Page Contains    WinnebagoLife
  Wait Until Page Contains    Communities
  Wait Until Page Contains    Outdoor Adventures
  Wait Until Page Contains    Winnebago Gear

I should see owners being loaded
  Wait Until Page Contains    Overview
  Wait Until Page Contains    Owner Tools
  Wait Until Page Contains    WIT Club
  Wait Until Page Contains    Grand National Rally
  Wait Until Page Contains    Owner Events
  Wait Until Page Contains    On The Road Again

I should see about us being loaded
  Wait Until Page Contains    Who We Are
  Wait Until Page Contains    Factory Tours
  Wait Until Page Contains    Investors
  Wait Until Page Contains    Winnebago Industries