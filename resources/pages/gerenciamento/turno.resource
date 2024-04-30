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
${btn_cadastrar}                //button[@type='submit']
${verificar_cadastro}           (//input[contains(@type,'text')])[3]
${btn_finalizar}                //button[contains(.,'FINALIZAR')]
${Cadastro_Grupo}               //span[contains(.,'Cadastro de Turno')]
${selecione_grupo}              //p[contains(.,'Selecione...')]
${selecionar_um_grupo}          //*[@id="react-select-2-option-1"]
${campo_nome_grupo}             //input[@name='name']
${btn_cadastrar_turno}          //span[contains(.,'Cadastrar')]
${btn_finalizar_turno}          //span[contains(.,'FINALIZAR')]
${editar_campo_nome}            (//input[@type='text'])[3]


*** Keywords ***
##################################################################
### Keywords e elementos da aba "GRUPO DE TURNO" do MENU TURNO ###
##################################################################

 Acessar modulo Gerenciamento do Turno na aba Grupo de turno
    Acessar modulo Gerenciamento do Operador na aba Grupo
    Click Element    locator=${Menu_turno}
    BuiltIn.Sleep  2s
    Wait Until Page Contains  Grupo de Turno

Inserir o nome e descricao nos campos solicitados
    Wait Until Element Is Visible  locator=${campo_Grupo_de_turno}
    Click Element                  locator=${campo_Grupo_de_turno}
    ${primeiro_nome}=     FakerLibrary.Name
    Input Text     locator=${campo_Grupo_de_turno}  text=${primeiro_nome}
    Click Element  locator=${descricao}
    ${segundo_nome}=  FakerLibrary.Name
    Input Text     locator=${descricao}  text=${segundo_nome}

Acionar o botão Cadastrar    
    Wait Until Element Is Visible  locator=${btn_cadastrar}
    Click Button  locator=${btn_cadastrar}

Verificar se os dados foram cadastrados
    Wait Until Element Is Visible  locator=${verificar_cadastro}

 Acionar o botao finalizar na aba Grupo de turno   
    Wait Until Element Is Visible  locator=${btn_finalizar}
    Click Button                   locator=${btn_finalizar} 
    builtin.Sleep    2s

#####################################################################
### Keywords e elementos da aba "CADASTRO DE TURNO" do MENU TURNO ###
#####################################################################   

Acessar modulo Gerenciamento do Turno na aba Cadastro de Turno
    Acessar modulo Gerenciamento do Operador na aba Grupo
    Click Element    locator=${Menu_turno}
    builtin.Sleep    2s
    Click Element    locator=${Cadastro_Grupo}
    BuiltIn.Sleep    2s
    Wait Until Page Contains  Grupo de Turno

Inserir um Grupo de turno e nome    
    Click Element                    locator=${selecione_grupo}
    Wait Until Element Is Visible    locator=${selecionar_um_grupo} 
    Click Element                    locator=${selecionar_um_grupo} 
    Click Element                    locator=${campo_nome_grupo}
    ${descricao_nome}=  FakerLibrary.Name
    Input Text                       locator=${campo_nome_grupo}  text=${descricao_nome}

Acionar o botao cadastrar    
    Wait Until Element Is Visible   locator=${btn_cadastrar_turno}
    Click Element                   locator=${btn_cadastrar_turno}   

Verificar se as informações foram cadastradas
    Wait Until Element Is Visible    locator=${verificar_cadastro}
Acionar o botao finalizar na aba cadastro de turno
    Wait Until Element Is Visible   locator=${btn_finalizar_turno}
    Click Element                   locator=${btn_finalizar_turno}
    builtin.Sleep    2s   

Editar itens na listagem
    Click Element  locator=${editar_campo_nome}
    Input Text     locator=${editar_campo_nome}  text=a
    







