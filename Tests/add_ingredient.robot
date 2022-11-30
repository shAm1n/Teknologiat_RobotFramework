*** Settings ***

Library         SeleniumLibrary  timeout=10  implicit_wait=0
Library         BuiltIn
Suite Setup     Open browser  http://localhost:3000  chrome
Suite Teardown  Close browser
Resource        ../Resources/keyword.robot

#Automaatiotestin ajo: robot -d results add_ingredient.robot
*** Test Cases ***
Adding an ingredient
    [Documentation]    Add New Ingredient and Check if Exists
    [Tags]    Functional
    Maximize Browser Window
    Open Navigation
    Choose Ainekset
    Enter Ingredient
    Check If The Ingredient Is On The List
    Delete The Ingredient
    Check That The Ingredient Is Not On The List
    Return To Main Page
