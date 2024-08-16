*** Settings ***
Documentation       Suite de testes contendo os testes da funcionalidade Código!

Resource    ../resources/base.resource
Resource    ../resources/pages/gerenciamento/codigo/codigo.resource
Resource    ../resources/pages/gerenciamento/operador/Operador.resource

Test Setup      Acessar o site Fast2 Mine
Test Teardown   Fechar o navegador

*** Test Cases ***

#####################################################
###         SUBMENU CÓDIGO - ABA CÓDIGOS          ###
#####################################################

## O cenário 01 tem como objetivo baixar um arquivo "xlsx" para inserção de novos dados, conforme indicação nas colunas.
Cenario 01 - Inserir novos registros na aba códigos
    [Tags]  CÓDIGOS
    Acessar a aba código no Submenu código
    Download da Planilha para Inserir novos registros
    Arquivo salvo na pasta do projeto
    Run Process  C:\\Fast2mine - miningcontrol\\fast2_mine_main\\fast2mine\\venv\\Scripts\\python.exe   inserir_novos_registros_codigo.py

## O cenário 02 tem como objetivo importar a planilha após a inserção dos novos dados para que as informações sejam transmitidas para a plataforma.
Cenario 02 - Importar planilha com novos registros
    [Tags]  CÓDIGOS
    Acessar a aba código no Submenu código
    Importar Planilha com os novos registros
    Remove o arquivo do diretório data
Cenário 03 - Editar Registros
    [Tags]  CÓDIGOS
    Acessar a aba código no Submenu código
    Editar registros