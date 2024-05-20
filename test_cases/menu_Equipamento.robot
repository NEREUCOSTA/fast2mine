*** Settings ***
Documentation        Arquivo com os casos de testes que serão usados na área do Operador

Resource    ../resources/base.resource
Resource    ../resources/pages/gerenciamento/equipamento/GrupoEquipamento.resource
Resource    ../resources/pages/gerenciamento/equipamento/Equipamento.resource

Library    Process


Test Setup        Acessar o site Fast2 Mine
Test Teardown     Fechar o navegador


*** Test Cases ***

#####################################################
## SUBMENU EQUIPAMENTO - ABA GRUPOS DE EQUIPAMENTO ##
#####################################################

## O cenário 01 tem como objetivo, baixar um arquivo "xlsx" para inserção de novos dados, conforme indicação nas colunas.
Cenario 01 - Inserir novos registros na aba grupo de equipamento
    [Tags]  GRUPOS DE EQUIPAMENTO
    GrupoEquipamento.Acionar a opção grupo  
    GrupoEquipamento.Download da Planilha para Inserir novos registros grupo equipamentos
    GrupoEquipamento.Arquivo salvo na pasta do projeto equipamento
    Run Process  python  inserir_novos_registros_equipamento.py
    
## O cenário 02 tem como objetivo, importar a planilha após a inserção dos novos dados para que as informações sejam transmitidas para a plataforma.  
Cenario 02 - Importar planilha com novos registros na aba grupo de equipamento
    [Tags]  GRUPOS DE EQUIPAMENTO
    GrupoEquipamento.Acionar a opção grupo  
    Importar Planilha com os novos registros aba grupo equipamentos
    remove o arquivo da pasta equipamento

## O cenário 03 tem como objetivo, editar os registros que já estão na base de dados do sistema.
Cenário 03 - Editar Registros
     [Tags]  GRUPOS DE EQUIPAMENTO
    GrupoEquipamento.Acionar a opção grupo  
    Editar Registros aba grupo equipamento

###########################################
## SUBMENU EQUIPAMENTO - ABA EQUIPAMENTO ##
###########################################

## O cenário 04 tem como objetivo, baixar um arquivo "xlsx" para inserção de novos dados, conforme indicação nas colunas.
Cenario 04 - Inserir novos registros na aba equipamento
    [Tags]    EQUIPAMENTO
    Equipamento.Acionar a opção grupo
    Equipamento.Download da Planilha para Inserir novos registros grupo equipamentos
    Equipamento.Arquivo salvo na pasta do projeto equipamento
    Run Process    python    inserir_novos_registros_equipamento.py

## O cenário 05 tem como objetivo, importar a planilha após a inserção dos novos dados para que as informações sejam transmitidas para a plataforma.  
Cenario 05 - Importar planilha com novos registros na aba equipamento
    [Tags]    EQUIPAMENTO
    Equipamento.Acionar a opção grupo
    Equipamento.Importar Planilha com os novos registros aba Equipamento
    Equipamento.Remove o arquivo do diretório data
Cenario 06 - Editar Registros
     [Tags]    EQUIPAMENTO
     Equipamento.Acionar a opção grupo
     Equipamento.Editar Registros aba equipamento
