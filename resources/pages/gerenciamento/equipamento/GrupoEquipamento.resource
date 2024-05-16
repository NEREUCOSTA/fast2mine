*** Settings ***
Resource    ../../../../resources/base.resource
Resource    ../../../data/dados_login.resource
Resource    ../../login/login_page.resource

*** Variables ***
${menu_equipamento}             (//*[contains(text(), 'Equipamento')])[1]
${aba_grupo_equipamento}        //span[contains(.,'Grupo de Equipamento')]
${inserir_novos_registros}      //span[@class='MuiFab-label'][contains(.,'Inserir Novos Registros')]
${btn_importar_planilha}        //span[@class='MuiFab-label'][contains(.,'Importar Planilha')]
${planilha_equipamento}         C:\\Fast2mine - miningcontrol\\fast2_mine_main\\fast2mine\\resources\\data\\template_equipmentsgroups.xlsx
${btn_editar_registros}         //span[contains(.,'Editar Registros')]
${importar_planilha}            //span[@class='MuiFab-label'][contains(.,'Importar Planilha')]
${btn_editar_registros}         //span[@class='MuiFab-label'][contains(.,'Editar Registros')]

*** Keywords ***
Acionar a opção grupo
    Verificar se estou na página inicial
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Acessar modulo Gerenciamento da Plataforma Mining Control
    Wait Until Page Contains   Operador
    Click Element    locator=${menu_equipamento}

Download da Planilha para Inserir novos registros grupo equipamentos
    Click Element    locator=${inserir_novos_registros}
Arquivo salvo na pasta do projeto equipamento
    builtin.Sleep    3

Importar Planilha com os novos registros Operador
   Maximize Browser Window
   Click Element    locator=${btn_importar_planilha}
   builtin.Sleep    2
   pyautogui.Write    message=${planilha_equipamento} 
   Press    enter
   builtin.Sleep    2

remove o arquivo da pasta Operador
    File Should Exist  ${planilha_equipamento} 
    Remove File        ${planilha_equipamento} 
    File Should Not Exist  ${planilha_equipamento}    
Editar Registros Operador
    Click Element    locator=${btn_editar_registros}
    builtin.Sleep    2