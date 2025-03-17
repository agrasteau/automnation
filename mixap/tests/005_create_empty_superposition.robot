*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource       ./ressources.robot

*** Variables ***

${URL}    https://localhost:3000

*** Test Cases ***
Open Web Application
    ${chrome_options}=    Set Chrome Options

    Open Browser    ${URL}    chrome    options=${CHROME_OPTIONS}
    Wait Until Element Is Visible    id=details-button    timeout=10s
    Click Element    id=details-button
    Wait Until Element Is Visible    id=proceed-link    timeout=10s
    Click Element    id=proceed-link
    Title Should Be    MIXAP    timeout 10s
    Wait Until Element Is Visible    xpath=//button[span[text()='Activity']]
generate 2 activities augementation
    Create empty Activity augementation
    Create empty Activity augementation

Create Activity
    Click Element    xpath=//button[span[text()='Activity']]
    Wait Until Element Is Visible    xpath=//div[h5[text()='Image Overlay']]
Select Activity Type
    Scroll Element Into View   xpath=//div[h5[text()='Image Overlay']]
    Click Element    xpath=//div[h5[text()='Image Overlay']]
    Wait Until Element Is Visible     xpath=//span[@id='title_editor']/div[@role='button']
Edit Activity title
    Click Element    xpath=//span[@id='title_editor']/div[@role='button']
    Wait Until Element Is Visible    xpath=//textarea[not(contains(@style, 'visibility:hidden'))]    5s
    Execute JavaScript    document.querySelector("textarea:not([style*='visibility:hidden'])").value = 'activité numéro 1';
    Press Keys     xpath=//textarea[not(contains(@style, 'visibility:hidden'))]    RETURN	
    sleep    2    #manually wait for the text to be updated
Edit Activity instructions
    Click Element    xpath=//span[@id='instruction_editor']/div[@role='button']
    Wait Until Element Is Visible    xpath=//textarea[not(contains(@style, 'visibility:hidden'))]    5s
    Execute JavaScript    document.querySelector("textarea:not([style*='visibility:hidden'])").value = "instruction relative à l'activité numéro 1";
    Press Keys     xpath=//textarea[not(contains(@style, 'visibility:hidden'))]    RETURN	
    sleep    2    #manually wait for the text to be updated

Edit Activity description
    Click Element    xpath=//span[@id='description_editor']/div[@role='button']
    Wait Until Element Is Visible    xpath=//textarea[not(contains(@style, 'visibility:hidden'))]    5s
    Execute JavaScript    document.querySelector("textarea:not([style*='visibility:hidden'])").value = "description de l'activité numéro 1";
    Press Keys     xpath=//textarea[not(contains(@style, 'visibility:hidden'))]    RETURN	
    sleep    2    #manually wait for the text to be updated
create the activity
    skip
    Wait Until Element Is Visible    xpath=//button[span/span[contains(@class, 'anticon-arrow-right')]]   5s
    Click Element    xpath=//button[span/span[contains(@class, 'anticon-arrow-right')]]
    Sleep    2s  
    Click Button    xpath=//button[span[contains(text(), 'Activity')]]
Add the activities to overlaid
    skip
    Wait Until Page Contains Element    xpath=//button[contains(@class, 'mix-card_select')]    timeout=5s
    ${boutons}    Get WebElements    xpath=//button[contains(@class, 'mix-card_select')]

    FOR    ${bouton}    IN    @{boutons}
        Click Element    ${bouton}
        Sleep    0.5s   
    END
Validate the activity creation
    skip
    Wait Until Element Is Visible    xpath=//button[span[text()='Validate']]    timeout=5s
    Click Element    xpath=//button[span[text()='Validate']]

    Wait Until Element Is Visible    xpath=//button[span/span[contains(@class, 'anticon-arrow-right')]]    10s
    Click Element    xpath=//button[span/span[contains(@class, 'anticon-arrow-right')]]

Activity trial
    skip
    Wait Until Element Is Visible     xpath=//span[contains(text(), 'Place the image in the frame')]    15s

    Sleep    1s

#     Click Element    xpath=//div[contains(@class, 'ant-space')]/div[2]//button[.//span[contains(@class, 'anticon-camera')]]
# validate the image
#     Wait Until Element Is Visible    xpath=//button[.//span[contains(@class, 'anticon-check')]]     10s
#     Click Element    xpath=//button[.//span[contains(@class, 'anticon-check')]]

# display augementation
#     Wait Until Element Is Visible    xpath=//button[span/span[contains(@class, 'anticon-arrow-right')]]    10s
#     Click Element    xpath=//button[span/span[contains(@class, 'anticon-arrow-right')]]
#     Wait Until Element Is Visible        xpath=//button[@id='next_button']
#     Click Element    xpath=//button[@id='next_button']
#     Wait Until Element Is Visible    xpath=//button[span/span[contains(@class, 'anticon-arrow-right')]]
#     Click Element    xpath=//button[span/span[contains(@class, 'anticon-arrow-right')]]
#     Wait Until Element Is Visible    xpath=//button[span/span[contains(@class, 'anticon-arrow-right')]]
#     Click Element    xpath=//button[span/span[contains(@class, 'anticon-arrow-right')]]
#     Sleep    5s
#     Wait Until Element Is Not Visible     xpath=//span[contains(text(), 'Place the image in the frame')]    timeout=25s
    

    sleep     10s
    Close Browser

*** Keywords ***
Create empty Activity augementation
    Click Element    xpath=//button[span[text()='Activity']]
    Wait Until Element Is Visible    xpath=//div[h5[text()='Image Augmentation']]
    Click Element    xpath=//div[h5[text()='Image Augmentation']]
    Wait Until Element Is Visible    xpath=//button[span/span[contains(@class, 'anticon-arrow-right')]]   5s
    Click Element    xpath=//button[span/span[contains(@class, 'anticon-arrow-right')]]
    Sleep    2s  
    Wait Until Element Is Visible    xpath=//button[.//span[contains(@class, 'anticon-camera')]]
    Click Element    xpath=//button[.//span[contains(@class, 'anticon-camera')]]
    Sleep    5s
    Click Element    xpath=//div[contains(@class, 'ant-space')]/div[2]//button[.//span[contains(@class, 'anticon-camera')]]
    Wait Until Element Is Visible    xpath=//button[.//span[contains(@class, 'anticon-check')]]     10s
    Click Element    xpath=//button[.//span[contains(@class, 'anticon-check')]]
    Wait Until Element Is Visible    xpath=//button[span/span[contains(@class, 'anticon-arrow-right')]]    10s
    Click Element    xpath=//button[span/span[contains(@class, 'anticon-arrow-right')]]
    Wait Until Element Is Visible        xpath=//button[@id='next_button']
    Click Element    xpath=//button[@id='next_button']
    Wait Until Element Is Visible    xpath=//button[span/span[contains(@class, 'anticon-arrow-right')]]
    Click Element    xpath=//button[span/span[contains(@class, 'anticon-arrow-right')]]
    Sleep    2s    
    Wait Until Page Contains Element    xpath=//button[contains(@class, 'ant-btn-icon-only')]    timeout=5s
    Click Element    xpath=//button[contains(@class, 'ant-btn-icon-only')]

   