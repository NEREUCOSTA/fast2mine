*** Settings ***
Documentation        Arquivo destinado a armazenar os elementos e variaveis da área do operador.
Resource   ../../base.resource
Resource  ../../pages/gerenciamento/operador.resource


Library    OperatingSystem
Library    SeleniumLibrary
Library    pyautogui
Library           FakerLibrary  locale=pt_BR
*** Variables ***

${Menu_turno}                   //a[contains(.,'Turno')]
${Grupo_de_Turno}               //span[@class='MuiTab-wrapper'][contains(.,'Grupo de Turno')]
${campo_Grupo_de_turno}         //input[contains(@name,'name')]
${descricao}                    //input[contains(@name,'description')]
${botao_cadastrar}              //span[contains(.,'Cadastrar')]
${NOMEFAKE}                     FakerLibrary.name
${Verificar_cadastro}           (//input[contains(@type,'text')])[3]
${botao_finalizar}               //span[contains(.,'FINALIZAR')]


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
    Input Text     locator=${campo_Grupo_de_turno}  text=${NOMEFAKE}
    Click Element  locator=${descricao}
    Input Text     locator=${descricao}  text=${NOMEFAKE}

Acionar o botão Cadastrar    
    Wait Until Element Is Visible  locator=${botao_cadastrar}
    Click Button  locator=${botao_cadastrar}

Verificar se os dados foram cadastrados
    Wait Until Element Is Visible  locator=${Verificar_cadastro}

 Acionar o botao finalizar   
    Wait Until Element Is Visible  locator=${botao_finalizar}
    Click Button  locator=${botao_finalizar} 









