*** Settings ***
Documentation        Arquivo com os casos de testes que serão usados na área do Operador

Resource    ../resources/base.resource
Resource    ../resources/pages/login/LoginPage.resource
Resource    ../resources/pages/gerenciamento/turno/GrupoTurno.resource
Resource    ../resources/pages/gerenciamento/turno/CadastroTurno.resource
Resource    ../resources/pages/gerenciamento/turno/EscalaTurno.resource
Resource    ../resources/pages/gerenciamento/turno/GrupoEquipamento.resource

Library    Process

Test Setup        Acessar o site Fast2 Mine
Test Teardown     Take Screenshot   telaFinalizacao   # Captura tela final


*** Test Cases ***

## O cenário 01 tem como objetivo, inserir novos registros na aba grupo de turno.
Cenario 01 - Inserir novos registros na aba Grupo de Turno
    [Tags]  turno
    Acessar aba Grupo de Turno no Submenu Turno
    Inserir o nome e descricao nos campos solicitados
    Acionar o botão Cadastrar
    Verificar se os dados foram cadastrados
    Acionar o botao finalizar na aba Grupo de turno   

## O cenário 02 tem como objetivo, selecionar um grupo de turno previamente cadastrado e atribuir um valor no campo nome
Cenario 02 - Inserir novos registros na aba Cadastro de Turno
    [Tags]  turno
    Acessar a aba Cadastro de Turno no Submenu Turno
    Inserir um Grupo de turno e nome
    Acionar o botao cadastrar   
    Verificar se as informações foram cadastradas

Cenario 03 - Alterar registros diretamente na listagem da aba Cadastro de Turno
    [Tags]    turno
    Acessar a aba Cadastro de Turno no Submenu Turno
    Editar itens na listagem

Cenário 04 - Cadastro de escalas de turno
    [Tags]    Escala de Turno
    Acessar a aba escala de turno no Submenu Turno
    Filtrar grupo de turno
    Selecionar um grupo na lista
    Inserir número de intervalos
    Acionar o botao cadastrar escala de turno
    Acionar o botao finalizar para salvar as informações
Cenario 5 - Inserir novos registros na aba Grupo de Equipamento
    [Tags]  Grupo de Equipamento
    Acessar a aba Grupo de Equipamento no Submenu Turno
    Alterar dados no grid   
    Acionar o botao finalizar na aba Grupo de equipamentos