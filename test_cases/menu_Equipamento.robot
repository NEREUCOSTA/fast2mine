*** Settings ***
Documentation        Arquivo com os casos de testes que serão usados no Submenu de Equipamento

Resource    ../resources/base.resource
Resource    ../resources/pages/gerenciamento/equipamento/Equipamento.resource
Resource    ../resources/pages/gerenciamento/equipamento/GrupoEquipamento.resource

Library    Process


Test Setup        Acessar o site Fast2 Mine
Test Teardown     Fechar o navegador


*** Test Cases ***

#####################################################
## SUBMENU EQUIPAMENTO - ABA GRUPO DE EQUIPAMENTO ###
#####################################################

## O cenário 01 tem como objetivo, baixar um arquivo "xlsx" para inserção de novos dados, conforme indicação nas colunas.
Cenario 01 - Inserir novos registros na aba grupo de equipamento
    [Tags]  GRUPO DE EQUIPAMENTO
    Acessar a aba Grupo de Equipamento no Submenu Equipamento
    Download da Planilha para Inserir novos registros aba Grupo Equipamentos
    Arquivo salvo na pasta do projeto Grupo Equipamento
    Run Process  C:\\QA\\venv_fast2mine\\Scripts\\python.exe  inserir_novos_registros_equipamento.py
    
## O cenário 02 tem como objetivo, importar a planilha após a inserção dos novos dados para que as informações sejam transmitidas para a plataforma.  
Cenario 02 - Importar planilha com novos registros na aba grupo de equipamento
    [Tags]  GRUPO DE EQUIPAMENTO
    Acessar a aba Grupo de Equipamento no Submenu Equipamento  
    Importar Planilha com os novos registros aba grupo equipamentos
    Remove o arquivo do diretório data.

## O cenário 03 tem como objetivo, editar os registros que já estão na base de dados do sistema
Cenário 03 - Editar Registros
    [Tags]  GRUPO DE EQUIPAMENTO
    Acessar a aba Grupo de Equipamento no Submenu Equipamento
    Editar registros da aba Grupo de Equipamento

###########################################
## SUBMENU EQUIPAMENTO - ABA EQUIPAMENTO ##
###########################################

## O cenário 04 tem como objetivo, baixar um arquivo "xlsx" para inserção de novos dados, conforme indicação nas colunas.
Cenario 04 - Inserir novos registros na aba equipamento
    [Tags]    EQUIPAMENTO
    Acessar a aba Equipamento no Submenu Equipamento
    Download da Planilha para Inserir novos registros aba Equipamentos
    Arquivo salvo na pasta do projeto equipamento
    Run Process   C:\\QA\\venv_fast2mine\\Scripts\\python.exe    inserir_novos_registros_equipamento.py

## O cenário 05 tem como objetivo, importar a planilha após a inserção dos novos dados para que as informações sejam transmitidas para a plataforma.  
Cenario 05 - Importar planilha com novos registros na aba equipamento
    [Tags]    EQUIPAMENTO
    Acessar a aba Equipamento no Submenu Equipamento
    Importar Planilha com os novos registros aba Equipamentos
    Remove o arquivo do diretório data
Cenario 06 - Editar Registros
     [Tags]    EQUIPAMENTO
     Acessar a aba Equipamento no Submenu Equipamento
     Editar Registros aba equipamento