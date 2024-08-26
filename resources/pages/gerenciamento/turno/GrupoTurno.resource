*** Settings ***

Resource    ../resources/base.resource
Resource    ../operador.resource


*** Variables ***
${Menu_turno}                       //a[contains(.,'Turno')]
${Grupo_de_Turno}                   //span[@class='MuiTab-wrapper'][contains(.,'Grupo de Turno')]
${campo_Grupo_de_turno}             //input[contains(@name,'name')]
${descricao}                        //input[contains(@name,'description')]
${btn_cadastrar}                    //button[@type='submit']
${verificar_cadastro}               (//input[contains(@type,'text')])[3]
${btn_finalizar}                    //button[contains(.,'FINALIZAR')]

*** Keywords ***
Acessar modulo Gerenciamento do Turno na aba Grupo de turno
    Acessar modulo Gerenciamento da Plataforma Mining Control
    Click Element    locator=${Menu_turno}
    BuiltIn.Sleep  2s
    Wait Until Page Contains  Grupo de Turno

Inserir o nome e descricao nos campos solicitados
    Wait Until Element Is Visible  locator=${campo_Grupo_de_turno}
    Click Element                  locator=${campo_Grupo_de_turno}
    #${primeiro_nome}=     FakerLibrary.Name
    Input Text     locator=${campo_Grupo_de_turno}  text=Grupo Perfuração matutino
    Click Element  locator=${descricao}
    #${segundo_nome}=  FakerLibrary.Name
    Input Text     locator=${descricao}  text=Equipe responsável pelas atividades durante o perído da manhã

Acionar o botão Cadastrar    
    Wait Until Element Is Visible  locator=${btn_cadastrar}
    Click Button                   locator=${btn_cadastrar}

Verificar se os dados foram cadastrados
    Wait Until Element Is Visible  locator=${verificar_cadastro}

 Acionar o botao finalizar na aba Grupo de turno   
    Wait Until Element Is Visible  locator=${btn_finalizar}
    Click Button                   locator=${btn_finalizar} 
    builtin.Sleep    2s