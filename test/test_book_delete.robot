*** Settings ***
Resource     ../resources.robot
Resource     ./pages/library_page.robot

Documentation     Testing the book create   

Library     SeleniumLibrary

Test Setup      Open Main Page using Chrome Browser and Login    
Test Teardown     Close Browser

*** Test Cases ***

Scenario: Delete a Book Entry
     Given The Book table has Entries
     When Click Delete Button
     Then Prompted with successfully deleted message
