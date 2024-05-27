*** Settings ***

Resource    ../resources/base.resource


*** Variables ***
${submenu_turma}                   (//span[contains(.,'Turma')])[3]
${aba_listagem_turmas}             //span[contains(.,'Listagem de Turmas')]
${select_grupo}                    (//*[contains(text(), 'Selecione...')])[1]
${input_turno}                     //*[@id="react-select-3-option-1"]      
${select_turma}                    (//*[contains(text(), 'Selecione...')])[1]
${input_turma}                     //*[@id="react-select-4-option-1"]  
${qtd_dias}                        //input[contains(@name,'days')]
${btn_cadastrar}                   (//*[contains(text(), 'Cadastrar')])[1]
${select_dia}                      (//*[contains(text(), 'Selecione...')])[1]  
${input_valor}                     //*[@id="react-select-5-option-1"]
${select_folga}                    (//*[contains(text(), 'Selecione...')])[1]
${btn_finalizar}                   //span[contains(.,'FINALIZAR')]



*** Keywords ***
Acessar a aba Listagem de Turmas do submenu TURMA
    Verificar se estou na página inicial
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado  
    Acessar modulo Gerenciamento da Plataforma Mining Control
    Log    Acessando o Submenu 
    browser.click    ${submenu_turma}
    
    Log    Acessando a aba Listagem de Turmas
    browser.click    ${aba_listagem_turmas}
    BuiltIn.Sleep  2s
Pesquisar pelo Grupo de Turno desejado
    browser.click    ${select_grupo}
    browser.click    ${input_turno}
Pesquisar pelo Grupo de Turma desejado
    browser.click    ${select_turma}
    browser.click    ${input_turma}
Informar a quantidade de dias
    Wait For Elements State    ${qtd_dias}
    browser.click    ${qtd_dias}
    Fill Text        ${qtd_dias}    1
Acionar o botão + CADASTRAR
    Log    Cliando no botão Cadastrar
    Wait For Elements State    ${btn_cadastrar}
    browser.click              ${btn_cadastrar}

Inserir valores nos campos
    browser.click    ${select_dia}
    # ${ListagemTurmaHTML}=           Get Page Source
    # Log    ${ListagemTurmaHTML}
    browser.click    ${input_valor}
    builtin.Sleep    1
Acionar o botão FINALIZAR
    Log    Finalizando o cadastro
    browser.click    ${btn_finalizar}
    builtin.Sleep    3