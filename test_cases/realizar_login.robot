*** Settings ***
Resource    ../resources/base.resource
Resource    ../resources/pages/login/login_page.resource

Test Setup        Abrir o navegador
Test Teardown     Fechar o navegador

*** Test Cases ***
Cenário 1: Login bem-sucedido
    Acessar o site Fast2 Mine
    Verificar se estou na página inicial
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    
    
