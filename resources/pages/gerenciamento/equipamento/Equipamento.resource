*** Settings ***
Resource    ../../../../resources/base.resource
Resource    ../../../data/dados_login.resource
Resource    ../../login/login_page.resource

*** Variables ***
${menu_equipamento}                (//span[contains(.,'Equipamento')])[3]
${aba_equipamento}                 (//span[contains(.,'Equipamento')])[5]
${btn_inserir_novos_registros}     (//span[@class='MuiFab-label'])[20]
${btn_importar_planilha}       //span[contains(.,'Importar Planilha')]
${planilha_equipamento}        F:\\Projetos\\Nereu_Fast_2_Mine\\fast2mine\\resources\\data\\template_equipments.xlsx
${btn_editar_registros}        //span[contains(.,'Editar Registros')]


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
    Click Element    locator=${btn_inserir_novos_registros}
Arquivo salvo na pasta do projeto equipamento
    builtin.Sleep    3
Importar Planilha com os novos registros aba Equipamento
   Maximize Browser Window
   Click Element      locator=${btn_importar_planilha}
   builtin.Sleep    2
   pyautogui.Write    message=${planilha_equipamento} 
   Press    enter
   builtin.Sleep    2
Remove o arquivo do diretório data
    File Should Exist  ${planilha_equipamento} 
    Remove File        ${planilha_equipamento} 
    File Should Not Exist  ${planilha_equipamento}
Editar Registros aba Equipamento
    Click Element    locator=${btn_editar_registros}
    builtin.Sleep    2