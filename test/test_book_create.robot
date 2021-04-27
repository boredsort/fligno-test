*** Settings ***
Resource     ../resources.robot
Resource     ./pages/library_page.robot
Resource     ./pages/bookscreate_page.robot
Resource     ./steps/add_books.robot

Documentation     Testing the book create   

Library     SeleniumLibrary
Library     FakerLibrary        locale=en_US   seed=124

Test Setup      Open Main Page using Chrome Browser and Login    
Test Teardown     Close Browser

*** Variables ***
&{INPUT}            title=''  summary=''   review=''   rating='' condition='' category=''

*** Test Cases ***
Scenario: Adding a new Book Entry
    When the User Fill out the form completely
    And Click Submit Add Button
    Then Prompted with successfully added message

Scenario: Adding a new Book with no Title
    When the User Fill out the form without title
    And Click Submit Add Button
    # should this find a tooltip message here to test if something is blank

Scenario: Adding a new Book with no Summary
    When the User Fill out the form without summary
    And Click Submit Add Button
    # should this find a tooltip message here to test if something is blank

Scenario: Adding a new Book with no Review
    When the User Fill out the form without Review
    And Click Submit Add Button
    # should this find a tooltip message here to test if something is blank

Scenario: Adding a new Book with rating as a String
    the User Fill out the form with rating as a String
    And Click Submit Add Button
    Select random Category
    # should this find a tooltip message here to test if something is blank

*** Keywords ***

the User Fill out the form completely  
    ${INPUT.title} =        FakerLibrary.Name
    ${INPUT.review} =       FakerLibrary.Paragraph
    ${INPUT.summary} =      FakerLibrary.Paragraph
    ${INPUT.rating} =       FakerLibrary.Random Digit Not Null Or Empty
    Click book add button
    Input the whole form with     &{INPUT}

the User Fill out the form without title
    the User Fill out the form completely  
    Clear Title
    
the User Fill out the form without summary
    the User Fill out the form completely  
    Clear Summary    

the User Fill out the form without review
    the User Fill out the form completely  
    Clear Review    

the User Fill out the form without rating
    the User Fill out the form completely  
    Clear Rating    

the User Fill out the form with rating as a String
    the User Fill out the form completely  
    Input Rating    FakerLibrary.Word  
    
