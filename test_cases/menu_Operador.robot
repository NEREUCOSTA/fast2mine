*** Settings ***
Documentation        Arquivo com os casos de testes que serão usados na área do Operador

Resource    ../resources/base.resource
Resource    ../resources/pages/login/login_page.resource
Resource    ../resources/pages/gerenciamento/operador.resource

Library    Process

Test Setup        Acessar o site Fast2 Mine
Test Teardown     Fechar o navegador

*** Test Cases ***

## O cenário 01 tem como objetivo, baixar um arquivo "xlsx" para inserção de novos dados, conforme indicação nas colunas.
Cenario 01 - Inserir novos registros na aba grupo
    [Tags]  grupo
    Verificar se estou na página inicial
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Acessar modulo Gerenciamento do Operador na aba Grupo
    Download da Planilha para Inserir novos registros
    Arquivo salvo na pasta do projeto
    Run Process  python  inserir_novos_registros.py
    
## O cenário 02 tem como objetivo, importar a planilha após a inserção dos novos dados para que as informações sejam transmitidas para a plataforma.  
Cenario 02 - Importar planilha com novos registros
    [Tags]  grupo_1
    Verificar se estou na página inicial
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Acessar modulo Gerenciamento do Operador na aba Grupo
    Importar Planilha com os novos registros
    remove o arquivo da pasta

## O cenário 03 tem como objetivo, editar os registros que já estão na base de dados do sistema.
Cenário 03 - Editar Registros
    [Tags]  grupo_2
    Verificar se estou na página inicial
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Acessar modulo Gerenciamento do Operador na aba Grupo
    Editar Registros

## Sub menu Operador

#O cenário 04 tem como objetivo, baixar um arquivo "xlsx" para inserção de novos dados, conforme indicação nas colunas.
Cenario 04 - Inserir novos registros na aba operador
    [Tags]  Operador
    Verificar se estou na página inicial
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Acessar modulo Gerenciamento do Operador na aba Operador
    Download da Planilha para Inserir Novos Registros Operador
    Arquivo salvo na pasta do projeto Operador
    Run Process  python  inserir_novos_registros_operador.py

## O cenário 05 tem como objetivo, importar a planilha após a inserção dos novos dados para que as informações sejam transmitidas para a plataforma.  
Cenario 05 - Importar planilha com novos registros
    [Tags]  importar planilha
    Verificar se estou na página inicial
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Acessar modulo Gerenciamento do Operador na aba Operador
    Importar Planilha com os novos registros Operador
    remove o arquivo da pasta

    
Cenário 06 - Editar Registros
    Verificar se estou na página inicial
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Acessar modulo Gerenciamento do Operador na aba Grupo
    Editar Registros Operador
