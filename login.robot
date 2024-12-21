*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${LOGIN_URL}    http://localhost:5173/
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
    Input Text    id:id    ${username.strip()}
    Input Text    id:password    ${password.strip()}
    Click Button    id:login
    Wait Until Page Contains    students    10  


Navigate to classes
    Click Element    id:classes
    Wait Until Page Contains    classes    10  
Navigate to students
    Click Element    id:students
    Wait Until Page Contains     students    10  
    
Navigate to grades
    Click Element    id:grades
    Wait Until Page Contains    grades    10  
Navigate to stats
    Click Element    id:stats
    Wait Until Page Contains    stats    10  

Logout
    Click Element    id:logout
    Wait For Alert    timeout=10


#     # Step 4: Verify successful login
#     Wait Until Element Is Visible    id:messagelist  10  # Ensure the table is visible

#     # Step 5: Click on the first unread message
#     Click Element    xpath=//table[@id="messagelist"]//tbody//tr[contains(@class, "message unread")][1]

*** Keywords ***
Wait For Alert
    [Arguments]    ${timeout}=10
    Wait Until Keyword Succeeds    ${timeout}s    1s    Check For Alert
Check For Alert
    ${alert_present}=    Run Keyword And Return Status    Alert Should Be Present
    Run Keyword If    not ${alert_present}    Fail    Alert did not appear within timeout