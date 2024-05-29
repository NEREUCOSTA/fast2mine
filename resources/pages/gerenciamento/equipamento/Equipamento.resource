
...    *** Settings ***
Resource    ../resources/base.resource

*** Variables ***
${submenu_equipamento}             (//span[contains(.,'Equipamento')])[3]
${aba_equipamento}                 (//span[contains(.,'Equipamento')])[5]
${btn_inserir_novos_registros}     //span[contains(.,'Inserir Novos Registros')]
${btn_importar_planilha}           //span[contains(.,'Importar Planilha')]
${planilha_template_equipments}    F:\\Projetos\\Nereu_Fast_2_Mine\\fast2mine\\resources\\data\\template_equipmentsgroups.xlsx
${planilha_equipmentsgroups}       F:\\Projetos\\Nereu_Fast_2_Mine\\fast2mine\\resources\\data\\equipmentsgroups.xlsx
${btn_editar_registros}            //span[contains(.,'Editar Registros')]


*** Keywords ***

Acessar a aba Equipamento no Submenu Equipamento
    Verificar se estou na página inicial
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Acessar modulo Gerenciamento da Plataforma Mining Control
    Log    Acessando o Submenu Equipamento    
    browser.click    ${submenu_equipamento}
Download da Planilha para Inserir novos registros aba Equipamentos
    Log    Download da Planilha para Inserir novos registros grupo equipamentos
    ${dl_promise}    Promise To Wait For Download    ${planilha_template_equipments}
    browser.click    ${btn_inserir_novos_registros}
Arquivo salvo na pasta do projeto equipamento
    builtin.Sleep    3
Importar Planilha com os novos registros aba Equipamentos
   browser.click      ${btn_importar_planilha}
   builtin.Sleep    2
   pyautogui.Write    ${planilha_template_equipments} 
   Press    enter
   builtin.Sleep    2
Remove o arquivo do diretório data
    Log    Verificando se o arquivo está na pasta
    File Should Exist      ${planilha_template_equipments} 

    Log    Excluindo o arquivo da pasta
    Remove File            ${planilha_template_equipments} 
    File Should Not Exist  ${planilha_template_equipments}
Editar registros da aba Equipamento
    log  Download da Planilha para Editar registros da aba Grupo de Equipamento
    ${dl_promise}    Promise To Wait For Download    ${planilha_equipmentsgroups}
    browser.click    ${btn_editar_registros}
Editar Registros aba Equipamento
    browser.click    ${btn_editar_registros}
    builtin.Sleep    2