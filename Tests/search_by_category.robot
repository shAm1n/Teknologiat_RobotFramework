*** Settings ***

Library         SeleniumLibrary  timeout=10  implicit_wait=0
Library         BuiltIn
Library         ReactLibrary
Suite Setup     Open browser  http://localhost:3000  chrome
Suite Teardown  Close browser
Resource        ../Resources/keyword.robot

#Automaatiotestin ajo: robot -d results search_by_category.robot
*** Test Cases ***
Searching By Category
    [Documentation]    Search by category and Check result
    [Tags]    Functional
    Maximize Browser Window
    Open Navigation
    Choose Reseptihaku
    Press "Aamiainen" Button
    Check If The Recipe Matches The Category
    Return To Main Page
