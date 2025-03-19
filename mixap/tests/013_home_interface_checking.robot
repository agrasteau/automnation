*** Settings ***
Library    SeleniumLibrary
Resource       ./ressources.robot

*** Variables ***
${URL}    https://localhost:3000
${VERIFY_TEXT_FR}    MIXAP est un outil auteur, créé par le LIUM, qui vous permet de créer vos propres applications de Réalité Augmentée.
${VERIFY_TEXT_EN}    MIXAP is an authoring tool, created by LIUM, that allows you to create your own Augmented Reality educational activities.
${VERIFY_TEXT_DA}    MIXAP er et forfatterværktøj, skabt af LIUM, som giver dig mulighed for at skabe dine egne Udvidet Virkelighed aktiviteter.
${VERIFY_TEXT_EL}    MIXAP είναι ένα εργαλείο συγγραφής, που δημιουργήθηκε από την LIUM, το οποίο σας επιτρέπει να δημιουργήσετε τις δικές σας δραστηριότητες Επαυξημένης Πραγματικότητας.
${VERIFY_TEXT_TR}    MIXAP tarafından oluşturulan bir yazma aracıdır. LIUM, oluşturmanıza olanak tanıyan Artırılmış Gerçeklik eğitsel etkinlikler.

*** Test Cases ***
open Application
    Open Web Application
Change to French
    Open drawer
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'ant-select-dropdown')]//div[contains(@class, 'ant-select-item') and text()='FR']    10s
    Click Element    xpath=//div[contains(@class, 'ant-select-dropdown')]//div[contains(@class, 'ant-select-item') and text()='FR']
    Wait Until Element Contains    xpath=//body    ${VERIFY_TEXT_FR}    10s

Change to Danish
    Open drawer
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'ant-select-dropdown')]//div[contains(@class, 'ant-select-item') and text()='DA']    10s
    Click Element    xpath=//div[contains(@class, 'ant-select-dropdown')]//div[contains(@class, 'ant-select-item') and text()='DA']
    Wait Until Element Contains    xpath=//body    ${VERIFY_TEXT_DA}    10s

Change to Greek
    Open drawer
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'ant-select-dropdown')]//div[contains(@class, 'ant-select-item') and text()='EL']    10s
    Click Element    xpath=//div[contains(@class, 'ant-select-dropdown')]//div[contains(@class, 'ant-select-item') and text()='EL']
    Wait Until Element Contains    xpath=//body    ${VERIFY_TEXT_EL}    10s

Change to Turkish
    Open drawer
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'ant-select-dropdown')]//div[contains(@class, 'ant-select-item') and text()='TR']    10s
    Click Element    xpath=//div[contains(@class, 'ant-select-dropdown')]//div[contains(@class, 'ant-select-item') and text()='TR']
    Wait Until Element Contains    xpath=//body    ${VERIFY_TEXT_TR}    10s

Change to English
    Open drawer
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'ant-select-dropdown')]//div[contains(@class, 'ant-select-item') and text()='EN']    10s
    Click Element    xpath=//div[contains(@class, 'ant-select-dropdown')]//div[contains(@class, 'ant-select-item') and text()='EN']
    Wait Until Element Contains    xpath=//body    ${VERIFY_TEXT_EN}    10s

change the activity rendering mode

    Click Element    xpath=//span[contains(@class, 'mix-switcher_bt')]
    Sleep    1s
    
Check filtering activities buttons
    Create empty augementation
    Create empty augementation
    Create empty validation
    Create empty validation
    Wait Until Element Is Visible    xpath=//label[input[@id='filtreAugmenter']]    timeout=10
    Click Element    xpath=//label[input[@id='filtreAugmenter']]
    Wait Until Element Contains    xpath=//body//*[text()='Visualize the image']    text=Visualize the image    timeout=10
    Element Should Not Contain    xpath=//div[contains(@class, 'mix-main_content_item')]    Find the image
    Wait Until Element Is Visible    xpath=//label[input[@id='filtreAugmenter']]    timeout=10
    Click Element    xpath=//label[input[@id='filtreAugmenter']]
    Wait Until Element Is Visible    xpath=//label[input[@id='filtreValider']]    timeout=10
    Click Element    xpath=//label[input[@id='filtreValider']]
    Wait Until Element Contains    xpath=//body//*[text()='Find the image']    text=Find the image    timeout=10
    Element Should Not Contain    xpath=//div[contains(@class, 'mix-main_content_item')]    Visualize the image

    Wait Until Element Is Visible    xpath=//div[@data-node-key='group']//div[@role='tab' and @aria-selected='false']    timeout=10
    Click Element    xpath=//div[@data-node-key='group']//div[@role='tab' and @aria-selected='false']
    Wait Until Element Is Not Visible    xpath=//div[@class='mix-tab_filters']    timeout=10
    Wait Until Element Is Visible    xpath=//div[@data-node-key='activity']//div[@role='tab' and @aria-selected='false']    timeout=10
    Click Element    xpath=//div[@data-node-key='activity']//div[@role='tab' and @aria-selected='false']
    Wait Until Element Is Visible    xpath=//div[@class='mix-tab_filters']    timeout=10
    Wait Until Element Is Visible    xpath=//div[@data-node-key='path']//div[@role='tab' and @aria-selected='false']    timeout=10
    Click Element    xpath=//div[@data-node-key='path']//div[@role='tab' and @aria-selected='false']
    Wait Until Element Is Not Visible    xpath=//div[@class='mix-tab_filters']    timeout=10

    Close Browser


*** Keywords ***

Open drawer
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'ant-select') and contains(@class, 'ant-select-single') and contains(@class, 'ant-select-show-arrow')]
    Click Element    xpath=//div[contains(@class, 'ant-select') and contains(@class, 'ant-select-single') and contains(@class, 'ant-select-show-arrow')]


