*** Settings ***
Documentation        Arquivo destinado a armazenar os elementos e variaveis da área do operador.
Resource   ../../base.resource
Resource  ../../pages/gerenciamento/operador.resource

Library    FakerLibrary  locale=pt_BR
Library    OperatingSystem
Library    SeleniumLibrary
Library    pyautogui

*** Variables ***

${Menu_turno}                   //a[contains(.,'Turno')]
${Grupo_de_Turno}               //span[@class='MuiTab-wrapper'][contains(.,'Grupo de Turno')]
${campo_Grupo_de_turno}         //input[contains(@name,'name')]
${descricao}                    //input[contains(@name,'description')]
${botao_cadastrar}             //button[@type='submit']
${Verificar_cadastro}           (//input[contains(@type,'text')])[3]
${botao_finalizar}               //button[contains(.,'FINALIZAR')]
${Cadastro_Grupo}                //span[contains(.,'Cadastro de Turno')]
${selecione_grupo}               //p[contains(.,'Selecione...')]
${selecionar_um_grupo}           //*[@id="react-select-215-option-1"]/span
${nome_grupo}                    //input[@name='name']
${botao_cadastrar_turno}         //span[contains(.,'Cadastrar')]
${botao_finalizar_turno}         //span[contains(.,'FINALIZAR')]


*** Keywords ***
#######################################################
### Keywords e elementos da aba "GRUPO DE TURNO" do MENU TURNO ###
#######################################################

 Acessar modulo Gerenciamento do Turno na aba Grupo de turno
    Acessar modulo Gerenciamento do Operador na aba Grupo
    Click Element    locator=${Menu_turno}
    BuiltIn.Sleep  2s
    Wait Until Page Contains  Grupo de Turno

Inserir o nome e descricao nos campos solicitados
    Wait Until Element Is Visible  locator=${campo_Grupo_de_turno}
    Click Element  locator=${campo_Grupo_de_turno}
    ${primeiro_nome}=     FakerLibrary.Name
    Input Text     locator=${campo_Grupo_de_turno}  text=${primeiro_nome}
    Click Element  locator=${descricao}
    ${segundo_nome}=  FakerLibrary.Name
    Input Text     locator=${descricao}  text=${segundo_nome}

Acionar o botão Cadastrar    
    Wait Until Element Is Visible  locator=${botao_cadastrar}
    Click Button  locator=${botao_cadastrar}

Verificar se os dados foram cadastrados
    Wait Until Element Is Visible  locator=${Verificar_cadastro}

 Acionar o botao finalizar   
    Wait Until Element Is Visible  locator=${botao_finalizar}
    Click Button  locator=${botao_finalizar} 

#######################################################
### Keywords e elementos da aba "CADASTRO DE TURNO" do MENU TURNO ###
#######################################################   

Acessar modulo Gerenciamento do Turno na aba Cadastro de Turno  
    Click Element    locator=${Cadastro_Grupo}
    BuiltIn.Sleep  2s
    Wait Until Page Contains  Grupo de Turno

Inserir um Grupo de turno e nome    
    Click Element  locator=${selecione_grupo}
    Select Checkbox  locator=${selecionar_um_grupo} 
    Click Element  locator=${nome_grupo}
    ${descricao_nome}=  FakerLibrary.Name
    Input Text     locator=${nome_grupo}  text=${descricao_nome}

Acionar o botao cadastrar    
    Wait Until Element Is Visible  locator=${botao_cadastrar_turno}
    Click Button  locator=${botao_cadastrar_turno}   

Acionar o botao finalizar
    Wait Until Element Is Visible  locator=${botao_finalizar_turno}
    Click Button  locator=${botao_finalizar_turno}   









