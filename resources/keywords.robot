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

access model listing page 
  Open Browser  ${SERVER}models/product/motorhomes/era  ${BROWSER}
  Maximize Browser Window
  Wait until page contains element    ${homepageLogo}


