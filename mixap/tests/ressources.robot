*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://localhost:3000


*** Keywords ***
Bypass https alert
    [Documentation]    passe l'alerte de certificat https invalide
    Sleep    2
    Click Element    id=details-button
    Sleep    2
    Click Element    id=proceed-link

Set Chrome Options
    [Documentation]    Défini les paramètres du navigateur au besoin décommenter la ligne pour utiliser un flux caméra fictif
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --use-fake-ui-for-media-stream
    #Call Method    ${options}    add_argument    --use-fake-device-for-media-stream    #display a fake video if the machine doesnt have any camera
    ${prefs}=    Create Dictionary    profile.default_content_setting_values.media_stream_camera=1    profile.default_content_setting_values.media_stream_mic=1
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    [Return]    ${options}

Open Web Application
    [Documentation]    ouvre le site avec le navigateur chrome en suivant les paramètres
    ${chrome_options}=    Set Chrome Options
    Close All Browsers
    Open Browser    ${URL}    chrome    options=${CHROME_OPTIONS}
    Wait Until Element Is Visible    id=details-button    timeout=10s
    Click Element    id=details-button
    Wait Until Element Is Visible    id=proceed-link    timeout=10s
    Click Element    id=proceed-link
    Title Should Be    MIXAP    timeout 10s
    Wait Until Element Is Visible    xpath=//button[span[text()='Activity']]
Open Web Application without closing
    [Documentation]    ouvre le site avec le navigateur chrome en suivant les paramètres
    ${chrome_options}=    Set Chrome Options
    Open Browser    ${URL}    chrome    options=${CHROME_OPTIONS}
    Wait Until Element Is Visible    id=details-button    timeout=10s
    Click Element    id=details-button
    Wait Until Element Is Visible    id=proceed-link    timeout=10s
    Click Element    id=proceed-link
    Title Should Be    MIXAP    timeout 10s
    Wait Until Element Is Visible    xpath=//button[span[text()='Activity']]

Create Activity
    [Documentation]    clic sur le bouton création d'activité
    Click Element    xpath=//button[span[text()='Activity']]
    Wait Until Element Is Visible    xpath=//div[h5[text()='Image Augmentation']]

Next button
    [Documentation]    clic sur le bouton suivant en bas a droite de l'application pour passer a l'étape suivante.
    Wait Until Element Is Visible    xpath=//button[span/span[contains(@class, 'anticon-arrow-right')]]   5s
    Click Element    xpath=//button[span/span[contains(@class, 'anticon-arrow-right')]]

Snap the background
    [Documentation]    take the photo of the background used to display medias on
    Sleep    2s  
    #Click Element    xpath=//button[div/div[text()='Cliquer ici pour prendre une photo.']]
    Wait Until Element Is Visible    xpath=//button[.//span[contains(@class, 'anticon-camera')]]
    Click Element    xpath=//button[.//span[contains(@class, 'anticon-camera')]]
    Sleep    3s
    Click Element    xpath=//div[contains(@class, 'ant-space')]/div[2]//button[.//span[contains(@class, 'anticon-camera')]]

Select Activity Type
    [Documentation]    Select the activity type using a parameter 
    [Arguments]    ${activity_type}
    Click Element    xpath=//div[h5[text()='${activity_type}']]
    Wait Until Element Is Visible    xpath=//span[@id='title_editor']/div[@role='button']


Validate the image
    [Documentation]    click on the validation button to send the background image
    Wait Until Element Is Visible    xpath=//button[.//span[contains(@class, 'anticon-check')]]     10s
    Click Element    xpath=//button[.//span[contains(@class, 'anticon-check')]]

Validation button
    [Documentation]    click on the validation when rating the background picture
    Wait Until Element Is Visible        xpath=//button[@id='next_button']    15s
    Click Element    xpath=//button[@id='next_button']

Wait for detection 
    [Documentation]    wait for the augementation to be detected using the visibility of instructions
    Wait Until Element Is Not Visible     xpath=//span[contains(text(), 'Place the image in the frame')]    timeout=5s

Click home button
    [Documentation]    Click on the home button using the house icon
    Wait Until Page Contains Element    xpath=//button[contains(@class, 'ant-btn-icon-only')]    timeout=5s
    Click Element    xpath=//button[contains(@class, 'ant-btn-icon-only')]

Edit Activity Title
    [Arguments]    ${title}
    Click Element    xpath=//span[@id='title_editor']/div[@role='button']
    Wait Until Element Is Visible    xpath=//textarea[not(contains(@style, 'visibility:hidden'))]    5s
    Execute JavaScript    document.querySelector("textarea:not([style*='visibility:hidden'])").value = "${title}";
    Press Keys    xpath=//textarea[not(contains(@style, 'visibility:hidden'))]    RETURN
    Sleep    2    # Manually wait for the text to be updated

Edit Activity Instructions
    [Arguments]    ${instructions}
    Click Element    xpath=//span[@id='instruction_editor']/div[@role='button']
    Wait Until Element Is Visible    xpath=//textarea[not(contains(@style, 'visibility:hidden'))]    5s
    Execute JavaScript    document.querySelector("textarea:not([style*='visibility:hidden'])").value = "${instructions}";
    Press Keys    xpath=//textarea[not(contains(@style, 'visibility:hidden'))]    RETURN
    Sleep    2    # Manually wait for the text to be updated

Edit Activity Description
    [Arguments]    ${description}
    Click Element    xpath=//span[@id='description_editor']/div[@role='button']
    Wait Until Element Is Visible    xpath=//textarea[not(contains(@style, 'visibility:hidden'))]    5s
    Execute JavaScript    document.querySelector("textarea:not([style*='visibility:hidden'])").value = "${description}";
    Press Keys    xpath=//textarea[not(contains(@style, 'visibility:hidden'))]    RETURN
    Sleep    2    # Manually wait for the text to be updated

Create empty augementation
    Create Activity
    Select Activity Type    Image Augmentation
    Next button
    Snap the background
    Validate the image
    Next button
    Validation button
    Next button
    Sleep    2s
    ${status}    ${message}=    Run Keyword And Ignore Error    Wait for detection 
    Run Keyword If    '${status}' == 'FAIL'    Log    ⚠️ Expected behavior: The element is still visible after 25s miss detection.    WARN
    Click home button
    