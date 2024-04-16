*** Settings ***
Library    SeleniumLibrary
Resource    ../../base.resource
Resource    ../../data/dados_login.resource

*** Variables ***
${input_email}        //input[contains(@name,'E-mail')]
${input_senha}        //input[contains(@name,'Password')]
${btn_enter}          //button[contains(.,'ENTRAR')]

*** Keywords ***
Inserir email e senha cadastrados
    Input Text        locator=${input_email}    text=${email}
    Input Password    locator=${input_senha}    password=${password}
Acionar o botão enter para autenticar no sistema
    Click Button      locator=${btn_enter}
Login realizado
    Builtin.Sleep    4s

Email ou senha invalidos
    Input Text        locator=${input_email}       text=${email_invalido}
    Input Password    locator=${input_senha}       password=${password_invalido}
Mensagem de credenciais invalidas
    builtin.Sleep    2