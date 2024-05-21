*** Settings ***

Documentation    Arquivo responsável por armazenar as informações globais do ambiente

Resource    ../resources/data/DadosLogin.resource
Resource    ../resources/pages/login/LoginPage.resource

Library    DateTime
Library    OperatingSystem
Library    Browser
Library    pyautogui
Library    OperatingSystem
Library    Process

*** Variables ***
${url_base}           https://homologacao.miningcontrol.cloud/login
${browser}            chromium
${headless}           false    
${download_path}      F:\\Projetos\\Nereu_Fast_2_Mine\\fast2mine\\resources\\data
${modulo_gerenciamento}    //h4[contains(.,'Gerenciamento')]


*** Keywords ***

Acessar o site Fast2 Mine
    New Browser    browser=${browser}    
    ...            headless=${headless}
    ...            args=["--start-maximized"]        #["--no-sandbox"]
    New Context    viewport=${None}     acceptDownloads=True   recordVideo=${download_path}
    New Page       url=${url_base}
    Wait For Elements State    text=Mining Control    Visible    2
    
#    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver           ## Cria uma instância de ChromeOptions para configurar o Chrome
#     ${prefs}=    Create Dictionary    download.default_directory=${download_path}    download.prompt_for_download=False     ## Define preferências específicas para o download automático de arquivos. Configura o diretório de download padrão e desativa o prompt de download
#     Call Method    ${chrome_options}    add_experimental_option    prefs    ${prefs}    ## Adiciona as preferências de download definidas à instância do ChromeOptions
#     Call Method    ${chrome_options}    add_argument    --safebrowsing-disable-download-protection    ## Adiciona um argumento para desabilitar a proteção de download do Safe Browsing. Isso pode ser necessário para permitir que alguns downloads aconteçam sem interrupção
#     #Call Method    ${chrome_options}    add_argument    --headless     ## Adiciona o modo headless (sem interface gráfica)
#     SeleniumLibrary.Open Browser    ${url_base}    browser=chrome    options=${chrome_options}
#     Maximize Browser Window
Verificar se estou na página inicial
    #Wait For Elements State     selector=pagina_inicial
    Take Screenshot   paginaInicial
Acessar modulo Gerenciamento da Plataforma Mining Control
    browser.Click    selector=${modulo_gerenciamento}
    builtin.Sleep    2 
 Fechar o navegador
    Take Screenshot    FinalizaTeste

   

