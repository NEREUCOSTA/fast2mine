*** Settings ***
Documentation        Arquivo destinado a armazenar os elementos e variaveis da área do operador.
Resource   ../../base.resource

Library    OperatingSystem
Library    SeleniumLibrary
Library    pyautogui


*** Variables ***
${modulo_gerenciamento}         //h4[contains(.,'Gerenciamento')]
${grupo}                        //span[contains(.,'Grupo')]
${inserir_novos_registros}      //span[contains(.,'Inserir Novos Registros')]
${btn_importar_planilha}        //span[contains(.,'Importar Planilha')]
${sheet_name}                   Dados
${planilha}                     F:\\Projetos\\Nereu_Fast_2_Mine\\fast2mine\\resources\\data\\template_operatorsgroups.xlsx
${btn_editar_registros}         //span[contains(.,'Editar Registros')]
${operador}                     //span[@class='MuiTab-wrapper'][contains(.,'Operador')]
${excluir_arquivos}             resources\data\template_operatorsgroups.xlsx 
       

*** Keywords ***
#######################################################
### Keywords e elementos da aba "GRUPO" do OPERADOR ###
#######################################################
Acessar modulo Gerenciamento do Operador na aba Grupo
    Click Element    locator=${modulo_gerenciamento}
    builtin.Sleep    2
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
    File Should Exist  ${excluir_arquivos}
    Remove File        ${excluir_arquivos}
    File Should Not Exist  ${excluir_arquivos}
Editar Registros
    Click Element    locator=${btn_editar_registros}
    builtin.Sleep    2


###############################################################
### Keywords e elementos da aba "OPERADOR" do MENU OPERADOR ###
###############################################################    
    
Acessar modulo Gerenciamento do Operador na aba Operador  
    Click Element    locator=${modulo_gerenciamento}  
    builtin.Sleep    2
    Wait Until Page Contains   Operador
    Click Element  locator=${operador}

Download da Planilha para Inserir Novos Registros Operador
    Click Element    locator=${inserir_novos_registros}
Arquivo salvo na pasta do projeto Operador
    builtin.Sleep    3

Importar Planilha com os novos registros Operador
   Click Element    locator=${btn_importar_planilha}
   builtin.Sleep    2
   pyautogui.Write    message=${planilha}
   Press    enter
   builtin.Sleep    2
Editar Registros Operador
    Click Element    locator=${btn_editar_registros}
    builtin.Sleep    2
    

