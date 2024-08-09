*** Settings ***

Library    Browser

*** Keywords ***
Validar página inicial da fast2mine    
    Log To Console    Validando a página inicial FastMine
    Take Screenshot   telaInicial
    Log To Console    ...Validação Concluída!

