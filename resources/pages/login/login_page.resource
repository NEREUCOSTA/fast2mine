*** Settings ***
Library    SeleniumLibrary
Resource    ../../base.resource
Resource    ../../data/dados_login.resource

*** Variables ***
${input_email}            //input[contains(@name,'E-mail')]
${input_senha}            //input[contains(@name,'Password')]
${btn_enter}              //button[contains(.,'ENTRAR')]
${input_emnail_invalido}  //p[contains(.,'Email / senha inválidos')]

*** Keywords ***
Inserir email e senha cadastrados
    Input Text        locator=${input_email}    text=${email}
    Input Password    locator=${input_senha}    password=${password}
Acionar o botão enter para autenticar no sistema
    Wait Until Element Is Visible    locator=${btn_enter}
    Click Element                    locator=${btn_enter}
Login realizado
    Builtin.Sleep    4s

# Login inválido
Inserir email e senha cadastrados errados
    Input Text        locator=${input_email}    text=${email_invalido}
    Input Password    locator=${input_senha}    password=${password}  

login invalido      
   Wait Until Element Is Visible    locator=${input_emnail_invalido}
   