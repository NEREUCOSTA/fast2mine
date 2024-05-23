*** Settings ***
Documentation        Arquivo destinado a armazenar os elementos e variaveis da área do operador.

Resource    ../resources/base.resource
Resource    ../../../data/DadosLogin.resource
Resource    ../../login/LoginPage.resource


*** Variables ***
${browser}                      chromium
${modulo_gerenciamento}         //h4[contains(.,'Gerenciamento')]
${grupo}                        //span[contains(.,'Grupo')]
${inserir_novos_registros}      //span[contains(.,'Inserir Novos Registros')]
${btn_importar_planilha}        //span[contains(.,'Importar Planilha')]
${planilha_novos_registros}     F:\\Projetos\\Nereu_Fast_2_Mine\\fast2mine\\resources\\data\\template_operatorsgroups.xlsx
${planilha_editar_registros}    F:\\Projetos\\Nereu_Fast_2_Mine\\fast2mine\\resources\\data\\operatorsgroups.xlsx
${btn_editar_registros}         //span[contains(.,'Editar Registros')]

*** Keywords ***

 Acionar a opção grupo
    Verificar se estou na página inicial
    Log    inserindo as credenciais de acesso
    Inserir email e senha cadastrados
    
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Log    Login realizado com sucesso

    Acessar modulo Gerenciamento da Plataforma Mining Control
    browser.click    ${grupo}
Download da Planilha para Inserir novos registros
    ${dl_promise}    Promise To Wait For Download    ${planilha_novos_registros}
    browser.click    ${inserir_novos_registros}
    ${arquivo}    Wait For  ${dl_promise}
    File Should Exist       ${planilha_novos_registros}
Arquivo salvo na pasta do projeto
    builtin.Sleep    3
    
Importar Planilha com os novos registros
   browser.click      ${btn_importar_planilha}
   builtin.Sleep    2
   pyautogui.Write    message=${planilha_novos_registros}
   Press    enter
   builtin.Sleep    3
remove o arquivo da pasta
    Log    Verificando se o arquivo está na pasta
    File Should Exist      ${planilha_novos_registros}

    Log    Excluindo o arquivo da pasta
    Remove File            ${planilha_novos_registros}
    
    Log    Verificando se o arquivo foi excluido da pasta
    File Should Not Exist  ${planilha_novos_registros}
Editar Registros
    ${dl_promise}    Promise To Wait For Download    ${planilha_editar_registros}
    browser.click    ${btn_editar_registros}
    ${arquivo}    Wait For  ${dl_promise}
    File Should Exist       ${planilha_editar_registros}
    builtin.Sleep    2