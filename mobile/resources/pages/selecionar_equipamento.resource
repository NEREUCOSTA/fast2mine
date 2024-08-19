
*** Settings ***

Resource   ../base.resource
Resource   ../pages/paginaInicialApp.resource

*** Variables ***
${campo_equipamento}        com.softdesign.minecontrol:id/btnSelecionarEquipamento
${selecionar_equipamento}   new UiSelector().text("CAMINHÃO")
${selecionar_grupo_equipamento}          new UiSelector().text("CM FMX ")
${selecionar_tipo}           new UiSelector().text("CM FMX - 103")
${digitar_codigo}                com.softdesign.minecontrol:id/txtCodEquipamento
${btn_avancar}       com.softdesign.minecontrol:id/btnAvancarLoginEquipamento
${check_list}        com.softdesign.minecontrol:id/txtChecklistTitulo


*** Keywords ***
Dado que o usuário esteja logado no App
    Sleep    3

Quando o usuário selecionar um equipamento
    Click Element    ${campo_equipamento} 
    Click Element    ${selecionar_equipamento} 
    Click Element    ${selecionar_grupo_equipamento}
    Click Element    ${selecionar_tipo}

E digitar o código
    Click Element    ${digitar_codigo}
    Input Password    ${digitar_codigo}    301  

E clicar no botao Avancar
    Click Element    ${btn_avancar}  

Então o sistema exibirá a tela do Check list
    Wait Until Element Is Visible   ${check_list} 
             

    
