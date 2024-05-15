*** Settings ***

Resource    ../resources/base.resource
Resource    ../operador.resource

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
    browser.click    locator=${menu_turma}
    BuiltIn.Sleep  2s
    Wait Until Page Contains  Grupos de Turma

Inserir o nome e descricao nos campos solicitados
    Wait Until Element Is Visible    locator=${aba_Grupo_Turma}
    browser.click                    locator=${aba_Grupo_Turma}
    Wait Until Element Is Visible    locator=${campo_grupo_turno}    
    browser.click                    locator=${campo_grupo_turno} 
    browser.click                    locator=${selecionar_grupo_turno}
    Wait Until Element Is Visible    locator=${nome_grupo_turma} 
    ${primeiro_nome}=                FakerLibrary.Name
    Input Text                       locator=${nome_grupo_turma}  text=${primeiro_nome}

Acionar o botão Cadastrar    
    Wait Until Element Is Visible    locator=${btn_cadastrar_turma}
    Click Button                     locator=${btn_cadastrar_turma} 

Verificar se os dados foram cadastrados
    Wait Until Element Is Visible    locator=${verificar_cadastro}

Acionar o botao finalizar na aba Grupos de Turma    
    Wait Until Element Is Visible  locator=${btn_finalizar_turma}
    browser.click                  locator=${btn_finalizar_turma} 
    builtin.Sleep    2s  