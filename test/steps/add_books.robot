*** Settings ***
Resource    ../pages/bookscreate_page.robot

*** Keywords ***
    
Input the whole form with      
    [Arguments]                &{input}
    Input Title                 ${input}[title]
    Input Summary               ${input}[summary]
    Input Review                ${input}[review]
    Input Rating                ${input}[rating]
    Select a Category           2
    Select the condition        1