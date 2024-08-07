*** Settings ***
Resource    ../resources/pages/gerenciamento/elemento/elemento.resource
Documentation        Arquivo com os casos de testes que serão usados na área do Operador

Resource    ../resources/base.resource
Resource    ../resources/pages/login/LoginPage.resource
Resource    ../resources/pages/gerenciamento/turma/GruposTurma.resource
Resource    ../resources/pages/gerenciamento/turma/Turmas.resource
Resource    ../resources/pages/gerenciamento/turma/ListagemTurma.resource
Resource    ../resources/pages/gerenciamento/turma/Associacoes.resource

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
    Run Process    python    inserir_novos_registros_elementos.py

Cenario 02 - Importar planilha com novos registros na aba grupo de equipamento
    [Tags]  GRUPO DE ELEMENTO
    Acessar a aba Grupo de elemento no Submenu elemento
    Importar Planilha com os novos registros aba grupo elemento
    Remove o arquivo do diretório data

Cenario 03 - Editar Registros
     [Tags]    EQUIPAMENTO
        Editar Registros aba equipamento    