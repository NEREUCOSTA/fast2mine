*** Settings ***
Documentation        Arquivo destinado a armazenar os elementos e variaveis da área do operador.
Resource   ../../base.resource
Resource  ../../pages/gerenciamento/operador.resource

Library    FakerLibrary  locale=pt_BR


*** Variables ***

${Menu_turno}                       //a[contains(.,'Turno')]
${Grupo_de_Turno}                   //span[@class='MuiTab-wrapper'][contains(.,'Grupo de Turno')]
${campo_Grupo_de_turno}             //input[contains(@name,'name')]
${descricao}                        //input[contains(@name,'description')]
${btn_cadastrar}                    //button[@type='submit']
${verificar_cadastro}               (//input[contains(@type,'text')])[3]
${btn_finalizar}                    //button[contains(.,'FINALIZAR')]
${cadastro_turno}                   //span[contains(.,'Cadastro de Turno')]
${selecione_grupo}                  //p[contains(.,'Selecione...')]
${select_inativo}                   (//*[contains(text(), 'Inativo')])[1]
${select_2}                         (//*[contains(text(), 'Inativo')])[2]
${select_3}                         (//*[contains(text(), 'Inativo')])[3]
${select_4}                         (//*[contains(text(), 'Inativo')])[4]
${select_5}                         (//*[contains(text(), 'Inativo')])[5]
${select_6}                         (//*[contains(text(), 'Inativo')])[6]
${select_7}                         (//*[contains(text(), 'Inativo')])[7]
${select_8}                         (//*[contains(text(), 'Inativo')])[8]
${select_9}                         (//*[contains(text(), 'Inativo')])[9]
${select_10}                        (//*[contains(text(), 'Inativo')])[10]
${select_11}                        (//*[contains(text(), 'Inativo')])[11]
${select_12}                        (//*[contains(text(), 'Inativo')])[12]
${select_13}                        (//*[contains(text(), 'Inativo')])[13]
${select_14}                        (//*[contains(text(), 'Inativo')])[14]
${campo_nome_grupo}                 //input[@name='name']
${btn_cadastrar_turno}              //span[contains(.,'Cadastrar')]
${btn_finalizar_turno}              //button[contains(.,'FINALIZAR')]
${editar_campo_nome}                (//input[@type='text'])[3]
${grupo_de_equipamento}             //span[@class='MuiTab-wrapper'][contains(.,'Grupo de Equipamento')]
${grupo_de_turno}                   //*[@id="react-select-4-option-3"]
${btn_finalizar_grupo_equipamento}  //span[contains(.,'FINALIZAR')]
${campo_grupo_turno}                (//div[@aria-hidden='true'])[8]
${selecionar_grupo_turno}           //*[@id="react-select-5-option-1"]
${escala_de_turno}                  //span[contains(.,'Escala de Turno')]
${filtar_grupo}                     (//*[contains(text(), 'Selecione')])
${perfuracao}                       (//*[contains(text(), 'Grupo Perfuração matutino')])
${primeiro_valor}                   //*[@id="react-select-3-option-1"]                                        
${segundo_valor}                    //*[contains(text(),'Cauê Vieira')]    
${terceiro_valor}                   //*[contains(text(),'Dante Souza')]
${quarto_valor}                     //*[contains(text(),'Fernado Rodrigues')]
${quinto_valor}                     //*[contains(text(),'Francisco Pereira')]
${sexto_valor}                      //*[contains(text(),'João Pedro Pinto')]
${setimo_valor}                     //*[contains(text(),'Kevin Moreira')]


*** Keywords ***
##################################################################
### Keywords e elementos da aba "GRUPO DE TURNO" do MENU TURNO ####
##################################################################

Acessar modulo Gerenciamento do Turno na aba Grupo de turno
    Acessar modulo Gerenciamento da Plataforma Mining Control
    browser.Click    selector=${Menu_turno}
    BuiltIn.Sleep  2s
    
Inserir o nome e descricao nos campos solicitados
    Wait For Elements State        selector=${campo_Grupo_de_turno}    state=visible
    browser.Click                  selector=${campo_Grupo_de_turno}    
    Fill Text                      selector=${campo_Grupo_de_turno}    txt=Grupo Perfuração matutino
    browser.Click                  selector=${descricao}
    Fill Text                      selector=${descricao}               txt=Equipe responsável pelas atividades durante o perído da manhã

Acionar o botão Cadastrar    
    Wait For Elements State      selector=${btn_cadastrar}    state=visible
    browser.Click                selector=${btn_cadastrar}

Verificar se os dados foram cadastrados
    Wait For Elements State  selector=${verificar_cadastro}    state=visible

 Acionar o botao finalizar na aba Grupo de turno   
    Wait For Elements State   selector=${btn_finalizar}    state=visible
    browser.Click             selector=${btn_finalizar} 
    builtin.Sleep    2s

#####################################################################
### Keywords e elementos da aba "CADASTRO DE TURNO" do MENU TURNO ###
#####################################################################   

Acessar o modulo Turno
    browser.Click    selector=${Menu_turno}
    builtin.Sleep    2
Acessar a aba Cadastro de Turno
    browser.Click    selector=${cadastro_turno}
    BuiltIn.Sleep    2s
    # Wait Until Page Contains  Cadastro de Turno

Inserir um Grupo de turno e nome    
    browser.Click              selector=${selecione_grupo}
    Wait For Elements State    selector=${selecionar_um_grupo}    state=visible 
    browser.Click              selector=${selecionar_um_grupo} 
    browser.Click              selector=${campo_nome_grupo}
    ${descricao_nome}=  FakerLibrary.Name Male
    Fill Text                  selector=${campo_nome_grupo}  txt=${descricao_nome}

Acionar o botao cadastrar    
    Wait For Elements State   selector=${btn_cadastrar_turno}    state=visible
    browser.Click             selector=${btn_cadastrar_turno}   

Verificar se as informações foram cadastradas
    Wait For Elements State    selector=${verificar_cadastro}    state=visible
Acionar o botao finalizar na aba cadastro de turno
    Wait For Elements State   selector=${btn_finalizar_turno}    state=visible
    browser.Click             selector=${btn_finalizar_turno}

Esperar a confirmação da inclusão do cadastro
    builtin.Sleep    3s   

 Editar itens na listagem
    browser.Click  selector=${editar_campo_nome}
    Fill Text      selector=${editar_campo_nome}  txt=a

########################################################################
### Keywords e elementos da aba "ESCALA DE TURNO" do MENU TURNO ########
########################################################################
Acessar a aba escala de turno
    browser.Click        selector=${escala_de_turno}
    builtin.Sleep    2
Filtrar grupo de turno
    browser.Click        selector=${filtar_grupo}
Selecionar um grupo na lista
    Scroll To Element    selector=${perfuracao}   
    browser.Click        selector=${perfuracao}
Inserir valores nos dias da semana do primeiro intervalo
    browser.Click        selector=${select_inativo}
    browser.Click        selector=${primeiro_valor}
    builtin.Sleep    2 
    browser.Click        selector=${select_inativo}
    browser.Click        selector=${segundo_valor}
    builtin.Sleep    2
    browser.Click        selector=${select_inativo}
    browser.Click        selector=${terceiro_valor}
    builtin.Sleep    2
    browser.Click        selector=${select_inativo}
    browser.Click        selector=${quarto_valor}
    builtin.Sleep    2
    browser.Click        selector=${select_inativo}
    browser.Click        selector=${quinto_valor}
    builtin.Sleep    2
    browser.Click        selector=${select_inativo}
    browser.Click        selector=${sexto_valor}
    builtin.Sleep    2
    browser.Click        selector=${select_inativo}
    browser.Click        selector=${setimo_valor}

Acionar o botao finalizar para salvar as informações
    browser.Click    selector=${btn_finalizar}

    
Inserir valores nos dias da semana do segundo intervalo

## Obter html da página atual 
    ${html}    Get Page Source
    Log    ${html}
    
    
    

########################################################################
### Keywords e elementos da aba "GRUPO DE EQUIPAMENTO" do MENU TURNO ###
########################################################################

Acessar modulo Gerenciamento do Turno na aba Grupo de Equipamento 
    Acessar modulo Gerenciamento da Plataforma Mining Control
    browser.Click            selector=${Menu_turno}
    Wait For Elements State  selector=${grupo_de_equipamento}
    browser.Click            selector=${grupo_de_equipamento}

Alterar dados no grid 
    Wait For Elements State  selector=${campo_grupo_turno}
    browser.Click            selector=${campo_grupo_turno}
    BuiltIn.Sleep  2s
    browser.Click            selector=${selecionar_grupo_turno}   
    BuiltIn.Sleep  2s

Acionar o botao finalizar na aba Grupo de equipamentos   
    Wait For Elements State  ${btn_finalizar_grupo_equipamento} 
    browser.Click            ${btn_finalizar_grupo_equipamento}   