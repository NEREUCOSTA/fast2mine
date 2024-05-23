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
    Verificar se estou na página inicial
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado  
    Acessar modulo Gerenciamento da Plataforma Mining Control
    browser.click    ${submenu_turma}
    BuiltIn.Sleep  2s
    browser.click    ${aba_listagem_turmas}
    BuiltIn.Sleep  2s
Pesquisar pelo Grupo de Turno
    browser.click    ${select_grupo}
    browser.click    ${grupo_turno}
Pesquisar pelo Grupo de Turma desejado
    browser.click    ${select_turma}
    browser.click    ${grupo_turma}
Informar a quantidade de dias
    Wait For Elements State    ${qtd_dias}
    browser.click    ${qtd_dias}
    Fill Text       ${qtd_dias}    txt=1
Acionar o botão + CADASTRAR    
    Wait For Elements State    ${btn_cadastrar}
    browser.click                    ${btn_cadastrar}
Inserir valores nos campos
    browser.click    ${select_valor}
    browser.click    ${input_valor}
    builtin.Sleep    1
Acionar o botão FINALIZAR
    browser.click    ${btn_finalizar}
    builtin.Sleep    3