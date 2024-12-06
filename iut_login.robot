*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${LOGIN_URL}   https://webmail.univ-lemans.fr/

*** Test Cases ***
Login Using Credentials From File
    [Documentation]    Logs into the website using credentials from a text file.

    ${content}=    Get File    credentials.txt
    