*** Settings ***
Resource    ../resources/base.resource
Resource    ../operador.resource

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
    Click Element    locator=${Menu_turno}
    Wait Until Element Is Visible  locator=${grupo_de_equipamento}
    Click Element                  locator=${grupo_de_equipamento}

Alterar dados no grid 
    Wait Until Element Is Visible  locator=${campo_grupo_turno}
    Click Element                  locator=${campo_grupo_turno}
    BuiltIn.Sleep  2s
    Click Element                  locator=${selecionar_grupo_turno}   
    BuiltIn.Sleep  2s

Acionar o botao finalizar na aba Grupo de equipamentos   
    Wait Until Element Is Visible  ${btn_finalizar_grupo_equipamento} 
    Click Element                  ${btn_finalizar_grupo_equipamento}   