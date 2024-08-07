*** Settings ***
Resource    ../../../base.resource

*** Variables ***
${Menu_turno}                       //a[contains(.,'Turno')]
${grupo_de_equipamento}             //span[@class='MuiTab-wrapper'][contains(.,'Grupo de Equipamento')]
${campo_grupo_turno}                (//div[@aria-hidden='true'])[8]
${selecionar_grupo_turno}           //*[@id="react-select-5-option-1"]
${btn_finalizar_grupo_equipamento}  //span[contains(.,'FINALIZAR')]

*** Keywords ***
Acessar a aba Grupo de Equipamento no Submenu Turno
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Acessar modulo Gerenciamento da Plataforma Mining Control
    Log To Console    acessando o Submenu Turno
    browser.click    ${Menu_turno}
    Wait For Elements State  ${grupo_de_equipamento}
    browser.click            ${grupo_de_equipamento}

Alterar dados no grid 
    Wait For Elements State  ${campo_grupo_turno}
    browser.click            ${campo_grupo_turno}
    browser.click            ${selecionar_grupo_turno}   
Acionar o botao finalizar na aba Grupo de equipamentos
    Log    Acionar o botao finalizar na aba Grupo de equipamentos
    Wait For Elements State  ${btn_finalizar_grupo_equipamento} 
    browser.click            ${btn_finalizar_grupo_equipamento}
    builtin.Sleep            2