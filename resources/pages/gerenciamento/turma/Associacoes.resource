*** Settings ***

Resource    ../../../../../../base.resource


Library    DateTime
Library    pyautogui

*** Variables ***
${submenu_turma}                   (//span[contains(.,'Turma')])[3]
${aba_associacoes}                 //span[contains(.,'Associações')]
${select_grupo_turno}              (//*[contains(text(), 'Selecione...')])[1]
${input_grupo_turno}               //*[@id="react-select-3-option-1"]
${select_grupo_turma}              (//*[contains(text(), 'Selecione...')])[1]
${input_grupo_turma}               //*[@id="react-select-4-option-1"] 
${select_cor}                      (//div[contains(@tabindex,'0')])[3]
${input_cor}                       (//li[@tabindex='-1'])[2]
${select_data_inicio}              (//input[contains(@type,'text')])[3]
${select_data_fim}                 (//input[contains(@type,'text')])[4]
${btn_finalizar}                   //button[contains(.,'FINALIZAR')]


*** Keywords ***

Acessar a aba Associações do submenu TURMA
    Verificar se estou na página inicial
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Acessar modulo Gerenciamento da Plataforma Mining Control
    Log    Acessando o Submenu
    browser.click    ${submenu_turma}
    
    Log    Acessando a aba Associaçoes
    browser.click    ${aba_associacoes}
    builtin.Sleep    2s
Pesquisar grupos de Turnos
    browser.click    ${select_grupo_turno}
Selecionar um grupo da lista
    ${grupo_turnos}    Get Page Source
    Log    ${grupo_turnos}     
Pesquisar grupos de Turmas
    browser.click    ${select_grupo_turma}
    ${html_source}    Get Page Source
    Log    ${html_source}
Selecionar uma turma da lista
    browser.click    ${input_grupo_turma}
Selecionar uma Cor
    browser.click    ${select_cor}
    browser.click    ${input_cor}
Definir um período
    browser.click    ${select_data_fim}
    Fill Text        ${select_data_fim}    txt=26/05/2024
Acionar o botão FINALIZAR na aba Associacoes
    browser.click    ${btn_finalizar}
    builtin.Sleep    2
    