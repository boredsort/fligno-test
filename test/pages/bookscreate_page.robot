*** Settings ***
Library     SeleniumLibrary
Library     FakerLibrary
*** Variables ***

${field_title}         id_title
${field_summary}       id_summary
${field_review}        id_review
${field_rating}        id_rating
${select_category}     id_category
${radio_condition}     //input[@type="radio"]

${button_add_submit}   btn_submit
${toolt}               css:.tooltip-inner
${tooltip}             //*[@class="tooltip-inner"]
@{category_options}    //select/option


${404message}          //h1[contains(text(),"Page ")]
*** Keywords ***
Add book page is Opened
    Wait Until Element Contains    ${field_title}    
    Element Should Be Enabled      ${field_title}
    Wait Until Element Contains    ${field_summary}    
    Element Should Be Enabled      ${field_summary}
    Wait Until Element Contains    ${field_review}    
    Element Should Be Enabled      ${field_review}
    Wait Until Element Contains    ${field_rating}    
    Element Should Be Enabled      ${field_rating}
    Wait Until Element Contains    ${button_submit}    
    Element Should Be Enabled      ${button_submit}
    
Input Title 
    [Arguments]                    ${title}
    Wait Until Element Is Enabled  ${field_title}  
    Input Text                     ${field_title}         ${title}

 Input Summary 
    [Arguments]                    ${summary}
    Wait Until Element Is Enabled  ${field_summary}  
    Input Text                     ${field_summary}         ${summary}   

Input Review 
    [Arguments]                    ${review}
    Wait Until Element Is Enabled  ${field_review}  
    Input Text                     ${field_review}         ${review}

Input Rating 
    [Arguments]                    ${rating}
    Wait Until Element Is Enabled  ${field_rating}  
    Input Text                     ${field_rating}         ${rating} 

Click Submit Add Button
    Wait Until Element Is Enabled  ${button_add_submit}
    Click Button                   ${button_add_submit}

 Click Submit Update Button
    Wait Until Element Is Enabled  ${button_add_submit}
    Click Button                   ${button_add_submit}   

Select a Category
    [Arguments]                    ${value}
    Select From List By Value      ${select_category}      ${value}

Select the condition
    [Arguments]                    ${value}
    Select Radio Button            condition    ${value}

Get Category values 
    @{values}=          Get Selected List Values    ${select_category}
    [Return]            @{values}
    
Error message
    Wait Until Element Is Visible  ${tooltip}    
    Get Text                       ${tooltip}

Clear Title
    Clear Element Text             ${field_title}

Clear Summary
    Clear Element Text             ${field_summary}

Clear Review
    Clear Element Text             ${field_review}

Clear Rating
    Clear Element Text             ${field_rating}           

Displayed 404 message   
    Wait Until Element Is Enabled  ${404message}  
    Element Should Contain         ${404message}  Page not found

Title tooltip
    Mouse Over                        ${field_title}    
    Wait Until Element Is Visible    ${toolt}  

#Select random Category
 #   ${sel}=     Random Choices    @{category_options}
  #  Select a Category    ${sel}

Get Category Count
    ${count}    Get Element Count    ${category_options}
    [Return]    ${count}