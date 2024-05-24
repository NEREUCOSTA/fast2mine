*** Settings ***

Resource    ../resources/base.resource
Resource    ../../../data/DadosLogin.resource
Resource    ../../login/LoginPage.resource

Library    FakerLibrary  locale=pt_BR


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
Acessar modulo Gerenciamento do Turma na aba Grupos de turma
    Acessar modulo Gerenciamento da Plataforma Mining Control
    browser.click    ${menu_turma}
    BuiltIn.Sleep  2s

Inserir o nome e descricao nos campos solicitados
    Wait For Elements State    ${aba_Grupo_Turma}
    browser.click              ${aba_Grupo_Turma}
    Wait For Elements State    ${campo_grupo_turno}    
    browser.click              ${campo_grupo_turno} 
    browser.click              ${selecionar_grupo_turno}
    Wait For Elements State    ${nome_grupo_turma} 
    ${primeiro_nome}=          FakerLibrary.Name
    Fill Text                  ${nome_grupo_turma}  txt=${primeiro_nome}

Acionar o botão Cadastrar    
    Wait For Elements State    ${btn_cadastrar_turma}
    browser.click              ${btn_cadastrar_turma} 

Verificar se os dados foram cadastrados
    Wait For Elements State    ${verificar_cadastro}

Acionar o botao finalizar na aba Grupos de Turma    
    Wait For Elements State    ${btn_finalizar_turma}
    browser.click              ${btn_finalizar_turma} 
    builtin.Sleep    2s  