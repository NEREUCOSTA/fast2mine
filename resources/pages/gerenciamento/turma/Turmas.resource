*** Settings ***

Resource    ../resources/base.resource

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
Acessar modulo Gerenciamento de Turma na aba Turmas  
    Verificar se estou na página inicial
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Acessar modulo Gerenciamento da Plataforma Mining Control
    browser.click    ${aba_turma} 
    BuiltIn.Sleep  2s
    
Inserir o nome e descricao nos campos solicitados Turmas
    # Wait For Elements State  ${campo_Grupo_turma} 
    # browser.click                  $${campo_Grupo_turma} 
    browser.click                  ${selecioanr_grupo_turma}    
    browser.click                  ${nome_turma}
    ${primeiro_nome}=              FakerLibrary.Name
    Fill Text                      ${nome_turma}  txt=${primeiro_nome}
Acionar o botão Cadastrar turmas     
    browser.click                     ${btn_turma} 

Verificar se os dados foram cadastrados turmas
    Wait For Elements State    ${verificar_turma} 

Acionar o botao finalizar na aba Turmas   
    Wait For Elements State        ${btn_finalizar_aba_turma}
    browser.click                  ${btn_finalizar_aba_turma}
    builtin.Sleep    2s  