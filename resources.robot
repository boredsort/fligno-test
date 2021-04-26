*** Settings ***
Library    SeleniumLibrary

Resource  ./test/steps/login.robot
Resource  ./test/pages/navbar_links.robot

*** Variables ***
${mainpage}       http://localhost:8000/library/
${loginpage}      http://localhost:8000/accounts/login


*** Keywords ***
Open Main Page using Chrome Browser
    Open Browser    ${mainpage}    Chrome
    Maximize Browser Window
 
Open Login Page using Chrome Browser
    Open Browser    ${loginpage}    Chrome
    Maximize Browser Window

Open Main Page using Chrome Browser and Login
    Open Main Page using Chrome Browser
    Click Login Link
    Input Username and Password    admin1500    password1500
    Click Login Button

Open Books create Page using Chrome Browser
    Open Browser    ${mainpage}books/create    Chrome