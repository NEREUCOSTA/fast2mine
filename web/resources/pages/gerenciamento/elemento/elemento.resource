...    *** Settings ***
Resource    ../resources/base.resource
Library    ../../../../venv/Lib/site-packages/SeleniumLibrary/__init__.py

*** Variables ***
${submenu_elemento}                 (//span[contains(.,'Elemento')])[4]
${aba_elemento}                     (//span[contains(.,'Elemento')])[6]
${selecionar_campo}                  //input[contains(@name,'name')]
${selecionar_nome}                   //*[@id="root"]/div[1]/div[2]/div[2]/div[2]/div[1]/form/div[1]/div/input
${selecionar_campo_ativo}            //p[contains(.,'Todos')]
${selecionar_opcao}                 //div[contains(@id,'react-select-2-option-2')]
${btn_pesquiar}                     //span[contains(.,'PESQUISAR')]
${btn_inserir_novos_registros_elemento}     //span[contains(.,'Inserir Novos Registros')]
${btn_importar_planilha}           //button[contains(.,'Importar Planilha')]
${planilha_template_elements}    C:\\Fast2mine - miningcontrol\\fast2_mine_main\\fast2mine\\resources\\data\\template_elements.xlsx
${planilha_elementsgroups}       C:\\Fast2mine - miningcontrol\\fast2_mine_main\\fast2mine\\resources\\data\\equipmentsgroups.xlsx
${btn_editar_registros_elementos}            //span[contains(.,'Editar Registros')]


*** Keywords ***


Acessar a aba elemento no Submenu elemento 
    Verificar se estou na página inicial
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Acessar modulo Gerenciamento da Plataforma Mining Control
    Log    Acessando o Submenu Elemento  
    browser.click    ${submenu_elemento}

Selecionar nome e ativo
    browser.click  ${selecionar_campo}
    Fill Text   ${selecionar_campo}    Fast2
    browser.click  ${selecionar_campo_ativo}
    browser.Click    ${selecionar_opcao}   

Clicar no botão pesquisar
    browser.Click    ${btn_pesquiar}     
         

Download da Planilha para Inserir novos registros aba Grupo Equipamentos
    Log    Download da Planilha para Inserir novos registros grupo equipamentos
    ${dl_promise}    Promise To Wait For Download    ${planilha_template_elements}
    browser.click    ${btn_inserir_novos_registros_elemento}

Arquivo salvo na pasta do projeto Grupo Equipamento
    builtin.sleep  3s  

### IMPORTAR A PLANILHA ###

Acessar a aba Grupo de elemento no Submenu elemento
    Acessar a aba elemento no Submenu elemento
    Selecionar nome e ativo
    Clicar no botão pesquisar

Importar Planilha com os novos registros aba grupo elemento
   browser.click      ${btn_importar_planilha}
   builtin.Sleep    2
   pyautogui.Write    ${planilha_elementsgroups}
   Press    enter
   builtin.Sleep    2

Remove o arquivo do diretório data  
    Log    Verificando se o arquivo está na pasta
    File Should Exist      ${planilha_template_elements} 

    Log    Excluindo o arquivo da pasta
    Remove File            ${planilha_template_elements} 
    File Should Not Exist  ${planilha_template_elements}

## EDITAR ELEMENTO ##

 Editar Registros aba equipamento
    Acessar a aba elemento no Submenu elemento
    Selecionar nome e ativo 
    Clicar no botão pesquisar
    browser.Click    ${btn_editar_registros_elementos}  
     



    
  