*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${LOGIN_URL}    https://webmail.univ-lemans.fr/
${ID_FILE}      id.txt
${PASSWORD_FILE}    password.txt

*** Test Cases ***
Login Using Credentials From File
    [Documentation]    Logs into the website using credentials from separate files for ID and password.

    # Step 1: Read credentials from the files
    ${username}=    Get File    ${ID_FILE}
    ${password}=    Get File    ${PASSWORD_FILE}

    # Step 2: Open the login page
    Open Browser    ${LOGIN_URL}    chrome

    # Step 3: Fill in the login form
    Input Text    id:username    ${username.strip()}
    Input Text    id:password    ${password.strip()}
    Click Button    xpath=//button[@name="submit"]
opening first unread mail

    # Step 4: Verify successful login
    Wait Until Element Is Visible    id:messagelist  10  # Ensure the table is visible

    # Step 5: Click on the first unread message
    Click Element    xpath=//table[@id="messagelist"]//tbody//tr[contains(@class, "message unread")][1]


