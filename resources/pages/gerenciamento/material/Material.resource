*** Settings ***
Documentation    Arquivo responsável por armazenar as informações da aba Material
Resource    ../../../base.resource
Resource    ../../../data/DadosLogin.resource
Resource    ../../login/LoginPage.resource

*** Variables ***
${submenu_material}              (//span[contains(.,'Material')])[3]
${aba_material}                   //span[contains(.,'Material')]
${btn_inserir_novos_registros}   //span[contains(.,'Inserir Novos Registros')]
${btn_importar_planilha}         //span[@class='MuiFab-label'][contains(.,'Importar Planilha')]
${planilha_template_materials}    C:\\QA\\fast2mine\\resources\\data\\template_materials.xlsx
${planilha_materials}             C:\\QA\\fast2mine\\resources\\data\\materials.xlsx
${btn_editar_registros}          //span[contains(.,'Editar Registros')]
${btn_importar_planilha}         //span[@class='MuiFab-label'][contains(.,'Importar Planilha')]

*** Keywords ***
Acessar a aba Material no Submenu Material
    Verificar se estou na página inicial
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Acessar modulo Gerenciamento da Plataforma Mining Control
    Log    Acessando o Submenu Material
    browser.click    ${submenu_material}
Download da Planilha para Inserir novos registros aba Material
    Log    Download da Planilha para Inserir novos registros Material
    ${dl_promise}    Promise To Wait For Download    ${planilha_template_materials}
    browser.click    ${btn_inserir_novos_registros}
Arquivo salvo na pasta do projeto Material
    builtin.Sleep    2
Importar Planilha com os novos registros aba Material
    browser.click      ${btn_importar_planilha}
    builtin.Sleep    2
    pyautogui.Write    ${planilha_template_materials}
    Press    enter
    builtin.Sleep    2
remove o arquivo do diretório data aba material
    Log    Verificando se o arquivo está na pasta
    File Should Exist      ${planilha_template_materials}

    Log    Excluindo o arquivo da pasta
    Remove File            ${planilha_template_materials}
    File Should Not Exist  ${planilha_template_materials}
Editar registros da aba Material
    log  Download da Planilha para Editar registros da aba Material
    ${dl_promise}    Promise To Wait For Download    ${planilha_materials}
    browser.click    ${btn_editar_registros}