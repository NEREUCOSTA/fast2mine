*** Settings ***
Documentation        Arquivo com os casos de testes que serão usados na área do Operador

Resource    ../resources/base.resource
Resource    ../resources/pages/login/login_page.resource
Resource    ../resources/pages/gerenciamento/operador.resource
Resource    ../resources/pages/gerenciamento/turma/GruposTurma.resource
Resource    ../resources/pages/gerenciamento/turma/Turmas.resource

Test Setup        Acessar o site Fast2 Mine
Test Teardown     Fechar o navegador

*** Test Cases ***

Cenario 01 - Inserir um novo Grupo de turma
    Verificar se estou na página inicial
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Acessar modulo Gerenciamento do Turma na aba Grupos de turma
    Inserir o nome e descricao nos campos solicitados
    Acionar o botão Cadastrar
    Verificar se os dados foram cadastrados
    Acionar o botao finalizar na aba Grupos de Turma

Cenario 02 - Inserir uma nova turma
    Verificar se estou na página inicial
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Acessar modulo Gerenciamento do Turma na aba Turmas
    Inserir o nome e descricao nos campos solicitados Turmas
    Acionar o botão Cadastrar turmas
    Verificar se os dados foram cadastrados turmas
    Acionar o botao finalizar na aba Turmas