*** Settings ***
Resource    ../pages/bookscreate_page.robot

Library    FakerLibrary
*** Keywords ***
    
Input the whole form with      
    [Arguments]                &{input}
    Input Title                 ${input}[title]
    Input Summary               ${input}[summary]
    Input Review                ${input}[review]
    Input Rating                ${input}[rating]
    Select random Category
    Select the condition        1

Randomise Category Selection
    ${cat}        Select random Category
    Select From List By Value    id

Select random Category
    ${len}=     Get Category Count   
    ${steps}    Random Digit
    ${val}=     Random Int    min=1   max=${len}  step=${steps}
    Select a Category    ${val}
    log                 ${val}
    log                 ${steps}
#    &{valuelist}=      Get Category Values
#    ${randomvalue}=    Random Element    &{valuelist}
#    [Return]        ${randomvalue}

