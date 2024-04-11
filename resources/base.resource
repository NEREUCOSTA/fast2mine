*** Settings ***

Documentation    Arquivo responsável por armazenar as informações globais do ambiente
Library    SeleniumLibrary
Library    DateTime
# Library    pyautogui
Library    OperatingSystem



*** Variables ***
${url_base}           https://homologacao-dev.miningcontrol.cloud/login
${pagina_inicial}     //div[contains(@class,'jss13 jss3 jss21 ')]

*** Keywords ***

Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Set Screenshot Directory    path=results
    Capture Page Screenshot
    Close Browser

Acessar o site Fast2 Mine
    Go To    ${url_base}
Verificar se estou na página inicial
    Wait Until Element Is Visible    locator=${pagina_inicial}

   

