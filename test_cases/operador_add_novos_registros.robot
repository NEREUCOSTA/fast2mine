*** Settings ***
Documentation        Arquivo com os casos de testes que serão usados na área do Operador

Resource    ../resources/base.resource
Resource    ../resources/pages/login/login_page.resource
<<<<<<< HEAD
Resource    ../resources/pages/gerenciamento/operador_grupo.resource
=======
Resource    ../resources/pages/gerenciamento/operador.resource
>>>>>>> main

Test Setup        Acessar o site Fast2 Mine
Test Teardown     Fechar o navegador

*** Test Cases ***

<<<<<<< HEAD
# O cenário 01 tem como objetivo, baixar um arquivo "xlsx" para inserção de novos dados, conforme indicação nas colunas.
=======
## O cenário 01 tem como objetivo, baixar um arquivo "xlsx" para inserção de novos dados, conforme indicação nas colunas.
>>>>>>> main
Cenario 01 - Inserir novos registros na aba grupo
    Verificar se estou na página inicial
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
<<<<<<< HEAD
    Acessar modulo Gerenciamento
    Download da Planilha para Inserir novos registros
    Arquivo salvo na pasta do projeto

# O cenário 02 tem como objetivo, importar a planilha após a inserção dos novos dados para que as informações sejam transmitidas para a plataforma.  
=======
    Acessar modulo Gerenciamento do Operador na aba Grupo
    Download da Planilha para Inserir novos registros
    Arquivo salvo na pasta do projeto

## O cenário 02 tem como objetivo, importar a planilha após a inserção dos novos dados para que as informações sejam transmitidas para a plataforma.  
>>>>>>> main
Cenario 02 - Importar planilha com novos registros
    Verificar se estou na página inicial
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
<<<<<<< HEAD
    Acessar modulo Gerenciamento
    Upload da Planilha com os novos registros
=======
    Acessar modulo Gerenciamento do Operador na aba Grupo
    Importar Planilha com os novos registros

## O cenário 03 tem como objetivo, editar os registros que já estão na base de dados do sistema.
Cenário 03 - Editar Registros
    Verificar se estou na página inicial
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Acessar modulo Gerenciamento do Operador na aba Grupo
    Editar Registros

>>>>>>> main
    