*** Settings ***
Resource    ../resources/base.resource
Resource    ../../../data/DadosLogin.resource
Resource    ../../login/LoginPage.resource

Library

*** Variables ***
${Menu_turno}                       //a[contains(.,'Turno')]
${grupo_de_equipamento}             //span[@class='MuiTab-wrapper'][contains(.,'Grupo de Equipamento')]
${btn_finalizar_grupo_equipamento}  //span[contains(.,'FINALIZAR')]
${campo_grupo_turno}                (//div[@aria-hidden='true'])[8]
${selecionar_grupo_turno}           //*[@id="react-select-5-option-1"]

*** Keywords ***
Acessar modulo Gerenciamento do Turno na aba Grupo de Equipamento 
    Acessar modulo Gerenciamento da Plataforma Mining Control
    browser.click    selector=${Menu_turno}
    Wait For Elements State  selector=${grupo_de_equipamento}
    browser.click                  selector=${grupo_de_equipamento}

Alterar dados no grid 
    Wait For Elements State  selector=${campo_grupo_turno}
    browser.click                  selector=${campo_grupo_turno}
    BuiltIn.Sleep  2s
    browser.click                  selector=${selecionar_grupo_turno}   
    BuiltIn.Sleep  2s

Acionar o botao finalizar na aba Grupo de equipamentos   
    Wait For Elements State  ${btn_finalizar_grupo_equipamento} 
    browser.click                  ${btn_finalizar_grupo_equipamento}   