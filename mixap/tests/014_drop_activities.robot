*** Settings ***
Library    SeleniumLibrary
Resource       ./ressources.robot

*** Variables ***
${URL}    https://localhost:3000

*** Test Cases ***
create 4 activities   
    Open Web Application without closing
    Create empty augementation
    Create empty augementation
    Create empty augementation
    Create empty augementation

drop activities
    FOR    ${i}    IN RANGE    4
        Wait Until Element Is Visible    xpath=//ul[@class='ant-card-actions']//li//button[@type='button']//span[@class='ant-btn-icon']//span[@role='img' and @aria-label='ellipsis']    15s
        Click Element    xpath=//ul[@class='ant-card-actions']//li//button[@type='button']//span[@class='ant-btn-icon']//span[@role='img' and @aria-label='ellipsis']
        Wait Until Element Is Visible    xpath=//ul[contains(@class, 'ant-dropdown-menu')]//li[contains(@class, 'ant-dropdown-menu-item')]//button[@tip='Delete']    15s
        Click Element    xpath=//ul[contains(@class, 'ant-dropdown-menu')]//li[contains(@class, 'ant-dropdown-menu-item')]//button[@tip='Delete']
        Wait Until Element Is Visible    xpath=//div[contains(@class, 'ant-modal-footer')]//button[span[text()='Yes']]    15s
        Click Element    xpath=//div[contains(@class, 'ant-modal-footer')]//button[span[text()='Yes']]
    END
    Sleep    5s    
