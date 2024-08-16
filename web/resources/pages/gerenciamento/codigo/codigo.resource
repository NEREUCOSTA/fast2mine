*** Settings ***
Documentation    Arquivo responsável por armazenar as infomações da funcionalidade Código dentro do módulo Gerenciamento

Resource    ../../../base.resource

*** Variables ***
${submenu_codigo}                 (//span[contains(.,'Código')])[4]
${aba_codigo}                     (//span[contains(.,'Código')])[6]
${selecionar_campo}               //input[contains(@name,'name')]
${selecionar_nome}                //*[@id="root"]/div[1]/div[2]/div[2]/div[2]/div[1]/form/div[1]/div/input
${btn_inserir_novos_registros}    //span[contains(.,'Inserir Novos Registros')]
${btn_importar_planilha}          //button[contains(.,'Importar Planilha')]
${btn_editar_registros}           //span[contains(.,'Editar Registros')]
${planilha_template_codes}        C:\\Fast2mine - miningcontrol\\fast2_mine_main\\fast2mine\\web\\resources\\data\\template_codes.xlsx


*** Keywords ***
Acessar a aba código no Submenu código
    Verificar se estou na página inicial
    Inserir email e senha cadastrados
    Acionar o botão enter para autenticar no sistema
    Login realizado
    Acessar modulo Gerenciamento da Plataforma Mining Control
    Log    Acessando o Submenu Código
    browser.Click    ${submenu_codigo}
Download da Planilha para inserir novos registros
    Log    Download da Planilha para Inserir novos registros
    ${dl_promise}    Promise To Wait For Download    ${planilha_template_codes}
    browser.Click    ${btn_inserir_novos_registros}
Arquivo salvo na pasta do projeto
    Log    Download do arquivo concluído!
Importar Planilha com os novos registros
    browser.click      ${btn_importar_planilha} 
    builtin.Sleep    2
    pyautogui.Write    ${planilha_template_codes}
    Press    enter
    builtin.Sleep    2
Remove o arquivo do diretório data
    Log    Verifica se o arquivo foi removido do diretório data
    File Should Exist    ${planilha_template_codes}
Editar registros
    Log    Download da Planilha 
    ${dl_promise}    Promise To Wait For Download    ${planilha_template_codes}
    browser.Click    ${btn_editar_registros}
    
    
