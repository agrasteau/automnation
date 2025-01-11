*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${LOGIN_URL}    http://localhost:5173/
${ID_FILE}      id.txt
${PASSWORD_FILE}    password.txt
${CODE_COURSE}    R1.01
${NAME_COURSE}    Algorithmique
${CREDITS}        3
${DESCRIPTION}    Cours sur les bases de l'algorithmique.
${STUDENT}              string string
${COURSE}               string
${GRADE}                10
${SEMESTER}             1
${ACADEMIC_YEAR}        2022-2023

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
    Click Element    id:grades
    Wait Until Element Is Visible    id:title_grades    10s
Click button new classes
    Click Element    id:new_grade
    Wait Until Element Is Visible    id:new_grade_title    10s
Filling Grade Form
    [Documentation]    Remplit le formulaire pour ajouter une nouvelle note avec les données fournies.
    
    # Vérifier que le titre du formulaire est visible
    Wait Until Element Is Visible    id:new_grade_title    10s   
    Execute JavaScript    document.getElementById('student').click()
    Input Text    id:student    ${STUDENT}

    Sleep    10
    Execute JavaScript    var option = document.evaluate("//div[@role='listbox']//div[contains(@class, 'v-list-item')][1]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue; if (option) option.click();

    Wait Until Page Contains    String String    10s

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
