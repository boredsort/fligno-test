*** Settings ***
Library        SeleniumLibrary
Resource       ./navbar_links.robot

*** Variables ***
${LINK_HOME}                 //a[contains(text(),"Library")]
${LINK_BOOKS}                //a[contains(text(),"Books")]
${LINK_LOGIN}                //a[contains(text(),"Log In")]
${LINK_SIGNUP}               //a[contains(text(),"Sign Up")]

${FIELD_USERNAME}            id_username
${FIELD_EMAIL}               id_email
${FIELD_PASSWORD1}           id_password1
${FIELD_PASSWORD2}           id_password2
${BUTTON_SIGNUP}             //button[contains(text(),"Sign ")]

${ERROR_PASSWORD1}           error_1_id_password1
${ERROR_PASSWORD2}           error_1_id_password2

*** Keywords ***        
Sign Up Page Opened
    Wait Until Element Is Visible            ${FIELD_USERNAME}  
    Element Should Be Visible                ${FIELD_USERNAME}
    Wait Until Element Is Visible            ${FIELD_EMAIL}  
    Element Should Be Visible                ${FIELD_EMAIL}    
    Wait Until Element Is Visible            ${FIELD_PASSWORD1}  
    Element Should Be Visible                ${FIELD_PASSWORD1}
    Wait Until Element Is Visible            ${FIELD_PASSWORD2}  
    Element Should Be Visible                ${FIELD_PASSWORD2}    
    Wait Until Element Is Visible            ${BUTTON_SIGNUP}  
    Element Should Be Visible                ${BUTTON_SIGNUP}
    Navbar Links is ready

Input Username
    [Arguments]                              ${username}
    Wait Until Element Is Visible            ${FIELD_USERNAME}  
    Input Text                               ${FIELD_USERNAME}      ${username}

Input Email
    [Arguments]                              ${email}
    Wait Until Element Is Visible            ${FIELD_EMAIL}  
    Input Text                               ${FIELD_EMAIL}      ${email}

Input Password 1
    [Arguments]                              ${password1}
    Wait Until Element Is Visible            ${FIELD_PASSWORD1}  
    Input Text                               ${FIELD_PASSWORD1}      ${password1}

Input Password 2
    [Arguments]                              ${password2}
    Wait Until Element Is Visible            ${FIELD_PASSWORD2}  
    Input Text                               ${FIELD_PASSWORD2}      ${password2}

Click Login Button
    Wait Until Element Is Enabled            ${BUTTON_SIGNUP}
    Click Element                            ${BUTTON_SIGNUP}

