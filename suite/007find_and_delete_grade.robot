*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${LOGIN_URL}    http://localhost:5173/
${ID_FILE}      id.txt
${PASSWORD_FILE}    password.txt
${CODE_COURSE}    R1.01 Algorithmique & binaire
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
Navigate to classes
    Click Element    id:grades
    Wait Until Element Is Visible    id:title_grades    10s


find a classe
    Search For A Class
    Input Search Term
    Wait Until Element Is Visible    xpath=//td[text()="${CODE_COURSE}"]
Delete a classe
    Click Element    xpath=//td[text()="${CODE_COURSE}"]/following-sibling::td//button[contains(@class, 'bg-red')]
    Check For Alert
    Reload Page
Make sure deletion is effective
    Search For A Class
    Input Search Term
    Element Should Not Be Visible    xpath=//td[text()="${CODE_COURSE}"]

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
Input Search Term
    Wait Until Element Is Visible   id:search_bar    10s
    Input Text    id:search_bar    ${CODE_COURSE}

Search For A Class
    Execute JavaScript    document.getElementById('search_bar').click()