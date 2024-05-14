*** Settings ***
Resource    ../resources/base.resource

*** Variables ***
${operador}                     //span[@class='MuiTab-wrapper'][contains(.,'Operador')]
${inserir_novos_registros}      //span[contains(.,'Inserir Novos Registros')]
${btn_importar_planilha}        //span[contains(.,'Importar Planilha')]
${planilha_operador}            F:\\Projetos\\Nereu_Fast_2_Mine\\fast2mine\\resources\\data\\\\template_operators.xlsx
${btn_editar_registros}         //span[contains(.,'Editar Registros')]

*** Keywords ***
Acionar a opção operador
    Wait Until Page Contains   Operador
    browser.click    selector=${operador} 

Download da Planilha para Inserir Novos Registros Operador
    browser.click    selector=${inserir_novos_registros}
Arquivo salvo na pasta do projeto Operador
    builtin.Sleep    3

Importar Planilha com os novos registros Operador
   Maximize Browser Window
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