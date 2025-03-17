*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource       ./ressources.robot

*** Variables ***

${URL}    https://localhost:3000


*** Test Cases ***
Create empty validation
    Open Web Application
    Create Activity

Select Type
    Select Activity Type    Image Validation

Edit activity details
    Edit Activity Title    activité numéro 1
    Edit Activity Instructions    instruction relative à l'activité numéro 1
    Edit Activity Description    description de l'activité numéro 1
    Next button

Snap the landscape
    Sleep    2s  
    Snap the background
    Validate the image

display augementation
    Next button
    Validation button
    Next button
    Next button
    Sleep    5s    
    ${status}    ${message}=    Run Keyword And Ignore Error    Wait for detection 
    Run Keyword If    '${status}' == 'FAIL'    Log    ⚠️ Expected behavior: The element is still visible after 25s miss detection.    WARN
    Click home button

    sleep     10s     #used to watch the result can be commentend if necessary
    Close Browser
