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
    
    # browser.click     selector=${input_email}
    # Fill Text        selector=${input_email}    text=${email}
    # browser.click     selector=${input_senha}
    # Fill Secret    selector=${input_senha}    password=${password}  
Acionar o botão enter para autenticar no sistema
   browser.Click          selector=${btn_enter}
Login realizado
    builtin.Sleep    3s

# Login inválido
Inserir email e senha cadastrados errados
    Fill Text        selector=${input_email}     txt=${email_invalido}
    Fill Secret      selector=${input_senha}       secret=${password}  

login invalido      
   Wait For Elements State    selector=${input_emnail_invalido}
   