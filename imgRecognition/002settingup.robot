*** Settings ***
Library    Process

*** Test Cases ***
Lancer Pinball et détecter les éléments visuels
    Run    "C:\\Temp\\Nouveau dossier\\pinball.exe"
    Sleep    3
    Vérifier Image Présente    flipper1.png
    Vérifier Image Présente    flipper2.png
    Vérifier Image Présente    bouton_start.png
    Vérifier Image Présente    score_zone.png

*** Keywords ***
Vérifier Image Présente
    [Arguments]    ${image_path}
    ${result} =    Run Process    python    detect_image.py    ${image_path}
    Should Be Equal As Integers    ${result.rc}    0    ERREUR : L'image ${image_path} n'a pas été détectée !
