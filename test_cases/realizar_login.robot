*** Settings ***
Resource    ../resources/base.resource
Resource    ../resources/pages/login/login_page.resource

Test Teardown     browser.Close Browser    All

*** Test Cases ***
Cenário 1: Login bem-sucedido
    [Tags]  sucesso
    Acessar o site Fast2 Mine
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado

Cenário 2: Login invalido
    [Tags]  invalido
    Acessar o site Fast2 Mine
    Inserir email e senha cadastrados errados
    Acionar o botão enter para autenticar no sistema
    Login invalido
    
    
