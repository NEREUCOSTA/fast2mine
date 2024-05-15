*** Settings ***

Resource    ../resources/base.resource


*** Variables ***
${escala_de_turno}                  //span[contains(.,'Escala de Turno')]
${filtar_grupo}                     (//*[contains(text(), 'Selecione')])
${cadastro_turno}                   //span[contains(.,'Cadastro de Turno')]
${selecione_grupo}                  //p[contains(.,'Selecione...')]
${select_inativo}                   (//*[contains(text(), 'Inativo')])[1]
${campo_nome_grupo}                 //input[@name='name']
${btn_cadastrar_turno}              //span[contains(.,'Cadastrar')]
${grupo_perfuracao}                       (//*[contains(text(), 'Grupo Perfuração matutino')])
${primeiro_valor}                   //*[@id="react-select-3-option-1"]                                        
${segundo_valor}                    //*[contains(text(),'Cauê Vieira')]    
${terceiro_valor}                   //*[contains(text(),'Dante Souza')]
${quarto_valor}                     //*[contains(text(),'Fernado Rodrigues')]
${quinto_valor}                     //*[contains(text(),'Francisco Pereira')]
${sexto_valor}                      //*[contains(text(),'João Pedro Pinto')]
${setimo_valor}                     //*[contains(text(),'Kevin Moreira')]
${btn_finalizar}                    //button[contains(.,'FINALIZAR')]


*** Keywords ***

Acessar a aba escala de turno
    browser.click        locator=${escala_de_turno}
    builtin.Sleep    2
Filtrar grupo de turno
    Wait Until Element Is Visible    locator=${filtar_grupo}
    browser.click                    locator=${filtar_grupo}
Selecionar um grupo na lista
    scroll element into view    locator=${grupo_perfuracao}   
    browser.click               locator=${grupo_perfuracao}
Inserir valores nos dias da semana do primeiro intervalo
    # wait until element is visible    locator=${select_inativo}
    browser.click        locator=${select_inativo}
    browser.click        locator=${primeiro_valor}
    builtin.Sleep    2 
    browser.click        locator=${select_inativo}
    browser.click        locator=${segundo_valor}
    builtin.Sleep    2
    browser.click        locator=${select_inativo}
    browser.click        locator=${terceiro_valor}
    builtin.Sleep    2
    browser.click        locator=${select_inativo}
    browser.click        locator=${quarto_valor}
    builtin.Sleep    2
    browser.click        locator=${select_inativo}
    browser.click        locator=${quinto_valor}
    builtin.Sleep    2
    browser.click        locator=${select_inativo}
    browser.click        locator=${sexto_valor}
    builtin.Sleep    2
    browser.click        locator=${select_inativo}
    browser.click        locator=${setimo_valor}
    builtin.Sleep    2

Acionar o botao finalizar para salvar as informações
    browser.click    locator=${btn_finalizar}
    builtin.Sleep    2