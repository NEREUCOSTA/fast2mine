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
