*** Settings ***

Library         SeleniumLibrary  timeout=10  implicit_wait=0
Library         BuiltIn
Resource       ../Variables/variable.robot

*** Keywords ***
Open Navigation
    Wait Until Page Contains Element    xpath://*[@id="root"]/div/header/div
    Click Button    xpath://*[@id="root"]/div[1]/header/div/button

Choose Ainekset
    Wait Until Page Contains Element    xpath://span[contains(text(), '${drawer_header}')]
    Click Element    xpath://span[contains(text(), '${ingredient_path}')]

Enter Ingredient
    Page Should Contain Textfield    xpath://input
    Click Element    xpath://input
    Input Text     xpath://input    ${ingredient}
    Click Button    xpath://button[contains(text(), '${ingredient_add_button}')]

Check If The Ingredient Is On The List
    Reload Page
    Page Should Contain    ${ingredient}

Delete The Ingredient
    Click Button    //*[@id="root"]/div[2]/ul/ul/li[35]/button

Check That The Ingredient Is Not On The List
    Reload Page
    Page Should Not Contain    ${ingredient}

Choose Reseptihaku
    Wait Until Page Contains Element    xpath://span[contains(text(), '${drawer_header}')]
    Click Element    xpath://span[contains(text(), '${recipe_search_path}')]

Press "Aamiainen" Button
    Wait Until Page Contains Element    xpath://h5[contains(text(), '${recipe_category}')]
    Click Element    xpath://h5[contains(text(), '${recipe_category}')]

Check If The Recipe Matches The Category
    Wait Until Page Contains Element    xpath://span[contains(text(), '${card_description}')]
    Page Should Contain    ${card_description}

Choose Tallennus
    Wait Until Page Contains Element    xpath://span[contains(text(), '${drawer_header}')]
    Click Element    xpath://span[contains(text(), '${add_recipe_path}')]

Enter Information
    Page Should Contain Textfield    xpath://input[@name='${header_input}']
    Click Element    xpath://input[@name='${header_input}']
    Input Text    xpath://input[@name='${header_input}']    ${recipe_header}
    Click Element    xpath://input[@name='${time_input}']
    Input Text    xpath://input[@name='${time_input}']   ${time}
    Click Element    xpath://input[@name='${amount_input}']
    Input Text    xpath://input[@name='${amount_input}']      ${amount}
    Click Element    xpath://div[@id="mui-component-select-katid"]
    Click Element   xpath://li[contains(text(), '${recipe_category}')]
    Click Element    xpath://input[@name='${recipe_desc_input}']
    Input Text    xpath://input[@name='${recipe_desc_input}']     ${recipe_description}
    Click Element    xpath://input[@name='${image_input}']
    Input Text    xpath://input[@name='${image_input}']     ${image}
    Click Button    xpath://button[contains(text(), '${recipe_add_button}')]

Check If The Recipe Is On The Page
    Wait Until Page Contains Element    xpath://span[contains(text(), '${recipe_description}')]
    Page Should Contain    ${recipe_description}

Delete The Recipe
    Click Button    xpath://*[@id="root"]/div[2]/div[7]/div/div[3]/button[1]

Check That The Recipe Is Not On The Page
    Reload Page
    Page Should Not Contain    ${recipe_description}

Return To Main Page
    Wait Until Page Contains Element    xpath://a[contains(text(), '${main_header}')]
    Click Element    xpath://a[contains(text(), '${main_header}')]