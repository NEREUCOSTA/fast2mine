*** Settings ***
Documentation        Arquivo com os casos de testes que serão usados na área do Operador

Resource    ../resources/base.resource
Resource    ../resources/pages/gerenciamento/operador/Grupo.resource
Resource    ../resources/pages/gerenciamento/operador/Operador.resource

Library    Process


Test Setup        Acessar o site Fast2 Mine
Test Teardown     Fechar o navegador


*** Test Cases ***

# MENU GRUPO
## O cenário 01 tem como objetivo, baixar um arquivo "xlsx" para inserção de novos dados, conforme indicação nas colunas.
Cenario 01 - Inserir novos registros na aba grupo
    [Tags]  operador
    Acionar a opção grupo  
    Download da Planilha para Inserir novos registros
    Arquivo salvo na pasta do projeto
    Run Process    python  inserir_novos_registros_grupo.py
    
## O cenário 02 tem como objetivo, importar a planilha após a inserção dos novos dados para que as informações sejam transmitidas para a plataforma.  
Cenario 02 - Importar planilha com novos registros
    [Tags]  operador import
    Acionar a opção grupo  
    Importar Planilha com os novos registros
    remove o arquivo da pasta

## O cenário 03 tem como objetivo, editar os registros que já estão na base de dados do sistema ###
Cenário 03 - Editar Registros
     [Tags]  operador
    Acionar a opção grupo  
    Editar Registros

## MENU OPERADOR

#O cenário 04 tem como objetivo, baixar um arquivo "xlsx" para inserção de novos dados, conforme indicação nas colunas.
Cenario 04 - Inserir novos registros na aba operador
    [Tags]  Operador
    Acionar a opção operador
    Download da Planilha para Inserir Novos Registros Operador
    Arquivo salvo na pasta do projeto Operador
    Run Process  python  inserir_novos_registros_operador.py

## O cenário 05 tem como objetivo, importar a planilha após a inserção dos novos dados para que as informações sejam transmitidas para a plataforma.  
Cenario 05 - Importar planilha com novos registros
    [Tags]  importar planilha
    Acionar a opção operador
    Importar Planilha com os novos registros Operador
    remove o arquivo da pasta Operador

    
Cenário 06 - Editar Registros
    Acionar a opção operador
    Editar Registros Operador
