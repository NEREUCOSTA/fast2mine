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
    browser.click    selector=${Menu_turno}
    BuiltIn.Sleep  2s
    Wait Until Page Contains  Grupo de Turno

Inserir o nome e descricao nos campos solicitados
    Wait Until Element Is Visible  selector=${campo_Grupo_de_turno}
    browser.click                  selector=${campo_Grupo_de_turno}
    #${primeiro_nome}=     FakerLibrary.Name
    Input Text     selector=${campo_Grupo_de_turno}  text=Grupo Perfuração matutino
    browser.click  selector=${descricao}
    #${segundo_nome}=  FakerLibrary.Name
    Input Text     selector=${descricao}  text=Equipe responsável pelas atividades durante o perído da manhã

Acionar o botão Cadastrar    
    Wait Until Element Is Visible  selector=${btn_cadastrar}
    Click Button                   selector=${btn_cadastrar}

Verificar se os dados foram cadastrados
    Wait Until Element Is Visible  selector=${verificar_cadastro}

 Acionar o botao finalizar na aba Grupo de turno   
    Wait Until Element Is Visible  selector=${btn_finalizar}
    Click Button                   selector=${btn_finalizar} 
    builtin.Sleep    2s