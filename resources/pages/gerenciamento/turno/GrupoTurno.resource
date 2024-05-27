*** Settings ***

Resource    ../resources/base.resource


*** Variables ***
${Menu_turno}                       //a[contains(.,'Turno')]
${Grupo_de_Turno}                   //span[@class='MuiTab-wrapper'][contains(.,'Grupo de Turno')]
${campo_Grupo_de_turno}             //input[contains(@name,'name')]
${descricao}                        //input[contains(@name,'description')]
${btn_cadastrar}                    //span[contains(.,'Cadastrar')]
${verificar_cadastro}               (//input[contains(@type,'text')])[3]
${btn_finalizar}                    //button[contains(.,'FINALIZAR')]

*** Keywords ***
Acessar aba Grupo de Turno no Submenu Turno
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Acessar modulo Gerenciamento da Plataforma Mining Control
    Log To Console    acessando o Submenu Turno
    browser.click    ${Menu_turno}
    BuiltIn.Sleep  2s
Inserir o nome e descricao nos campos solicitados
    Wait For Elements State    ${campo_Grupo_de_turno}
    browser.click              ${campo_Grupo_de_turno}

    Log    Criando o nome do grupo de turno com a bilbioteca fakerlibrary
    ${primeiro_nome}=     FakerLibrary.Name
    Log   ${primeiro_nome}
    
    Fill Text     ${campo_Grupo_de_turno}  ${primeiro_nome}
    browser.click  ${descricao}
    ${segundo_nome}=  FakerLibrary.Name
    Log    ${segundo_nome}
    Fill Text     ${descricao}    ${segundo_nome}

Acionar o botão Cadastrar    
    Wait For Elements State    ${btn_cadastrar}
    browser.click              ${btn_cadastrar}

Verificar se os dados foram cadastrados
    Wait For Elements State  ${verificar_cadastro}

 Acionar o botao finalizar na aba Grupo de turno   
    Wait For Elements State    ${btn_finalizar}
    browser.click              ${btn_finalizar} 
    builtin.Sleep    2s