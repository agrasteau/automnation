*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${LOGIN_URL}    http://localhost:5173/
${ID_FILE}      id.txt
${PASSWORD_FILE}    password.txt
${wrongUsername}=    1234
${wrongPassword}=    1234

*** Test Cases ***
Login Using Credentials From File
    [Documentation]    Logs into the website using credentials from separate files for ID and password.

    # Step 1: Read credentials from the files
    ${username}=    Get File    ${ID_FILE}
    ${password}=    Get File    ${PASSWORD_FILE}

    # Step 2: Open the login page
    Open Browser    ${LOGIN_URL}    ff

    # Step 3: Fill in the login form
    Input Text    id:id    ${username.strip()}
    Input Text    id:password    ${password.strip()}
    Click Button    id:login
    Wait Until Page Contains    Etudiants    10  

Login Using bad id
    [Documentation]    Logs into the website using credentials from separate files for ID and password.
    # Step 1: Read credentials from the files
    ${password}=    Get File    ${PASSWORD_FILE}

    # Step 2: Open the login page
    Open Browser    ${LOGIN_URL}    ff

    # Step 3: Fill in the login form
    Input Text    id:id    ${wrongUsername.strip()}
    Input Text    id:password    ${password.strip()}
    Click Button    id:login
    #Wait Until Page Contains    students    10

Login Using bad password
    [Documentation]    Logs into the website using credentials from separate files for ID and password.
    # Step 1: Read credentials from the files
    ${password}=    Get File    ${PASSWORD_FILE}

    # Step 2: Open the login page
    Open Browser    ${LOGIN_URL}    ff

    # Step 3: Fill in the login form
    Input Text    id:id    ${wrongUsername.strip()}
    Input Text    id:password    ${password.strip()}
    Click Button    id:login
    #Wait Until Page Contains    students    10

