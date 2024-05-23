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
    browser.click    ${Menu_turno}
    BuiltIn.Sleep  2s
    Wait Until Page Contains  Grupo de Turno

Inserir o nome e descricao nos campos solicitados
    Wait For Elements State  ${campo_Grupo_de_turno}
    browser.click                  ${campo_Grupo_de_turno}
    #${primeiro_nome}=     FakerLibrary.Name
    Fill Text     ${campo_Grupo_de_turno}  text=Grupo Perfuração matutino
    browser.click  ${descricao}
    #${segundo_nome}=  FakerLibrary.Name
    Fill Text     ${descricao}  text=Equipe responsável pelas atividades durante o perído da manhã

Acionar o botão Cadastrar    
    Wait For Elements State  ${btn_cadastrar}
    browser.click                   ${btn_cadastrar}

Verificar se os dados foram cadastrados
    Wait For Elements State  ${verificar_cadastro}

 Acionar o botao finalizar na aba Grupo de turno   
    Wait For Elements State  ${btn_finalizar}
    browser.click                   ${btn_finalizar} 
    builtin.Sleep    2s