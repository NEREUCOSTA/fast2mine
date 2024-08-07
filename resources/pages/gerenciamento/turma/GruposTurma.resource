*** Settings ***

Resource    ../../../base.resource
Resource    ../../../data/DadosLogin.resource
Resource    ../../login/LoginPage.resource


*** Variables ***
${menu_turma}               //span[@class='MuiFab-label'][contains(.,'Turma')]
${aba_Grupo_Turma}          //span[contains(.,'Grupos de Turma')]
${campo_grupo_turno}        //p[contains(.,'Selecione...')]
${selecionar_grupo_turno}   (//div[contains(@tabindex,'-1')])[2]
${nome_grupo_turma}         //input[@name='name']
${btn_cadastrar_turma}      //button[@type='submit']
${verificar_cadastro}       //th[contains(.,'STATUS')]
${btn_finalizar_turma}      //span[@class='MuiFab-label'][contains(.,'FINALIZAR')]

*** Keywords ***
Acessar a aba Grupos no Submenu Turma
    Verificar se estou na página inicial
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Acessar modulo Gerenciamento da Plataforma Mining Control
    browser.click    ${menu_turma}
    BuiltIn.Sleep  2s

Inserir o nome e descricao nos campos solicitados
    Log    Validando a Aba Grupos de Turma
    Wait For Elements State    ${aba_Grupo_Turma}
    browser.click              ${aba_Grupo_Turma}

    Log    Selecionando um grupo de turno
    Wait For Elements State    ${campo_grupo_turno}    
    browser.click              ${campo_grupo_turno}

    Log    Iserindo um valor no campo Grupo de Turma
    Wait For Elements State    ${nome_grupo_turma}
    browser.click              ${selecionar_grupo_turno}     
    ${primeiro_nome}=          FakerLibrary.Name
    Fill Text                  ${nome_grupo_turma}  ${primeiro_nome}

Acionar o botão Cadastrar
    Log    Aguardando o botão Cadastrar ser clicado
    Wait For Elements State    ${btn_cadastrar_turma}
    browser.click              ${btn_cadastrar_turma} 

Verificar se os dados foram cadastrados
    Log    Validando se os dados foram cadastrados
    Wait For Elements State    ${verificar_cadastro}

Acionar o botao finalizar na aba Grupos de Turma
    Log    Finalizando o cadastro
    Wait For Elements State    ${btn_finalizar_turma}
    browser.click              ${btn_finalizar_turma} 
    builtin.Sleep    2s  