*** Settings ***

Resource    ../../../../resources/base.resource
Resource    ../../../data/DadosLogin.resource
Resource    ../../login/LoginPage.resource

Library    DateTime
Library    pyautogui

*** Variables ***
${submenu_turma}                   (//span[contains(.,'Turma')])[3]
${aba_associacoes}                 //span[contains(.,'Associações')]
${select_grupo_turno}              (//*[contains(text(), 'Selecione...')])[1]
${input_grupo_turno}               //*[@id="react-select-3-option-16"]
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
    browser.click    selector=${submenu_turma}
    builtin.Sleep    2
    browser.click    selector=${aba_associacoes}

Pesquisar grupos de Turnos
    browser.click    selector=${select_grupo_turno}
Selecionar um grupo da lista
    # ${html_source}    Get Page Source
    # Log    ${html_source}     
    Scroll To Element    selector=${input_grupo_turno}
    browser.click        selector=${input_grupo_turno}
Pesquisar grupos de Turmas
    browser.click    selector=${select_grupo_turma}
Selecionar uma turma da lista
    # ${html_source}    Get Page Source
    # Log    ${html_source}
    browser.click    selector=${input_grupo_turma}
Selecionar uma Cor
    browser.click    selector=${select_cor}
    browser.click    selector=${input_cor}
Definir um período
    browser.click    selector=${select_data_fim}
    Fill Text        selector=${select_data_fim}    txt=26/05/2024
Acionar o botão FINALIZAR na aba Associacoes
    browser.click    selector=${btn_finalizar}
    builtin.Sleep    2
    # # [Arguments]    ${selector}
    # Clear Element Text    selector=${select_data_fim}
    # ${data_futura}=    Calcular Data Uma Semana Depois
    # # Log    Inserindo data futura: ${data_futura}
    # Fill Text    selector=${select_data_fim}   text=${incluir_data}
    # builtin.Sleep    10