*** Settings ***
Resource    ../resources/base.resource
Resource    ../resources/pages/login/login_page.resource

Test Setup        Acessar o site Fast2 Mine 
Test Teardown     Fechar o navegador

*** Test Cases ***
Cenário 1: Login bem-sucedido
    [Tags]  sucesso
    Verificar se estou na página inicial
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado

Cenário 2: Login invalido
    [Tags]  invalido
    Verificar se estou na página inicial
    Inserir email e senha cadastrados errados
    Acionar o botão enter para logar no sistema
    Login invalido
    
    
