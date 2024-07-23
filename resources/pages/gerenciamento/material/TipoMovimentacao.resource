*** Settings ***
Documentation    Arquivo responsável por armazenar as informações da aba Material
Resource    ../resources/base.resource
Resource    ../../../data/DadosLogin.resource
Resource    ../../login/LoginPage.resource

*** Variables ***
${submenu_material}               (//span[contains(.,'Material')])[3]
${aba_tipo_movimentacao}          //span[contains(.,'Tipo de Movimentação')]
${campo_nome}                     //input[contains(@name,'name')]
${campo_descricao}                //input[contains(@name,'description')]
${campo_fluxo}                   (//div[contains(.,'Selecione...')])[13]
${selecionar_fluxo}              //html/body/div[1]/div[1]/div[2]/div[2]/div[2]/form/div/div[3]/div/div/div[2]/div/div[2]
${btn_cadastrar}                 //span[contains(.,'Cadastrar')]
${btn_finalizar}                 //span[contains(.,'FINALIZAR')]

*** Keywords ***
Acessar a aba Tipo de Movimentacao no Submenu Material
    Verificar se estou na página inicial
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Acessar modulo Gerenciamento da Plataforma Mining Control
    Log    Acessando o Submenu Material
    browser.click    ${submenu_material}

    Log    Acessando a aba Tipo de Movimentação
    browser.click    ${aba_tipo_movimentacao}  
    builtin.Sleep    2s 

Inserir os dados de movimentacao
    Log    inserindo dados
    Wait For Elements State    ${campo_nome}    
    browser.click              ${campo_nome}
    Fill Text                  ${campo_nome}  txt=MineraçãoMinas
    Wait For Elements State    ${campo_descricao}     
    browser.click              ${campo_descricao}
    Fill Text                  ${campo_descricao}    txt=Fast2Mine
    Wait For Elements State    ${campo_fluxo}      
    browser.click              ${campo_fluxo}
        
    Log    Validando o campo selecione o fluxo
    browser.click                ${selecionar_fluxo}  

Clicar no botao Cadastrar movimentacao
    browser.click      ${btn_cadastrar}
    builtin.Sleep    2

clicar no botão finalizar tipo de movimentacao   
    browser.click      ${btn_finalizar} 
    builtin.Sleep    2 
    
        
