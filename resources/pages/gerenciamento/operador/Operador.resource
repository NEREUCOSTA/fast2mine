*** Settings ***
Resource    ../resources/base.resource
Resource    ../../../data/DadosLogin.resource
Resource    ../../login/LoginPage.resource

Library    OperatingSystem

*** Variables ***
${operador}                     //span[@class='MuiTab-wrapper'][contains(.,'Operador')]
${inserir_novos_registros}      //span[contains(.,'Inserir Novos Registros')]
${btn_importar_planilha}        //span[contains(.,'Importar Planilha')]
${planilha_operador}            template_operators.xlsx
# ${download_dir}                 F:\\Projetos\\Nereu_Fast_2_Mine\\fast2mine\\data
${btn_editar_registros}         //span[contains(.,'Editar Registros')]

*** Keywords ***
Acionar a opção operador
    Verificar se estou na página inicial
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Acessar modulo Gerenciamento da Plataforma Mining Control
    browser.click    selector=${operador} 
# Configurar Contexto e Página
#     [Arguments]    ${path}
#     New Browser    chromium    acceptDownloads=True
#     New Context    acceptDownloads=True
#     New Page
Download da Planilha para Inserir Novos Registros Operador
    browser.Click    ${inserir_novos_registros}
    ${download}=    Promise To Wait For Download
    ${path}=    Set Variable    ${download.path}
    Log    Caminho do arquivo baixado: ${path}
    File Should Exist    ${path}
    Log    O arquivo foi baixado com sucesso!
Arquivo salvo na pasta do projeto Operador
    builtin.Sleep    3

Importar Planilha com os novos registros Operador
   #Maximize Browser Window
   browser.click    selector=${btn_importar_planilha}
   builtin.Sleep    2
   pyautogui.Write    message=${planilha_operador}
   Press    enter
   builtin.Sleep    2

remove o arquivo da pasta Operador
    File Should Exist  ${planilha_operador}
    Remove File        ${planilha_operador}
    File Should Not Exist  ${planilha_operador}   
Editar Registros Operador
    browser.click    selector=${btn_editar_registros}
    builtin.Sleep    2