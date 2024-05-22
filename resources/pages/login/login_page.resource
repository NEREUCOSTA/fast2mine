*** Settings ***
Library    SeleniumLibrary
Resource    ../../base.resource
Resource    ../../data/dados_login.resource

*** Variables ***
${input_email}        //input[@name='E-mail']
${input_senha}        //*[@id="Password"]
${btn_enter}          //button[contains(.,'ENTRAR')]
${input_emnail_invalido}  //p[contains(.,'Email / senha inválidos')]

*** Keywords ***
Inserir email e senha cadastrados
    # Log    Inserindo email cadastrado ${email}
    Press Keys  ${input_email}      admin@fast2mine.com    
    # Log    Inserindo senha cadastrada ${senha}
    Press Keys  ${input_senha}  ${senha}
Acionar o botão enter para autenticar no sistema
    Click Button      locator=${btn_enter}
Login realizado
    Builtin.Sleep    4s

# Login inválido
Inserir email e senha cadastrados errados
    Input Text        ${input_email}    ${email invalido}
    Input Password    ${input_senha}    ${password}

Acionar o botão enter para logar no sistema
    Click Button      locator=${btn_enter}    

login invalido      
   Wait Until Element Is Visible    locator=${input_emnail_invalido}
   