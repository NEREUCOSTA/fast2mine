*** Settings ***

Resource    ../resources/base.resource
Resource    ../../../data/DadosLogin.resource
Resource    ../../login/LoginPage.resource


*** Variables ***
${Menu_turno}                      //a[contains(.,'Turno')]
${escala_de_turno}                 //span[contains(.,'Escala de Turno')]
${select_grupo}                    (//*[contains(text(), 'Selecione')])
${input_grupo}                     (//*[contains(text(), 'react-select-2-input')])
${select_inativo}                  (//*[contains(text(), 'Inativo')])[1]
${input_valor}                     //*[@id="react-select-3-option-1"]
${btn_cadastrar_turno}             //span[contains(.,'Cadastrar')]
${btn_finalizar}                   //button[contains(.,'FINALIZAR')]

*** Keywords ***

Acessar a aba escala de turno no Submenu Turno
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Acessar modulo Gerenciamento da Plataforma Mining Control
    Log To Console    acessando o Submenu Turno
    browser.click    ${Menu_turno}
    BuiltIn.Sleep  2s
    Log    Acessando a aba escala de turno
    browser.click    ${escala_de_turno}
    builtin.Sleep    2
Filtrar grupo de turno
    browser.click              ${select_grupo}
Selecionar um grupo na lista
   browser.click               ${input_grupo}
Inserir valores nos dias da semana do primeiro intervalo
    # Wait For Elements State    ${select_inativo}
    browser.click        ${select_inativo}
    # ${intervalo_1}    Get Page Source
    # Log    ${intervalo_1}
    browser.click        ${input_valor}
    builtin.Sleep    2 
Acionar o botao finalizar para salvar as informações
    browser.click    ${btn_finalizar}
    builtin.Sleep    2