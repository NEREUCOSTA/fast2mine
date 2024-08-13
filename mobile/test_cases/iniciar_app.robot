
*** Settings ***
Resource     ../resources/base.resource
Resource    ../resources/pages/paginaInicialApp.resource

Test Setup    Acessar a tela inicial do App
Test Teardown   


*** Test Cases ***
CT01 - Acessar página inicial do app
    Dado que o usuário acessa a página inicial do app
    Quando o usuário inserir um ID de operador válido
    E o usuário inserir uma senha válida
    E acionar o botão Acessar
    # Então o usuário será redirecionado para a tela inicial do app