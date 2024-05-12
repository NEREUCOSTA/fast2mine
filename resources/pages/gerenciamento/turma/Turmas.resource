*** Settings ***

Resource    ../resources/base.resource
Resource    ../operador.resource

Library    FakerLibrary  locale=pt_BR


*** Variables ***
${aba_turma}                //button[contains(@aria-selected,'true')]
${campo_Grupo_turma}        //div[@class='jss230'][contains(.,'Selecione...')]
${selecioanr_grupo_turma}   //*[@id="react-select-44-option-1"]
${nome_turma}               //input[@name='name']
${btn_turma}                //span[@class='MuiFab-label'][contains(.,'Cadastrar')]
${verificar_turma}          //th[@class='MuiTableCell-root MuiTableCell-head jss81'][contains(.,'STATUS')]
${btn_finalizar_aba_turma}  //span[@class='MuiFab-label'][contains(.,'FINALIZAR')]

*** Keywords ***
Acessar modulo Gerenciamento do Turma na aba Turmas  
    Acessar modulo Gerenciamento da Plataforma Mining Control
    Click Element    locator=${aba_turma} 
    BuiltIn.Sleep  2s
    
Inserir o nome e descricao nos campos solicitados Turmas
    # Wait Until Element Is Visible  locator=${campo_Grupo_turma} 
    # Click Element                  locator=$${campo_Grupo_turma} 
    Click Element                  locator=${selecioanr_grupo_turma} 
    Wait Until Element Is Visible  locator=${nome_turma}    
    Click Element                  locator=${nome_turma}
    ${primeiro_nome}=              FakerLibrary.Name
    Input Text                     locator=${nome_turma}  text=${primeiro_nome}
Acionar o botão Cadastrar turmas   
    Wait Until Element Is Visible    locator=${btn_turma}  
    Click Button                     locator=${btn_turma} 

Verificar se os dados foram cadastrados turmas
    Wait Until Element Is Visible    locator=${verificar_turma} 

Acionar o botao finalizar na aba Turmas   
    Wait Until Element Is Visible  locator=${btn_finalizar_aba_turma}
    Click Element                  locator=${btn_finalizar_aba_turma}
    builtin.Sleep    2s  