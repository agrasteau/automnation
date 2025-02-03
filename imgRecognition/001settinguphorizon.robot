*** Settings ***
Library    ImageHorizonLibrary
Library    OperatingSystem

*** Test Cases ***
Lancer Pinball et détecter les flippers
    Run    "C:\\Temp\\Nouveau dossier\\pinball.exe"
    Sleep    3
    ${found1} =    Find    flipper1.png
    Should Be True    ${found1}    ERREUR : Flipper1 non détecté !
    ${found2} =    Find    flipper2.png
    Should Be True    ${found2}    ERREUR : Flipper2 non détecté !