language: pt-BR
*** Configurações ***
Recurso     ../resources/base.resource
Resource    ../resources/pages/paginaInicialApp.resource

Inicialização de Teste    Acessar a tela inicial do App
Finalização de Teste    


*** Casos De Teste ***
CT01 - Acessar página inicial do app
    Dado Dado que o usuário acessa a página inicial do app
    Quando o usuário inserir um ID de operador válido
    E o usuário inserir uma senha válida
    E acionar o botão Acessar
    # Então o usuário será redirecionado para a tela inicial do app