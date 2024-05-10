*** Settings ***
Documentation        Arquivo destinado a armazenar os elementos e variaveis da área do operador.

Resource   ../../base.resource



*** Variables ***
${modulo_gerenciamento}         //h4[contains(.,'Gerenciamento')]
${grupo}                        //span[contains(.,'Grupo')]
${inserir_novos_registros}      //span[contains(.,'Inserir Novos Registros')]
${btn_importar_planilha}        //span[contains(.,'Importar Planilha')]
${sheet_name}                   Dados
${planilha}                     F:\\Projetos\\Nereu_Fast_2_Mine\\fast2mine\\resources\\data\\template_operatorsgroups.xlsx
${btn_editar_registros}         //span[contains(.,'Editar Registros')]
${operador}                     //span[@class='MuiTab-wrapper'][contains(.,'Operador')]
${excluir_arquivos}             F:\\Projetos\\Nereu_Fast_2_Mine\\fast2mine\\resources\\data\\\\template_operatorsgroups.xlsx 
${planilha_operador}            F:\\Projetos\\Nereu_Fast_2_Mine\\fast2mine\\resources\\data\\\\template_operators.xlsx

*** Keywords ***
#######################################################
### Keywords e elementos da aba "GRUPO" do MENU OPERADOR ###
#######################################################
Acessar modulo Gerenciamento da Plataforma Mining Control
    Click Element    locator=${modulo_gerenciamento}
    builtin.Sleep    2
 Acionar a opção grupo    
    Wait Until Page Contains    Grupo
    Click Element    locator=${grupo}
Download da Planilha para Inserir novos registros
    Click Element    locator=${inserir_novos_registros}
Arquivo salvo na pasta do projeto
    builtin.Sleep    3

    
Importar Planilha com os novos registros
   Click Element    locator=${btn_importar_planilha}
   builtin.Sleep    2
   pyautogui.Write    message=${planilha} 
   Press    enter
   builtin.Sleep    3
remove o arquivo da pasta
    File Should Exist  ${planilha}
    Remove File        ${excluir_arquivos}
    File Should Not Exist  ${planilha}
Editar Registros
    Click Element    locator=${btn_editar_registros}
    builtin.Sleep    2


###############################################################
### Keywords e elementos da aba "OPERADOR" do MENU OPERADOR ###
###############################################################    
    
Acionar a opção operador
     Wait Until Page Contains   Operador
    Click Element    locator=${operador} 

Download da Planilha para Inserir Novos Registros Operador
    Click Element    locator=${inserir_novos_registros}
Arquivo salvo na pasta do projeto Operador
    builtin.Sleep    3

Importar Planilha com os novos registros Operador
   Maximize Browser Window
   Click Element    locator=${btn_importar_planilha}
   builtin.Sleep    2
   pyautogui.Write    message=${planilha_operador}
   Press    enter
   builtin.Sleep    2

remove o arquivo da pasta Operador
    File Should Exist  ${planilha_operador}
    Remove File        ${planilha_operador}
    File Should Not Exist  ${planilha_operador}   
Editar Registros Operador
    Click Element    locator=${btn_editar_registros}
    builtin.Sleep    2
    

