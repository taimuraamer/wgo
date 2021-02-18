*** Settings ***
Library           SeleniumLibrary  timeout=40
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Resource          ../../resources/keywords.robot


*** Variables ***


*** Test Cases ***

Scenario: Verify user can access locate a dealer page
  Given access model listing page
  When I see the thank you page
  Then I should be able to access locate a dealer page

Scenario: Verify user can locate a dealer
  Given access model listing page
  When I access the locate a dealer page
  Then I should be able to locate a dealer

*** Keywords ***

#Given


#When---------------------------------------------------------------------------

I access the locate a dealer page
  Wait Until Element Is Visible    ${menuModels}
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
  Input Text                       ${City}      Newyork  
  Click Element                    ${selectCountry}
  Wait Until Element Is Visible    ${selectCountryOption}
  Click Element                    ${selectCountryOption}
  Click Element                    ${selectState}
  Wait Until Element Is Visible    ${selectStateOption}
  Click Element                    ${selectStateOption}
  Click Element                    ${submitButton}
  Wait Until Page Contains         Thank You!
  Wait Until Element Is Visible    ${downloadBroucherPdf}
  Click Element                    ${locateDealer}
  Wait Until Page Contains         Locate a Dealer

#Then---------------------------------------------------------------------------
I should be able to access locate a dealer page
  Click Element                   ${locateDealer}
  Wait Until Page Contains        Locate a Dealer

I should be able to locate a dealer
  Wait Until Element Is Visible   ${selectClass}
  Click Element                   ${selectClass}
  Wait Until Element Is Visible   ${classA}
  Click Element                   ${classA}
  Click Element                   ${selectModel}
  Wait Until Element Is Visible   ${journey}
  Click Element                   ${journey}
  Input Text                      ${dealerCity}    Newyork
  Click Element                   ${searchCity}
  Wait Until Page Contains        GENERAL RV CENTER