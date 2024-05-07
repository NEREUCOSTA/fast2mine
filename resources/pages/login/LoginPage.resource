*** Settings ***
Resource    ../../base.resource

*** Variables ***
${input_email}            //*[@id="E-mail"]
${input_senha}            //input[@name='Password']
${btn_enter}              //button[contains(.,'ENTRAR')]
${input_emnail_invalido}  //p[contains(.,'Email / senha inválidos')]

*** Keywords ***
Inserir email e senha cadastrados
    browser.Click          selector=${input_email}
    Fill Text              selector=${input_email}    txt=${email}
    browser.Click          selector=${input_senha}
    Fill Secret            selector=${input_senha}    secret=$password
    
    # Click Element     locator=${input_email}
    # Input Text        locator=${input_email}    text=${email}
    # Click Element     locator=${input_senha}
    # Input Password    locator=${input_senha}    password=${password}  
Acionar o botão enter para autenticar no sistema
   browser.Click          selector=${btn_enter}
Login realizado
    builtin.Sleep    3s

# Login inválido
Inserir email e senha cadastrados errados
    Input Text        locator=${input_email}    text=${email_invalido}
    Input Password    locator=${input_senha}    password=${password}  

login invalido      
   Wait Until Element Is Visible    locator=${input_emnail_invalido}
   