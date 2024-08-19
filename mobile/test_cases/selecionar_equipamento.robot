
*** Settings ***
Resource     ../resources/base.resource
Resource    ../resources/pages/paginaInicialApp.resource
Resource    ../resources/pages/selecionar_equipamento.resource

Test Setup    Acessar a tela inicial do App
Test Teardown   


*** Test Cases ***
CT01 - Selecionar um equipamento
    Dado que o usuário esteja logado no App
    Quando o usuário selecionar um equipamento
    E digitar o código
    E clicar no botao Avancar
    Então o sistema exibirá a tela do Check list