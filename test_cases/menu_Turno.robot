*** Settings ***
Documentation        Arquivo com os casos de testes que serão usados na área do Operador

Resource    ../resources/base.resource
Resource    ../resources/pages/login/LoginPage.resource
Resource    ../resources/pages/gerenciamento/operador.resource
Resource    ../resources/pages/gerenciamento/turno.resource

Library    Process

Test Setup        Acessar o site Fast2 Mine
Test Teardown     Acionar o botao finalizar na aba cadastro de turno


*** Test Cases ***

## O cenário 01 tem como objetivo, baixar um arquivo "xlsx" para inserção de novos dados, conforme indicação nas colunas.
Cenario 01 - Inserir novos registros na aba Grupo de Turno
    [Tags]  turno
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Acessar modulo Gerenciamento do Turno na aba Grupo de turno
    Inserir o nome e descricao nos campos solicitados
    Acionar o botão Cadastrar
    Verificar se os dados foram cadastrados   
Cenario 02 - Inserir novos registros na aba Cadastro de Turno
    [Tags]  turno
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Acessar modulo Gerenciamento do Turno na aba Cadastro de Turno
    Inserir um Grupo de turno e nome
    Acionar o botao cadastrar   
    Verificar se as informações foram cadastradas

Cenario 03 - Alterar registros diretamente na listagem
    [Tags]    turno
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Acessar modulo Gerenciamento do Turno na aba Cadastro de Turno
    Editar itens na listagem

