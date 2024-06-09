*** Settings ***

Documentation    Arquivo responsável por armazenar as informações globais do ambiente

Resource    ../resources/data/DadosLogin.resource
Resource    ../resources/pages/login/LoginPage.resource

Library    DateTime
Library    OperatingSystem
Library    Browser
# Library    pyautogui
Library    OperatingSystem
Library    Process
Library    FakerLibrary  locale=pt_BR

*** Variables ***
${url_base}           https://homologacao.miningcontrol.cloud/login
${browser}            chromium
${headless}           true    
${download_path}      F:\\Projetos\\Nereu_Fast_2_Mine\\fast2mine\\resources\\data  #
${modulo_gerenciamento}    //h4[contains(.,'Gerenciamento')]


*** Keywords ***

Acessar o site Fast2 Mine
    New Browser    browser=${browser}    
    ...            headless=${headless}
    ...            args=["--start-maximized"]        #["--no-sandbox"]
    New Context    viewport=${None}     acceptDownloads=True   #recordVideo=${download_path}
    New Page       ${url_base}    #wait_until=load
    Wait For Elements State    text=Mining Control    Visible    2
    
Verificar se estou na página inicial
    #Wait For Elements State     pagina_inicial
    Take Screenshot   paginaInicial
Acessar modulo Gerenciamento da Plataforma Mining Control
    browser.click    ${modulo_gerenciamento}
    builtin.Sleep    2 
 Fechar o navegador
    Take Screenshot    FinalizaTeste

   

