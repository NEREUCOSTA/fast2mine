*** Settings ***
Resource    ../resources/base.resource
Resource    ../resources/pages/login/login_page.resource

Test Setup        Acessar o site Fast2 Mine
Test Teardown     Fechar o navegador

*** Test Cases ***
Cenário 1: Login bem-sucedido
    Verificar se estou na página inicial
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado

Cenario 2: Falha ao tentar acessar o sistema
    Verificar se estou na página inicial
    Email ou senha invalidos
    Acionar o botão enter para autenticar no sistema
    Mensagem de credenciais invalidas

    
    
