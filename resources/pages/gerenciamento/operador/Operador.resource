*** Settings ***
Resource    ../../../../resources/base.resource
Resource    ../../../data/dados_login.resource
Resource    ../../login/login_page.resource

*** Variables ***
${operador}                     //span[@class='MuiTab-wrapper'][contains(.,'Operador')]
${inserir_novos_registros}      //span[contains(.,'Inserir Novos Registros')]
${btn_importar_planilha}        //span[contains(.,'Importar Planilha')]
${planilha_operador}            F:\\Projetos\\Nereu_Fast_2_Mine\\fast2mine\\resources\\data\\template_operators.xlsx     #
${btn_editar_registros}         //span[contains(.,'Editar Registros')]

*** Keywords ***
Acionar a opção operador
    Verificar se estou na página inicial
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Acessar modulo Gerenciamento da Plataforma Mining Control
    Wait Until Page Contains   Operador
    Click Element    locator=${operador} 

Download da Planilha para Inserir Novos Registros Operador
    Click Element    locator=${inserir_novos_registros}
Arquivo salvo na pasta do projeto Operador
    builtin.Sleep    3

Importar Planilha com os novos registros Operador
   Maximize Browser Window
   Click Element    locator=${btn_importar_planilha}
   builtin.Sleep    2
   pyautogui.Write    message=${planilha_operador}
   Press    enter
   builtin.Sleep    2

remove o arquivo da pasta Operador
    File Should Exist  ${planilha_operador}
    Remove File        ${planilha_operador}
    File Should Not Exist  ${planilha_operador}   
Editar Registros Operador
    Click Element    locator=${btn_editar_registros}
    builtin.Sleep    2