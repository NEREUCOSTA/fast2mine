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
Library    FakerLibrary  locale=pt_BR

*** Variables ***
${url_base}                https://homologacao.miningcontrol.cloud/login
${browser}                 chromium
${headless}                false    
${download_path}           C:\\Projetos\\Nereu_Fast_2_Mine\\fast2mine\\resources\\data  
${modulo_gerenciamento}    (//div[contains(.,'Gerenciamento')])[5]
${versão_sistema}          //span[contains(.,'Versão v2.13.02.02')]
${btn_user}                //div[contains(@class,'MuiAvatar-root MuiAvatar-circular MuiAvatar-colorDefault')]


*** Keywords ***

Acessar o site Fast2 Mine
    New Browser    browser=${browser}    
    ...            headless=${headless}
    # ...            args=["--start-maximized"]        #["--no-sandbox"]
    #New Context    viewport=${VIEWPORT}     acceptDownloads=True   #recordVideo=${download_path}
    New Page       ${url_base}    #wait_until=load
    
Verificar se estou na página inicial
    #Esta keyword verifica se o texto "Mining Control" está presente na página e compara com o valor esperado
    Get Text    text=Mining Control  ==  Mining Control   
    Take Screenshot             paginaInicial
Validar a versão do sistema
    Log    Validando a ${versão_sistema}
    browser.Click      ${btn_user}
    Get Text           text=Versão v2.13.02.02  ==  Versão v2.13.02.02
    Take Screenshot    Versão v2.13.02.02
    Browser.Click      //div[contains(@class,'jss3')]
Acessar modulo Gerenciamento da Plataforma Mining Control
    browser.click    ${modulo_gerenciamento}
    builtin.Sleep    2 
    
 Fechar o navegador
    Take Screenshot    FinalizaTeste
    Move Files    *.html    evidencias   

   

