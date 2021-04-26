*** Settings ***
Library        SeleniumLibrary
Resource       ./navbar_links.robot
*** Variables ***
${FIELD_USERNAME}            id_login
${FIELD_PASSWORD}            id_password
${BUTTON_SUBMIT}             //button[contains(text(),"Log ")]
                             #not sure why is this not working //button[@type='submit']
${LINK_HOME}                 //a[contains(text(),"Library")]
${LINK_BOOKS}                //a[contains(text(),"Books")]
${LINK_LOGIN}                //a[contains(text(),"Log In")]
${LINK_SIGNUP}               //a[contains(text(),"Sign Up")]
${ERROR_MESSAGE}             //div/ul/li[contains(text(),"The ")]

*** Keywords ***        
Login Page Opened
    Wait Until Element Is Visible            ${FIELD_USERNAME}  
    Element Should Be Visible                ${FIELD_USERNAME}  
    Wait Until Element Is Visible            ${FIELD_PASSWORD}  
    Element Should Be Visible                ${FIELD_PASSWORD}  
    Wait Until Element Is Visible            ${BUTTON_SUBMIT}  
    Element Should Be Visible                ${BUTTON_SUBMIT}
    Navbar Links is ready

Input Username
    [Arguments]                              ${username}
    Wait Until Element Is Visible            ${FIELD_USERNAME}  
    Input Text                               ${FIELD_USERNAME}      ${username}

Input Password
    [Arguments]                              ${password}
    Wait Until Element Is Visible            ${FIELD_PASSWORD}  
    Input Text                               ${FIELD_PASSWORD}      ${password}

Click Login Button
    Wait Until Element Is Enabled            ${BUTTON_SUBMIT}
    Click Element                            ${BUTTON_SUBMIT}

Error Message Displayed
    Wait Until Element Is Enabled            ${ERROR_MESSAGE}
    Element Should Be Visible                ${ERROR_MESSAGE}

Login Button Should Be Enabled
   Wait Until Element Is Enabled              ${BUTTON_SUBMIT}
   Element Should Be Enabled                  ${BUTTON_SUBMIT}