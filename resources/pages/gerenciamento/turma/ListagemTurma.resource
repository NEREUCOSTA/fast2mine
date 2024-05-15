*** Settings ***

Resource    ../resources/base.resource


*** Variables ***
${submenu_turma}                   (//span[contains(.,'Turma')])[3]
${aba_listagem_turmas}             //span[contains(.,'Listagem de Turmas')]
${select_grupo}                    (//*[contains(text(), 'Selecione...')])[1]
${grupo_turno}                     (//*[contains(text(), 'Primeiro Turno Mineração - Dia')])[1]
${select_turma}                    (//*[contains(text(), 'Selecione...')])[1]
${grupo_turma}                     (//*[contains(text(), 'Equipe 01 - F2M')])[1]
${qtd_dias}                        //input[contains(@name,'days')]
${btn_cadastrar}                   (//*[contains(text(), 'Cadastrar')])[1]
${select_valor}                  (//*[contains(text(), 'Selecione...')])[1]
${input_valor}                     (//*[contains(text(), 'Operários do turno matutino')])[1]
${select_folga}                    (//*[contains(text(), 'Selecione...')])[1]
${btn_finalizar}                   //span[contains(.,'FINALIZAR')]



*** Keywords ***
Acessar a aba Listagem de Turmas do submenu TURMA  
    Acessar modulo Gerenciamento da Plataforma Mining Control
    browser.click    locator=${submenu_turma}
    BuiltIn.Sleep  2s
    browser.click    locator=${aba_listagem_turmas}
    BuiltIn.Sleep  2s
Pesquisar pelo Grupo de Turno
    browser.click    locator=${select_grupo}
    browser.click    locator=${grupo_turno}
Pesquisar pelo Grupo de Turma desejado
    browser.click    locator=${select_turma}
    browser.click    locator=${grupo_turma}
Informar a quantidade de dias
    Wait Until Element Is Visible    locator=${qtd_dias}
    browser.click    locator=${qtd_dias}
    Input Text       locator=${qtd_dias}    text=1
Acionar o botão + CADASTRAR    
    Wait Until Element Is Visible    locator=${btn_cadastrar}
    browser.click                    locator=${btn_cadastrar}
    Wait Until Page Contains         text=dias
Inserir valores nos campos
    browser.click    locator=${select_valor}
    browser.click    locator=${input_valor}
    builtin.Sleep    1
Acionar o botão FINALIZAR
    browser.click    locator=${btn_finalizar}
    builtin.Sleep    3