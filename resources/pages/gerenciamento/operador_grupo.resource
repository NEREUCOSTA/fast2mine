*** Settings ***
Documentation        Arquivo destinado a armazenar os elementos e variaveis da área do operador.
Resource   ../../base.resource

Library    OperatingSystem
Library    SeleniumLibrary
Library    pyautogui


*** Variables ***
${modulo_gerenciamento}         //h4[contains(.,'Gerenciamento')]
${grupo}                        //span[contains(.,'Grupo')]
${inserir_novos_registros}      //span[contains(.,'Inserir Novos Registros')]
${btn_importar_planilha}        //span[contains(.,'Importar Planilha')]
${sheet_name}                   Dados
${planilha}                     F:\\Projetos\\fast_2_mine\\resources\\data\\template_operatorsgroups.xlsx
       

*** Keywords ***
Acessar modulo Gerenciamento
    Click Element    locator=${modulo_gerenciamento}
    builtin.Sleep    2
    Wait Until Page Contains    Grupo
    Click Element    locator=${grupo}
Download da Planilha para Inserir novos registros
    Click Element    locator=${inserir_novos_registros}
Arquivo salvo na pasta do projeto
    builtin.Sleep    3

Upload da Planilha com os novos registros
   Click Element    locator=${btn_importar_planilha}
   builtin.Sleep    2
   pyautogui.Write    message=${planilha}
   Press    enter
   builtin.Sleep    2





    

