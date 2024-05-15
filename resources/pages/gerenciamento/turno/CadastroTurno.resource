*** Settings ***

Resource    ../resources/base.resource
Resource    ../operador.resource

Library    FakerLibrary  locale=pt_BR

*** Variables ***
${Menu_turno}                       //a[contains(.,'Turno')]
${cadastro_turno}                   //span[contains(.,'Cadastro de Turno')]
${selecione_grupo}                  //p[contains(.,'Selecione...')]
${selecionar_um_grupo}              (//*[contains(@id, 'react-select-2-option')])[10]
${campo_nome_grupo}                 //input[@name='name']
${btn_cadastrar_turno}              //span[contains(.,'Cadastrar')]
${verificar_cadastro}               (//input[contains(@type,'text')])[3]
${btn_finalizar_turno}              //button[contains(.,'FINALIZAR')]
${editar_campo_nome}                (//input[@type='text'])[3]

*** Keywords ***
Acessar o modulo Turno
    browser.click    locator=${Menu_turno}
    builtin.Sleep    2
Acessar a aba Cadastro de Turno
    browser.click    locator=${cadastro_turno}
    BuiltIn.Sleep    2s
    Wait Until Page Contains  Cadastro de Turno

Inserir um Grupo de turno e nome    
    browser.click                    locator=${selecione_grupo}
    Wait Until Element Is Visible    locator=${selecionar_um_grupo} 
    browser.click                    locator=${selecionar_um_grupo} 
    browser.click                    locator=${campo_nome_grupo}
    ${descricao_nome}=               FakerLibrary.Name Male
    Input Text       locator=${campo_nome_grupo}  text=${descricao_nome}

Acionar o botao cadastrar    
    Wait Until Element Is Visible   locator=${btn_cadastrar_turno}
    browser.click                   locator=${btn_cadastrar_turno}   

Verificar se as informações foram cadastradas
    Wait Until Element Is Visible    locator=${verificar_cadastro}
Acionar o botao finalizar na aba cadastro de turno
    Wait Until Element Is Visible   locator=${btn_finalizar_turno}
    browser.click                   locator=${btn_finalizar_turno}

Esperar a confirmação da inclusão do cadastro
    builtin.Sleep    3s   


 Editar itens na listagem
    browser.click  locator=${editar_campo_nome}
    Input Text     locator=${editar_campo_nome}  text=a