*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${LOGIN_URL}    http://localhost:5173/
${ID_FILE}      id.txt
${PASSWORD_FILE}    password.txt
${CODE_COURSE}    R1.011
${NAME_COURSE}    Algorithmique
${CREDITS}        3
${DESCRIPTION}    Cours sur les bases de l'algorithmique.

*** Test Cases ***
Login Using Credentials From File
    [Documentation]    Logs into the website using credentials from separate files for ID and password.

    # Step 1: Read credentials from the files
    ${username}=    Get File    ${ID_FILE}
    ${password}=    Get File    ${PASSWORD_FILE}

    # Step 2: Open the login page
    Open Browser    ${LOGIN_URL}    chrome

    # Step 3: Fill in the login form
    Input Text    id:id    ${username.strip()}
    Input Text    id:password    ${password.strip()}
    Click Button    id:login
    Wait Until Page Contains    students    10  


Navigate to classes
    Click Element    id:classes
    Wait Until Element Is Visible    id:title_classes    10s
Click button new classes
    Click Element    id:new_classe
    Wait Until Element Is Visible    id:new_course_title    10s

Filling form
    # Remplir le champ "Code du cours"
    Input Text    id:course_code    ${CODE_COURSE}

    # Remplir le champ "Nom du cours"
    Input Text    id:course_name    ${NAME_COURSE}

    # Remplir le champ "Crédits"
    Input Text    id:course_credits    ${CREDITS}

    # Remplir le champ "Description"
    Input Text    id:course_description    ${DESCRIPTION}

    # Vérifier et cliquer sur le bouton "Ajouter"
    Wait Until Element Is Enabled    id:submit_button    10s
    Click Button    id:submit_button
    Wait Until Element Is Visible    id:title_classes    10s

Logout
    Click Element    id:logout
    Wait For Alert    timeout=10


*** Keywords ***
Wait For Alert
    [Arguments]    ${timeout}=10
    Wait Until Keyword Succeeds    ${timeout}s    1s    Check For Alert
Check For Alert
    ${alert_present}=    Run Keyword And Return Status    Alert Should Be Present
    Run Keyword If    not ${alert_present}    Fail    Alert did not appear within timeout