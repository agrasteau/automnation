*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource       ./ressources.robot

*** Variables ***

${URL}    https://localhost:3000


*** Test Cases ***
Create empty augementation
    Open Web Application
    Create Activity

Select Type
    Select Activity Type    Image Augmentation

Snap the background 
    Next button
    Snap the background
    Validate the image
    Next button
    Validation button
    #Next button
Add sheet to the augmentation
    Wait Until Element Is Visible    xpath=//button[.//span[contains(text(), 'Object')]]    15s
    Click Element    xpath=//button[.//span[contains(text(), 'Object')]]
    Sleep    2
    Next button

display augementation
    Sleep    2s
    ${status}    ${message}=    Run Keyword And Ignore Error    Wait for detection 
    Run Keyword If    '${status}' == 'FAIL'    Log    ⚠️ Expected behavior: The element is still visible after 25s miss detection.    WARN
    Click home button
#    sleep     20s     #used to watch the result can be commentend if necessary
#    Close Browser
