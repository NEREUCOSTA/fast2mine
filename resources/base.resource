*** Settings ***

Documentation    Arquivo destinado à armazenar as informações globais do Sistema.

Library    SeleniumLibrary
Library    DateTime
Library    pyautogui
Library    OperatingSystem




*** Variables ***
${url_base}                https://homologacao.miningcontrol.cloud/login
${pagina_inicial}          //div[contains(@class,'jss13 jss3 jss21 ')]
${download_path}            C:\\Fast2mine - miningcontrol\\fast2_mine_main\\fast2mine\\resources\\data
${modulo_gerenciamento}    //h4[contains(.,'Gerenciamento')]

*** Keywords ***

Acessar o site Fast2 Mine
    ${chrome_options}=    Evaluate     sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver           ## Cria uma instância de ChromeOptions para configurar o Chrome
    ${prefs}=    Create Dictionary    download.default_directory=${download_path}    download.prompt_for_download=False     ## Define preferências específicas para o download automático de arquivos. Configura o diretório de download padrão e desativa o prompt de download
    Call Method    ${chrome_options}    add_experimental_option    prefs    ${prefs}    ## Adiciona as preferências de download definidas à instância do ChromeOptions
    Call Method    ${chrome_options}    add_argument    --safebrowsing-disable-download-protection    ## Adiciona um argumento para desabilitar a proteção de download do Safe Browsing. Isso pode ser necessário para permitir que alguns downloads aconteçam sem interrupção
    Open Browser    ${url_base}    browser=chrome    options=${chrome_options}
    Maximize Browser Window

Fechar o navegador
    Set Screenshot Directory    path=results
    Capture Page Screenshot    paginaFim.png
    Close Browser    
Verificar se estou na página inicial
    # Wait Until Element Is Visible    locator=${pagina_inicial}
    Set Screenshot Directory         path=results
    Capture Page Screenshot          paginaInicial.png

Acessar modulo Gerenciamento da Plataforma Mining Control
    Click Element    locator=${modulo_gerenciamento}
    builtin.Sleep    2   