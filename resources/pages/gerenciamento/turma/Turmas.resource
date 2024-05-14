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
    browser.click    selector=${aba_turma} 
    BuiltIn.Sleep  2s
    
Inserir o nome e descricao nos campos solicitados Turmas
    # Wait Until Element Is Visible  selector=${campo_Grupo_turma} 
    # browser.click                  selector=$${campo_Grupo_turma} 
    browser.click                  selector=${selecioanr_grupo_turma} 
    Wait Until Element Is Visible  selector=${nome_turma}    
    browser.click                  selector=${nome_turma}
    ${primeiro_nome}=              FakerLibrary.Name
    Fill Text                     selector=${nome_turma}  text=${primeiro_nome}
Acionar o botão Cadastrar turmas   
    Wait Until Element Is Visible    selector=${btn_turma}  
    Click Button                     selector=${btn_turma} 

Verificar se os dados foram cadastrados turmas
    Wait Until Element Is Visible    selector=${verificar_turma} 

Acionar o botao finalizar na aba Turmas   
    Wait Until Element Is Visible  selector=${btn_finalizar_aba_turma}
    browser.click                  selector=${btn_finalizar_aba_turma}
    builtin.Sleep    2s 