*** Settings ***

Resource    ../resources/base.resource

*** Variables ***
${menu_turma}               //span[@class='MuiFab-label'][contains(.,'Turma')]
${aba_turma}                (//span[contains(.,'Turmas')])[1]
${campo_grupo_turma}        //input[@id='react-select-3-input']
${selecioanr_grupo_turma}   //*[@id="react-select-3-option-1"]
${nome_turma}               //input[@name='name']
${btn_turma}                //span[@class='MuiFab-label'][contains(.,'Cadastrar')]
${verificar_turma}          (//input[contains(@type,'text')])[3]
${btn_finalizar_aba_turma}  //span[@class='MuiFab-label'][contains(.,'FINALIZAR')]

*** Keywords ***
Acessar a aba Turmas no Submenu Turma  
    Verificar se estou na página inicial
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Acessar modulo Gerenciamento da Plataforma Mining Control
    Log    Acessando o Submenu
    browser.Click    ${menu_turma}

    Log    Acessando a aba Turma
    browser.click    ${aba_turma} 
    BuiltIn.Sleep  2s    
Inserir o nome e descricao nos campos solicitados Turmas
    Log    Validando o campo Grupo de Turma
    Wait For Elements State      ${campo_grupo_turma} 
    browser.click                ${campo_grupo_turma} 
    
    Log    Selecionando um grupo de turma
    Wait For Elements State    ${selecioanr_grupo_turma}
    browser.click              ${selecioanr_grupo_turma} 

    Log    Inserindo um valor no campo Turma   
    browser.click              ${nome_turma}
    ${primeiro_nome}=          FakerLibrary.Name
    Fill Text                  ${nome_turma}  ${primeiro_nome}
Acionar o botão Cadastrar turmas
    Log    Aguardando o botão Cadastrar ser clicado
    Wait For Elements State    ${btn_turma}
    browser.click              ${btn_turma} 

Verificar se os dados foram cadastrados turmas
    Log    Validando se os dados foram cadastrados
    Wait For Elements State    ${verificar_turma} 

Acionar o botao finalizar na aba Turmas   
    Log    Finalizando o cadastro
    Wait For Elements State        ${btn_finalizar_aba_turma}
    browser.click                  ${btn_finalizar_aba_turma}
    builtin.Sleep    2s  