*** Settings ***

Resource   ../base.resource

*** Variables ***
${enter_id}        //android.widget.EditText[@resource-id="com.softdesign.minecontrol:id/id_operador"]
${id_number}      123
${enter_pwd}       com.softdesign.minecontrol:id/password
${pwd}            123
${btn_enter}       com.softdesign.minecontrol:id/btnAvancar

*** Keywords ***
Dado que o usuário acessa a página inicial do app
    Click Element   ${enter_id}
Quando o usuário inserir um ID de operador válido
    Sleep    5s
    Input Text       ${enter_id}    ${id_number}
E o usuário inserir uma senha válida
    Sleep    5s
    Input Text    ${enter_pwd}    ${pwd}
E acionar o botão Acessar
    Sleep    5s
    Click Element    ${btn_enter}




    
    