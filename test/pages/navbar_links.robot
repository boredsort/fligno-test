*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${LINK_HOME}                 //a[contains(text(),"Library")]
${LINK_BOOKS}                //a[contains(text(),"Books")]
${LINK_LOGIN}                //a[contains(text(),"Log In")]
${LINK_SIGNUP}               //a[contains(text(),"Sign Up")]

*** Keywords ***
Navbar Links is ready
    Wait Until Element Is Visible            ${LINK_HOME}  
    Element Should Be Visible                ${LINK_HOME}  
    Wait Until Element Is Visible            ${LINK_BOOKS}  
    Element Should Be Visible                ${LINK_BOOKS}  
    Wait Until Element Is Visible            ${LINK_SIGNUP}  
    Element Should Be Visible                ${LINK_SIGNUP} 
    Wait Until Element Is Visible            ${LINK_LOGIN}  
    Element Should Be Visible                ${LINK_LOGIN}   


Click Library Link
    Wait Until Element Is Enabled            ${LINK_HOME}
    Click Element                            ${LINK_HOME}

Click Books Link
    Wait Until Element Is Enabled            ${LINK_BOOKS}
    Click Element                            ${LINK_BOOKS}

Click Login Link
    Wait Until Element Is Enabled            ${LINK_LOGIN}
    Click Element                            ${LINK_LOGIN}

Click Signup Link
    Wait Until Element Is Enabled            ${LINK_SIGNUP}
    Click Element                            ${LINK_SIGNUP}


