*** Settings ***
Resource              ../resources.robot
Resource              ./steps/login.robot
Resource              ./pages/library_page.robot
Resource              ./pages/bookscreate_page.robot
Documentation         Testing the signup page

Library               SeleniumLibrary

Test Setup            Open Login Page using Chrome Browser
Test Teardown         Close Browser

*** Variables ***
${VALID_USERNAME}           admin1500
${VALID_PASSWORD}           password1500
${INVALID}                  wrongpass
*** Test Cases ***
Scenario: Loging in with correct Credentials
    Given Login Page Opened
    When Input Username and Password    ${VALID_USERNAME}    ${VALID_PASSWORD} 
    And Click Login Button
    Then Library Page Opened
    And Prompted with successfully signed message

Scenario: Loging in with correct username but invalid password
   Given Login Page Opened
   When Input Username and Password    ${VALID_USERNAME}    ${INVALID}
   And Click Login Button
   Then Error Message Displayed

Scenario: Logging in with invalid Credentials 
   Given Login Page Opened
   When Input Username and Password    ${INVALID}    ${INVALID}
   And Click Login Button
   Then Error Message Displayed   

Scenario: Skipping Login page by Click Library Link
   Given Login Page Opened
   When Click Library Link
   Then Displayed Not logged in message

Scenario: Skipping Login page by changing url to /library/books/create
   Given Login Page Opened
   When Open Books create Page using Chrome Browser
   Then Displayed 404 Message  