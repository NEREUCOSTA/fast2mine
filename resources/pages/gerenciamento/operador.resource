*** Settings ***
Documentation        Arquivo destinado a armazenar os elementos e variaveis da área do operador.
Resource   ../../base.resource
Library    OperatingSystem


*** Variables ***
${modulo_gerenciamento}         //h4[contains(.,'Gerenciamento')]
${grupo}                        //span[contains(.,'Grupo')]
${btn_inserir_novos_registros}  //button[contains(.,'Inserir Novos Registros')]
${btn_importar_planilha}        //span[contains(.,'Importar Planilha')]
${sheet_name}                   Dados
${download_dir}                 ${CURDIR}\\downloads\\ 
${diretorio_data}               F:\\Projetos\\Nereu_Fast_2_Mine\\fast2mine\\resources\\data\\
${planilha_operador}            template_operatorsgroups.xlsx       
${btn_editar_registros}         //span[contains(.,'Editar Registros')]
${operador}                     //span[@class='MuiTab-wrapper'][contains(.,'Operador')]
${excluir_arquivos}             F:\\Projetos\\Nereu_Fast_2_Mine\\fast2mine\\resources\\data\\template_operatorsgroups.xlsx 
${planilha_operador}            F:\\Projetos\\Nereu_Fast_2_Mine\\fast2mine\\resources\\data\\template_operators.xlsx
${python_path}                  F:\\Projetos\\Nereu_Fast_2_Mine\\fast2mine\\venv\\Scripts\\python.exe
${script_registros}             F:\\Projetos\\Nereu_Fast_2_Mine\\fast2mine\\inserir_novos_registros.py
${script_registros_operador}    F:\\Projetos\\Nereu_Fast_2_Mine\\fast2mine\\inserir_novos_registros_operador.py



*** Keywords ***
#######################################################
### Keywords e elementos da aba "GRUPO" do OPERADOR ###
#######################################################
Acessar modulo Gerenciamento da Plataforma Mining Control
    browser.Click    selector=${modulo_gerenciamento}
Acionar a opção grupo
    browser.Click    selector=${grupo}
Download da Planilha para Inserir novos registros
    browser.Click    selector=${btn_inserir_novos_registros}
    
Arquivo salvo na pasta do projeto
    builtin.Sleep    3
    ${caminho_origem}    Catenate      ${download_dir}    ${planilha_operador}
    ${caminho_destino}    Catenate     ${diretorio_data}  ${planilha_operador} 
    Move File    ${caminho_origem}     ${caminho_destino}

Importar Planilha com os novos registros
   Click Element    locator=${btn_importar_planilha}
   builtin.Sleep    2
   pyautogui.Write    message=${planilha}
   Press    enter
   builtin.Sleep    3
remove o arquivo da pasta
    File Should Exist  ${planilha_operador}
    Remove File        ${planilha_operador}
    File Should Not Exist  ${planilha_operador}
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
    Click Element    locator=${operador}
    builtin.Sleep    3 

Download da Planilha para Inserir Novos Registros Operador
    Click Element    locator=${btn_inserir_novos_registros}
Arquivo salvo na pasta do projeto Operador
    builtin.Sleep    3

Importar Planilha com os novos registros Operador
   Maximize Browser Window
   Click Element      locator=${btn_importar_planilha}
   builtin.Sleep    2
   pyautogui.Write    message=${planilha_operador}
   Press    enter
   builtin.Sleep    2
Editar Registros Operador
    Click Element    locator=${btn_editar_registros}
    builtin.Sleep    2

Inserir novos registros na planilha da abra grupos
    Run Process    ${python_path}    ${script_registros}

Inserir novos registros na planilha da aba operador
    Run Process    ${python_path}    ${script_registros_operador}
    

