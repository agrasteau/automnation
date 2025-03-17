*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource       ./ressources.robot

*** Variables ***

${URL}    https://localhost:3000


${FILE_PATH_1}    ${EXECDIR}tests/assets/annoter.png
${FILE_PATH_2}    ${EXECDIR}/assets/annoter.png

*** Test Cases ***

Create empty validation
    Open Web Application
    Create Activity

Select Type
    Select Activity Type    Associating 2 Images
    
Edit activity details
    Edit Activity Title    activité numéro 1
    Edit Activity Instructions    instruction relative à l'activité numéro 1
    Edit Activity Description    description de l'activité numéro 1
    Next button
    
Snap the landscape
    Sleep    2s  
    Snap the background
    Validate the image
upload the 2nd image
    [Documentation]    upload the 2nd image using button and uploading methods, test could fail if you start them inside the /tests/ folder instead of the main folder due to the path management.

    Next button
    Click Button    xpath=//button[span[contains(text(), 'Add image number 2')]]
    Wait Until Element Is Visible    xpath=//button[contains(., 'Click here to upload an image.')]    10s
    #Log    ${EXECDIR}    console=true    #used to know the exec dir that may change in the future, test could fail if you start them inside the /tests/ folder instead of the main folder.
    Choose File    xpath=//input[@type='file']    ${EXECDIR}/tests/assets/annoter.png
    #Click Element    xpath=//button[contains(., 'Click here to upload an image.')]

validate the media

    Next button
    Validation button     #⚠️sometimes infinite loading occures without explaination and it may requires to restart the tests
    Next button
display augementation

    Sleep    5s
    #Wait for detection 
    

    ${status}    ${message}=    Run Keyword And Ignore Error    Wait for detection 
    Run Keyword If    '${status}' == 'FAIL'    Log    ⚠️ Expected behavior: The element is still visible after 25s miss detection.    WARN
    Click home button

    sleep     10s
    Close Browser
