*** Settings ***
Library     SeleniumLibrary

*** Variables ***

${add_button}       book-add
${message}          notif-message
${p_notlogin}       //p[contains(text(),"You ")]
${table_body}       //tbody
@{button_edit}      xpath://button[@id="create-book"]
@{button_delete}    xpath://button[contains(text(),"Delete")]
*** Keywords ***
Library Page Opened
    Wait Until Element Is Enabled  ${add_button}    
    Element Should Be Enabled      ${add_button}
    
Click book add button
    Wait Until Element Is Enabled  ${add_button}  
    Click Button                   ${add_button}  

Prompted with successfully added message
    Wait Until Element Is Enabled  ${message}
    Element Should Be Enabled      ${message}
    Element Should Contain         ${message}    Successfully added

Prompted with successfully signed message
    Wait Until Element Is Enabled  ${message}
    Element Should Be Enabled      ${message}
    Element Should Contain         ${message}    Successfully signed  

Prompted with successfully updated message
    Wait Until Element Is Enabled  ${message}
    Element Should Be Enabled      ${message}
    Element Should Contain         ${message}    Successfully updated  

Prompted with successfully deleted message
    Wait Until Element Is Enabled  ${message}
    Element Should Be Enabled      ${message}
    Element Should Contain         ${message}    Successfully deleted      


Displayed Not logged in message
    Wait Until Element Is Enabled  ${p_notlogin}
    Element Should Be Enabled      ${p_notlogin}

The Book table has Entries
    Wait Until Element Is Enabled  ${table_body} 
    Element Should Be Enabled      ${table_body} 

The Book table has no Entries
    Page Should Not Contain Element   ${table_body}

Clicked Edit Button  
    Click Element               @{button_edit}

Click Delete Button    
    Click Element               @{button_delete} 

Click Edit on the nth Entry        
    [Arguments]                 ${index}
    Click Element               @{button_edit}[${index}]
    # This should be use for dynamic clicking of the edit button. however the index does not seem to work
How many Entries
    ${count} =     Get Element Count    ${button_edit}  
    log     ${count}
    