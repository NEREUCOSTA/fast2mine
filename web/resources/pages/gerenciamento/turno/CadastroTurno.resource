*** Settings ***

Resource    ../../../base.resource


*** Variables ***
${Menu_turno}                       //a[contains(.,'Turno')]
${cadastro_turno}                   //span[contains(.,'Cadastro de Turno')]
${select_grupo}                     //p[contains(.,'Selecione...')]
${input_grupo}                      (//*[contains(@id, 'react-select-2-option')])[2]
${select_nome_grupo}                //input[@name='name']
${btn_cadastrar_turno}              //span[contains(.,'Cadastrar')]
${verificar_cadastro}               (//input[contains(@type,'text')])[3]
${btn_finalizar_turno}              //button[contains(.,'FINALIZAR')]
${editar_campo_nome}                (//input[@type='text'])[3]

*** Keywords ***
Acessar modulo Gerenciamento do Turno na aba Cadastro de Turno
    Acessar modulo Gerenciamento da Plataforma Mining Control
    browser.click    ${Menu_turno}
    builtin.Sleep    2
Acessar a aba Cadastro de Turno no Submenu Turno
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Acessar modulo Gerenciamento da Plataforma Mining Control
    Log To Console    acessando o Submenu Turno
    browser.click    ${Menu_turno}
    BuiltIn.Sleep  2s
    browser.click    ${cadastro_turno}
    BuiltIn.Sleep    2s

Inserir um Grupo de turno e nome    
    browser.click                    ${select_grupo}
    Wait For Elements State          ${input_grupo} 
    browser.click                    ${input_grupo}
    browser.click                    ${select_nome_grupo}
    ${descricao_nome}=               FakerLibrary.Name
    Fill Text       ${select_nome_grupo}  ${descricao_nome}

Acionar o botao cadastrar    
    Wait For Elements State   ${btn_cadastrar_turno}
    browser.click             ${btn_cadastrar_turno}   

Verificar se as informações foram cadastradas
    Wait For Elements State    ${verificar_cadastro}
Acionar o botao finalizar na aba cadastro de turno
    Wait For Elements State   ${btn_finalizar_turno}
    browser.click             ${btn_finalizar_turno}

Esperar a confirmação da inclusão do cadastro
    builtin.Sleep    3s   
 Editar itens na listagem
    browser.click  ${editar_campo_nome}
    Fill Text      ${editar_campo_nome}  Teste