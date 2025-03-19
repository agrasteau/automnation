*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://localhost:3000

*** Test Cases ***
Open Web Application
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Sleep    2
    Click Element    id=details-button
    Sleep    2
    Click Element    id=proceed-link

    Title Should Be    MIXAP  # Remplacez "Example Page" par le titre attendu de votre page
    Sleep    5   # Attend 5 secondes pour vérifier si la page s'ouvre correctement
    Close All Browsers
