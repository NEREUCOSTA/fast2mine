*** Configurações ***

Recurso    ../base.resource

*** Variáveis ***
${enter_id}        com.softdesign.minecontrol:id/id_operador
${id_number}       741
${enter_pwd}       com.softdesign.minecontrol:id/password
${pwd}             741
${btn_enter}       com.softdesign.minecontrol:id/btnAvancar
*** Palavras-Chave ***
Dado que o usuário acessa a página inicial do app
    Click Element    ${enter_id}
Quando o usuário inserir um ID de operador válido
    Input Text       ${enter_id}    ${id_number}
E o usuário inserir uma senha válida
    Input Text    ${enter_pwd}    ${pwd}
E acionar o botão Acessar
    Click Element    ${btn_enter}




    
    