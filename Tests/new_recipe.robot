*** Settings ***

Library         SeleniumLibrary  timeout=10  implicit_wait=0
Library         BuiltIn
Library         ReactLibrary
Suite Setup     Open browser  http://localhost:3000  chrome
Suite Teardown  Close browser
Resource        ../Resources/keyword.robot

#Automaatiotestin ajo: robot -d results new_recipe.robot
*** Test Cases ***
Adding a New Recipe
    [Documentation]    Add a New Recipe and Check if Exists
    [Tags]    Functional
    Maximize Browser Window
    Open Navigation
    Choose Tallennus
    Enter Information
    Return To Main Page
    Check If The Recipe Is On The Page
    Delete The Recipe
    Check That The Recipe Is Not On The Page
    Return To Main Page

