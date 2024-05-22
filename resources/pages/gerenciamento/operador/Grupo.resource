*** Settings ***
Documentation        Arquivo destinado a armazenar os elementos e variaveis da área do operador.

Resource    ../resources/base.resource
Resource    ../../../data/DadosLogin.resource
Resource    ../../login/LoginPage.resource


*** Variables ***
${modulo_gerenciamento}         //h4[contains(.,'Gerenciamento')]
${grupo}                        //span[contains(.,'Grupo')]
${inserir_novos_registros}      //span[contains(.,'Inserir Novos Registros')]
${btn_importar_planilha}        //span[contains(.,'Importar Planilha')]
${planilha}                     F:\\Projetos\\Nereu_Fast_2_Mine\\fast2mine\\resources\\data\\template_operatorsgroups.xlsx
${excluir_arquivos}             F:\\Projetos\\Nereu_Fast_2_Mine\\fast2mine\\resources\\data\\template_operatorsgroups.xlsx
${btn_editar_registros}         //span[contains(.,'Editar Registros')]

*** Keywords ***

 Acionar a opção grupo
    Verificar se estou na página inicial
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Acessar modulo Gerenciamento da Plataforma Mining Control
    browser.click    selector=${grupo}
Download da Planilha para Inserir novos registros
    browser.click    selector=${inserir_novos_registros}
Arquivo salvo na pasta do projeto
    builtin.Sleep    3
    
Importar Planilha com os novos registros
   browser.click    selector=${btn_importar_planilha}
   builtin.Sleep    2
   pyautogui.Write    message=${planilha} 
   Press    enter
   builtin.Sleep    3
remove o arquivo da pasta
    File Should Exist  ${planilha}
    Remove File        ${excluir_arquivos}
    File Should Not Exist  ${planilha}
Editar Registros
    browser.click    selector=${btn_editar_registros}
    builtin.Sleep    2