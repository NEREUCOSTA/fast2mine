...    *** Settings ***

Resource    ../../../base.resource

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
${planilha_template_elements}    C:\\Fast2mine - miningcontrol\\fast2_mine_main\\fast2mine\\web\\resources\\data\\template_equipmentsgroups.xlsx
${planilha_elementsgroups}       C:\\Fast2mine - miningcontrol\\fast2_mine_main\\fast2mine\\web\\resources\\data\\elementsgroups.xlsx
${btn_editar_registros_elementos}            //span[contains(.,'Editar Registros')]
${menu_sub_elemento}                //span[@class='MuiBadge-root jss143'][contains(.,'Sub-Elemento')]
${campo_elementos}                  //*[@id="root"]/div[1]/div[2]/div[2]/div[2]/div[1]/form/div[2]/div/div/div/div/div/div[1]
${selecionar_nome_sub}              //input[contains(@name,'name')]
${selecao_ativo}                    //div[contains(@id,'react-select-4-option-2')]
${opcao_campo_elementos}            //div[@class='MuiButtonBase-root MuiListItem-root MuiMenuItem-root Mui-selected MuiMenuItem-gutters MuiListItem-gutters MuiListItem-button Mui-selected'][contains(.,'A92')]
${campo_ativos}                     //div[@aria-invalid='false'][contains(.,'Todos')]
${opcao_ativo}                      //div[@class='MuiButtonBase-root MuiListItem-root MuiMenuItem-root MuiMenuItem-gutters MuiListItem-gutters MuiListItem-button'][contains(.,'Ativo')]
${btn_pesquisar_sub}                //span[@class='MuiFab-label'][contains(.,'PESQUISAR')]



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



###  ABA SUB-ELEMENTO  ####

Acessar a aba elemento no Submenu sub-elemento
    Acessar a aba elemento no Submenu elemento
    browser.Click    ${menu_sub_elemento}

Selecionar nome
    browser.Click    ${selecionar_nome_sub}
    Fill Text    ${selecionar_nome_sub}    Fast2

Selecionar Elemento
    browser.Click    ${campo_elementos}
    browser.Click    ${opcao_campo_elementos} 

Selecionar ativos
    browser.Click    ${campo_ativos}
    browser.Click    ${opcao_ativo}  

Clicar no botao pesquisar sub-elemento 
    browser.Click    ${btn_pesquisar_sub}  

Download da Planilha para Inserir novos registros aba sub-elementos      
    Log    Download da Planilha para Inserir novos registros grupo equipamentos
    ${dl_promise}    Promise To Wait For Download    ${planilha_template_elements}
    browser.click    ${btn_inserir_novos_registros_elemento}

Arquivo salvo na pasta do projeto equipamento
    builtin.Sleep    3             
     



    
  