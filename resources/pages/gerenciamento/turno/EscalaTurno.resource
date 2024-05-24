*** Settings ***

Resource    ../resources/base.resource
Resource    ../../../data/DadosLogin.resource
Resource    ../../login/LoginPage.resource


*** Variables ***
${Menu_turno}                       //a[contains(.,'Turno')]
${escala_de_turno}                  //span[contains(.,'Escala de Turno')]
${filtar_grupo}                     (//*[contains(text(), 'Selecione')])
${selecione_grupo}                  //p[contains(.,'Selecione...')]
${campo_nome_grupo}                  (//*[contains(text(), 'Caraíba')])
${campo_Intervalo}                  //input[@name='intervals']
${btn_cadastrar_turno}              //span[contains(.,'Cadastrar')]
${btn_finalizar}                    //button[contains(.,'FINALIZAR')]


*** Keywords ***

Acessar modulo Gerenciamento do Turno na aba Escala de Turno
    Acessar modulo Gerenciamento da Plataforma Mining Control
    browser.click    ${Menu_turno}   
    builtin.Sleep    2
Acessar a aba escala de turno
    browser.click        ${escala_de_turno}
    builtin.Sleep    2
Filtrar grupo de turno
    Wait For Elements State    ${filtar_grupo}
    browser.click              ${filtar_grupo}
Selecionar um grupo na lista
    browser.click               ${campo_nome_grupo} 
Inserir valores nos dias da semana do primeiro intervalo
    # Wait For Elements State    ${select_inativo}
    browser.click        ${campo_Intervalo} 
    Fill Text            ${campo_Intervalo}   1

 Acionar o botao cadastrar escala de turno    
    browser.click       ${btn_cadastrar_turno}  
    

Acionar o botao finalizar para salvar as informações
    browser.click    ${btn_finalizar}
    builtin.Sleep    2