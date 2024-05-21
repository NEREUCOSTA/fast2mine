*** Settings ***

Resource    ../../../../resources/base.resource
Resource    ../../../data/DadosLogin.resource
Resource    ../../login/LoginPage.resource

Library    DateTime
Library    pyautogui
# Library    ../../../../venv/Lib/site-packages/Browser/browser.py

*** Variables ***
${submenu_turma}                   (//span[contains(.,'Turma')])[3]
${aba_associacoes}                 //span[contains(.,'Associações')]
${select_grupo_turno}              (//*[contains(text(), 'Selecione...')])[1]
${input_grupo_turno}               //*[@id="react-select-3-option-1"]
${select_grupo_turma}              (//*[contains(text(), 'Selecione...')])[1]
${input_grupo_turma}               (//*[contains(text(), 'Equipe Perfuração - Matutino')])[1]
${select_cor}                      (//div[contains(@tabindex,'0')])[3]
${input_cor}                       (//li[@tabindex='-1'])[2]
${select_data_inicio}              (//input[contains(@type,'text')])[3]
${select_data_fim}                 (//input[contains(@type,'text')])[4]


*** Keywords ***
# Gerar Data
#     ${data_atual}=    Get Current Date    result_format=d%-d%m-%Y
#     Log    ${data_atual}
#     RETURN    ${data_atual}
Calcular Data Uma Semana Depois
    ${data_atual}=        Get Current Date    result_format=%Y-%m-%d %H:%M:%S.%f
    ${data_futura}=       Subtract Date From Date    ${data_atual}    7days
    ${data_uma_semana}    Convert Date    ${data_futura}    result_format=d%-d%m-%Y
    Set Test Variable    ${incluir_data}    ${data_uma_semana}
    # ${data_atual}=    Get Current Date    result_format=%Y-%m-%d
    # Log    Data atual: ${data_atual}
    # ${data_futura}=    Add Time To Date    ${data_atual}    7 days    result_format=%Y-%m-%d
    # Log    Data uma semana depois: ${data_futura}
    # ${data_formatada}=    Convert Date    ${data_futura}    result_format=%d/%m/%Y
    # Log    Data formatada: ${data_formatada}
    # [Return]    ${data_formatada}


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
    ${html_source}    Get Page Source
    Log    ${html_source}     
    # Scroll To Element    selector=${input_grupo_turno}
    # browser.click        selector=${input_grupo_turno}
Pesquisar grupos de Turmas
    browser.click    selector=${select_grupo_turma}
Selecionar uma turma da lista
    browser.click    selector=${input_grupo_turma}
Selecionar uma Cor
    browser.click    selector=${select_cor}
    browser.click    selector=${input_cor}
Definir um período
    browser.click    selector=${select_data_fim}
    # Clear element text
    Fill Text        selector=${select_data_fim}    txt=26/05/2024
    # # [Arguments]    ${selector}
    # Clear Element Text    selector=${select_data_fim}
    # ${data_futura}=    Calcular Data Uma Semana Depois
    # # Log    Inserindo data futura: ${data_futura}
    # Input Text    selector=${select_data_fim}   text=${incluir_data}
    # builtin.Sleep    10