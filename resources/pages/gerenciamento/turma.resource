*** Settings ***
Documentation        Arquivo destinado a armazenar os elementos e variaveis da área do operador.
Resource   ../../base.resource
Resource  ../../pages/gerenciamento/operador.resource

Library    FakerLibrary  locale=pt_BR
Library    OperatingSystem
Library    SeleniumLibrary
Library    pyautogui

*** Variables ***
${menu_turma}               //span[@class='MuiFab-label'][contains(.,'Turma')]
${aba_Grupo_Turma}          //span[contains(.,'Grupos de Turma')]
${campo_grupo_turno}        //p[contains(.,'Selecione...')]
${selecionar_grupo_turno}   (//div[contains(@tabindex,'-1')])[2]
${nome_grupo_turma}         //input[@name='name']
${btn_cadastrar_turma}      //button[@type='submit']
${verificar_cadastro}       //th[contains(.,'STATUS')]
${btn_finalizar_turma}      //span[@class='MuiFab-label'][contains(.,'FINALIZAR')]
${aba_turma}                //button[contains(@aria-selected,'true')]
${campo_Grupo_turma}        //div[@class='jss230'][contains(.,'Selecione...')]
${selecioanr_grupo_turma}   //*[@id="react-select-44-option-1"]
${nome_turma}               //input[@name='name']
${btn_turma}                //span[@class='MuiFab-label'][contains(.,'Cadastrar')]
${verificar_turma}          //th[@class='MuiTableCell-root MuiTableCell-head jss81'][contains(.,'STATUS')]
${btn_finalizar_aba_turma}  //span[@class='MuiFab-label'][contains(.,'FINALIZAR')]

*** Keywords ***
##################################################################
### Keywords e elementos da aba "GRUPO DE TURMA" do MENU TURMA ####
##################################################################

Acessar modulo Gerenciamento do Turma na aba Grupos de turma
    Acessar modulo Gerenciamento da Plataforma Mining Control
    Click Element    locator=${menu_turma}
    BuiltIn.Sleep  2s
    Wait Until Page Contains  Grupos de Turma

Inserir o nome e descricao nos campos solicitados
    Wait Until Element Is Visible  locator=${aba_Grupo_Turma}
    Click Element                  locator=${aba_Grupo_Turma}
    Wait Until Element Is Visible  locator=${campo_grupo_turno}    
    Click Element                  locator=${campo_grupo_turno} 
    Click Element                  locator=${selecionar_grupo_turno}
    Wait Until Element Is Visible    locator=${nome_grupo_turma} 
    ${primeiro_nome}=     FakerLibrary.Name
    Input Text     locator=${nome_grupo_turma}  text=${primeiro_nome}

Acionar o botão Cadastrar    
    Wait Until Element Is Visible    locator=${btn_cadastrar_turma}
    Click Button    locator=${btn_cadastrar_turma} 

Verificar se os dados foram cadastrados
    Wait Until Element Is Visible    locator=${verificar_cadastro}

Acionar o botao finalizar na aba Grupo de turma    
    Wait Until Element Is Visible  locator=${btn_finalizar_turma}
    Click Element                  locator=${btn_finalizar_turma} 
    builtin.Sleep    2s  


##################################################################
### Keywords e elementos da aba "TURMAS" do MENU TURMA ####
##################################################################
Acessar modulo Gerenciamento do Turma na aba Turmas  
    Acessar modulo Gerenciamento da Plataforma Mining Control
    Click Element    locator=${aba_turma} 
    BuiltIn.Sleep  2s
    #Wait Until Page Contains  TURMAS 

Inserir o nome e descricao nos campos solicitados Turmas
    Wait Until Element Is Visible  locator=${campo_Grupo_turma} 
    Click Element                  locator=$${campo_Grupo_turma} 
    Click Element                  locator=${selecioanr_grupo_turma} 
    Wait Until Element Is Visible  locator=${nome_turma}    
    Click Element                  locator=${nome_turma}
    ${primeiro_nome}=     FakerLibrary.Name
    Input Text                     locator=$${nome_turma}  text=${primeiro_nome}
Acionar o botão Cadastrar turmas   
    Wait Until Element Is Visible    locator=${btn_turma}  
    Click Button    locator=${btn_turma} 

Verificar se os dados foram cadastrados turmas
    Wait Until Element Is Visible    locator=${verificar_turma} 

Acionar o botao finalizar na aba Grupo de turma    
    Wait Until Element Is Visible  locator=${btn_finalizar_aba_turma}
    Click Element                  locator=${btn_finalizar_aba_turma}
    builtin.Sleep    2s      


