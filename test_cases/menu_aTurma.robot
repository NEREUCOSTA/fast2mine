*** Settings ***
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

Cenario 01 - Inserir um novo Grupo de turma
    [Tags]   Grupos de turma
    Acessar a aba Grupos no Submenu Turma
    Inserir o nome e descricao nos campos solicitados
    Acionar o botão Cadastrar
    Verificar se os dados foram cadastrados
    Acionar o botao finalizar na aba Grupos de Turma

Cenario 02 - Inserir uma nova turma
    [Tags]    Turmas
    Acessar a aba Turmas no Submenu Turma
    Inserir o nome e descricao nos campos solicitados Turmas
    Acionar o botão Cadastrar turmas
    Verificar se os dados foram cadastrados turmas
    Acionar o botao finalizar na aba Turmas
Cenario 03 - Editar um Grupo de turma 
    [Tags]    Listagem de turmas
    Acessar a aba Listagem de Turmas do submenu TURMA
    Pesquisar pelo Grupo de Turno desejado
    Pesquisar pelo Grupo de Turma desejado
    Informar a quantidade de dias
    Acionar o botão + CADASTRAR
    Inserir valores nos campos
    Acionar o botão FINALIZAR
Cenario 04 - Inserir intervalo de datas 
    [Tags]    Associacoes
    Acessar a aba Associações do submenu TURMA
    Pesquisar grupos de Turnos
    Selecionar um grupo da lista
    Pesquisar grupos de Turmas
    # Selecionar uma turma da lista
    # Selecionar uma Cor
    # Definir um período
    # Acionar o botão FINALIZAR na aba Associacoes