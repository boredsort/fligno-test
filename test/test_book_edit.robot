*** Settings ***
Resource     ../resources.robot
Resource     ./pages/bookscreate_page.robot
Resource     ./pages/library_page.robot
Resource     ./steps/add_books.robot

Library     SeleniumLibrary
Library     FakerLibrary        locale=en_US   seed=124

Test Setup      Open Main Page using Chrome Browser and Login    
Test Teardown     Close Browser

*** Variables
&{INPUT}            title=''  summary=''   review=''   rating='' condition='' category=''     

*** Test Cases ***
Scenario: Editing with all valid input
    Given The Book table has Entries
    Then Clicked Edit Button
    And Fill out the form completely  
    Click Submit Update Button
    Then Prompted with successfully updated message

Scenario: Editing the title with valid input
    ${title}=             FakerLibrary.Name
    Given The Book table has Entries
    Then Clicked Edit Button
    And Input Title   ${title}  
    Click Submit Update Button
    Then Prompted with successfully updated message

Scenario: Editing with no title 
    Given The Book table has Entries
    Then Clicked Edit Button
    and Clear Title
   # Title tooltip
    # Click Submit Update Button
    # should this find a tooltip message here to test if something is blank

Scenario: Editing with no Summary 
    Given The Book table has Entries
    Then Clicked Edit Button
    and Clear Summary
   # Click Submit Update Button
    # should this find a tooltip message here to test if something is blank    

Scenario: Editing with no Review 
    Given The Book table has Entries
    Then Clicked Edit Button
    and Clear Summary
   # Click Submit Update Button
    # should this find a tooltip message here to test if something is blank   

Scenario: Editing with no Rating 
    Given The Book table has Entries
    Then Clicked Edit Button
    and Clear Summary
   # Click Submit Update Button
    # should this find a tooltip message here to test if something is blank         

*** Keywords ***

Fill out the form completely  
    ${INPUT.title} =        FakerLibrary.Name
    ${INPUT.review} =       FakerLibrary.Paragraph
    ${INPUT.summary} =      FakerLibrary.Paragraph
    ${INPUT.rating} =       FakerLibrary.Random Digit
    And Input the whole form with  &{INPUT}
    
