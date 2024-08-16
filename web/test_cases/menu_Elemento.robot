*** Settings ***
Resource    ../resources/pages/gerenciamento/elemento/elemento.resource
Resource    ../resources/base.resource

Library    Process

Test Setup        Acessar o site Fast2 Mine
Test Teardown     Fechar o navegador

*** Test Cases ***

Cenario 01 - Inserir novos registros na aba elemento
    [Tags]  operador
    Acessar a aba elemento no Submenu elemento
    Selecionar nome e ativo
    Clicar no botão pesquisar
    Download da Planilha para Inserir novos registros aba Grupo Equipamentos
    Arquivo salvo na pasta do projeto Grupo Equipamento
    Run Process    C:\\Fast2mine - miningcontrol\\fast2_mine_main\\fast2mine\\venv\\Scripts\\python.exe    inserir_novos_registros_elementos.py

Cenario 02 - Importar planilha com novos registros na aba grupo de equipamento
    [Tags]  GRUPO DE ELEMENTO
    Acessar a aba Grupo de elemento no Submenu elemento
    Importar Planilha com os novos registros aba grupo elemento
    Remove o arquivo do diretório data

Cenario 03 - Editar Registros
    [Tags]    EQUIPAMENTO 
    Editar Registros aba equipamento    


#### ABA SUB-ELEMENTO ####
        
Cenario 04 - Inserir novos registros na aba sub-elemento
    [Tags]    sub-elemento
    Acessar a aba elemento no Submenu sub-elemento
    Selecionar nome
    Selecionar Elemento
    Selecionar ativos
    Clicar no botao pesquisar sub-elemento
    Download da Planilha para Inserir novos registros aba sub-elementos
    Arquivo salvo na pasta do projeto equipamento
    Run Process    python    inserir_novos_registros_elementos.py        