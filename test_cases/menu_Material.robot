*** Settings ***
Documentation    Arquivo responsável por armazenar as informações do Submenu Material

Resource    ../resources/base.resource
Resource    ../resources/pages/gerenciamento/material/GrupoMateriais.resource
Resource    ../resources/pages/gerenciamento/material/Material.resource
Resource    ../resources/pages/gerenciamento/material/Movimentacao.resource
Resource    ../resources/pages/gerenciamento/material/TipoMovimentacao.resource

Library    Process

Test Setup      Acessar o site Fast2 Mine
Test Teardown   Fechar o navegador

*** Test Cases ***

#####################################################
###   SUBMENU MATERIAL - ABA GRUPO DE MATERIAIS   ###
#####################################################

## O cenário 01 tem como objetivo baixar um arquivo "xlsx" para inserção de novos dados, conforme indicação nas colunas.
Cenario 01 - Inserir novos registros na aba grupo de materiais
    [Tags]  GRUPO DE MATERIAIS
    Acessar a aba Grupo de Materiais no Submenu Material
    Download da Planilha para Inserir novos registros aba Grupo Materiais
    Arquivo salvo na pasta do projeto Grupo Materiais
    Run Process    F:\\Projetos\\Nereu_Fast_2_Mine\\fast2mine\\venv\\Scripts\\python.exe    inserir_novos_registros_material.py
    
## O cenário 02 tem como objetivo importar a planilha após a inserção dos novos dados para que as informações sejam transmitidas para a plataforma.
Cenario 02 - Importar planilha com novos registros na aba grupo de materiais
    [Tags]  GRUPO DE MATERIAIS
    Acessar a aba Grupo de Materiais no Submenu Material
    Importar Planilha com os novos registros aba grupo materiais
    Remove o arquivo do diretório data.

## O cenário 03 tem como objetivo editar os registros que já estão na base de dados do sistema
Cenário 03 - Editar Registros
    [Tags]  GRUPO DE MATERIAIS
    Acessar a aba Grupo de Materiais no Submenu Material
    Editar registros da aba Grupo de Materiais

#####################################################
###      SUBMENU MATERIAL - ABA MATERIAL          ###
#####################################################

## O cenário 04 tem como objetivo baixar um arquivo "xlsx" para inserção de novos dados, conforme indicação nas colunas.
Cenario 04 - Inserir novos registros na aba material
    [Tags]    MATERIAL
    Acessar a aba Material no Submenu Material
    Download da Planilha para Inserir novos registros aba Material
    Arquivo salvo na pasta do projeto Material
    Run Process    F:\\Projetos\\Nereu_Fast_2_Mine\\fast2mine\\venv\\Scripts\\python.exe    inserir_novos_registros_material.py

## O cenário 05 tem como objetivo importar a planilha após a inserção dos novos dados para que as informações sejam transmitidas para a plataforma.
Cenario 05 - Importar planilha com novos registros na aba material
    [Tags]    MATERIAL
    Acessar a aba Material no Submenu Material
    Importar Planilha com os novos registros aba material
    remove o arquivo do diretório data aba material

## O cenário 06 tem como objetivo editar os registros que já estão na base de dados do sistema
Cenário 06 - Editar Registros
    [Tags]    MATERIAL
    Acessar a aba Material no Submenu Material
    Editar registros da aba Material
    