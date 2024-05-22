*** Settings ***
Library    SeleniumLibrary
# Library    pyautogui

*** Keywords ***

*** Test Cases ***
realizar login
    Log To Console    Abrindo a url
    Open Browser    https://homologacao.miningcontrol.cloud/login    browser=chrome
    Maximize Browser Window
    # Input Text        //input[@name='E-mail']    admin@fast2mine.com
    Press Keys    //input[@name='E-mail']    admin@fast2mine.com
    Sleep    2
    Press Keys    //*[@id="Password"]    NyNV5x6HugE2jzsP
    Click Button      //button[contains(.,'ENTRAR')]
    Sleep    2
    