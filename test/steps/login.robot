*** Settings ***
Resource         ../pages/login_page.robot

*** Keywords ***
Input Username and Password
    [Arguments]        ${username}    ${password}
    Input Username             ${username} 
    Login Button Should Be Enabled
    Input Password             ${password}
   