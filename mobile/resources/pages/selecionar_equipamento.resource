
*** Settings ***

Resource   ../base.resource
Resource   ../pages/paginaInicialApp.resource

*** Variables ***
${campo_equipamento}        //android.widget.Button[@resource-id="com.softdesign.minecontrol:id/btnSelecionarEquipamento"]
${selecionar_equipamento}   //android.widget.Button[@resource-id="com.softdesign.minecontrol:id/btnItem" and @text="CAMINHÃO"]
${selecionar_grupo_equipamento}     //android.widget.Button[@resource-id="com.softdesign.minecontrol:id/btnItem" and @text="CM FMX "]
${selecionar_tipo}         //android.widget.Button[@resource-id="com.softdesign.minecontrol:id/btnItem" and @text="CM FMX - 103"]
${digitar_codigo}          //android.widget.EditText[@resource-id="com.softdesign.minecontrol:id/txtCodEquipamento"]
${btn_avancar}      //android.widget.Button[@resource-id="com.softdesign.minecontrol:id/btnAvancarLoginEquipamento"]
${check_list}        com.softdesign.minecontrol:id/txtChecklistTitulo
${botao_conforme}    com.softdesign.minecontrol:id/btnConforme
${botao_concluir_desabilitado}  //android.widget.Button[@resource-id="com.softdesign.minecontrol:id/btnConcluir"]
${botao_concluir_habilitado}   //android.widget.Button[@resource-id="com.softdesign.minecontrol:id/btnConcluir"]
${titulo_horimetro}            //android.widget.TextView[@resource-id="com.softdesign.minecontrol:id/txtTitulo"]



*** Keywords ***
Dado que o usuário esteja logado no App
    Dado que o usuário acessa a página inicial do app
    Quando o usuário inserir um ID de operador válido
    E o usuário inserir uma senha válida
    E acionar o botão Acessar

Quando o usuário selecionar um equipamento
    Wait Until Element Is Visible    ${campo_equipamento}
    Click Element    ${campo_equipamento}
    Click Element    ${campo_equipamento}
    Sleep    5
    Click Element    ${selecionar_equipamento}
    Sleep    5
    Click Element    ${selecionar_grupo_equipamento}
    Sleep    5s
    Click Element    ${selecionar_tipo}

E digitar o código
    Click Element    ${digitar_codigo}
    Input Password    ${digitar_codigo}    301  
    Sleep    5s

E clicar no botao Avancar
    Wait Until Element Is Visible    {btn_avancar}  
    Click Element    ${btn_avancar}  

# Então o sistema exibirá a tela do Check list
#     Wait Until Element Is Visible   ${check_list} 

E clicar no botao conforme 23 vezes ate o checklist final 
    Wait Until Element Is Visible    ${botao_conforme}
    [Arguments]    ${botao_conforme}
        FOR    ${i}    IN RANGE    23
        Click Element    ${botao_conforme}
        END
             

    
