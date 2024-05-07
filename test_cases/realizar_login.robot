*** Settings ***

Resource    ../resources/base.resource

Test Setup        Acessar o site Fast2 Mine
Test Teardown     Take Screenshot    browser.Close Browser    All

*** Test Cases ***
Cenário 1: Login bem-sucedido
    [Tags]  sucesso
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado

Cenário 2: Login inválido "email incorreto"
    [Tags]  invalido
    Inserir email e senha cadastrados errados
    Acionar o botão enter para autenticar no sistema
    Login invalido

Cenário 3: Login inválido "senha incorreta"
    [Tags]  invalido
    
