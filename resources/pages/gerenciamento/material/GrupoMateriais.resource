*** Settings ***
Documentation    Arquivo responsável por armazenar as informações da aba Grupo de Materiais
Resource    ../resources/base.resource
Resource    ../../../data/DadosLogin.resource
Resource    ../../login/LoginPage.resource

*** Variables ***
${submenu_material}                    (//span[contains(.,'Material')])[3]
${aba_grupo_materiais}                 //span[contains(.,'Grupo de Materiais')]
${btn_inserir_novos_registros}         //span[contains(.,'Inserir Novos Registros')]
${btn_importar_planilha}               //span[@class='MuiFab-label'][contains(.,'Importar Planilha')]
${planilha_template_materialsgroups}   F:\\Projetos\\Nereu_Fast_2_Mine\\fast2mine\\resources\\data\\template_materialsgroups.xlsx
${planilha_materialsgroups}            F:\\Projetos\\Nereu_Fast_2_Mine\\fast2mine\\resources\\data\\materialsgroups.xlsx
${btn_editar_registros}                //span[contains(.,'Editar Registros')]
${btn_importar_planilha}               //span[@class='MuiFab-label'][contains(.,'Importar Planilha')]

*** Keywords ***
Acessar a aba Grupo de Materiais no Submenu Material
    Verificar se estou na página inicial
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Acessar modulo Gerenciamento da Plataforma Mining Control
    Log    Acessando o Submenu Material
    browser.click    ${submenu_material}
Download da Planilha para Inserir novos registros aba Grupo Materiais
    Log    Download da Planilha para Inserir novos registros grupo materiais
    ${dl_promise}    Promise To Wait For Download    ${planilha_template_materialsgroups}
    browser.click    ${btn_inserir_novos_registros}
Arquivo salvo na pasta do projeto Grupo Materiais
    builtin.Sleep    2
Importar Planilha com os novos registros aba grupo materiais
    browser.click      ${btn_importar_planilha}
    builtin.Sleep    2
    pyautogui.Write    ${planilha_template_materialsgroups}
    Press    enter
    builtin.Sleep    2
Remove o arquivo do diretório data.
    Log    Verificando se o arquivo está na pasta
    File Should Exist      ${planilha_template_materialsgroups}

    Log    Excluindo o arquivo da pasta
    Remove File            ${planilha_template_materialsgroups}
    File Should Not Exist  ${planilha_template_materialsgroups}
Editar registros da aba Grupo de Materiais
    log  Download da Planilha para Editar registros da aba Grupo de Materiais
    ${dl_promise}    Promise To Wait For Download    ${planilha_materialsgroups}
    browser.click    ${btn_editar_registros}
    