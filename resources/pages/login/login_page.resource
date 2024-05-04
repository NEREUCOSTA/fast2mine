*** Settings ***
Library    SeleniumLibrary
Resource    ../../base.resource
Resource    ../../data/dados_login.resource

*** Variables ***
${input_email}        //input[@class='MuiInputBase-input MuiOutlinedInput-input']
${input_senha}        //*[@id="Password"]
${btn_enter}          //button[contains(.,'ENTRAR')]
${input_emnail_invalido}  //p[contains(.,'Email / senha inválidos')]

*** Keywords ***
Inserir email e senha cadastrados
    Input Text        locator=${input_email}    text=${email}
    Input Password    locator=${input_senha}    password=${password}
Acionar o botão enter para autenticar no sistema
    Click Button      locator=${btn_enter}
Login realizado
    Builtin.Sleep    4s

# Login inválido
Inserir email e senha cadastrados errados
    Input Text        locator=${input_email}    text=${email invalido}
    Input Password    locator=${input_senha}    password=${password}

Acionar o botão enter para logar no sistema
    Click Button      locator=${btn_enter}    

login invalido      
   Wait Until Element Is Visible    locator=${input_emnail_invalido}
   