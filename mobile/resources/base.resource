*** Configurações ***

Library    AppiumLibrary

*** Variáveis ***
${url_local}    http://localhost:4723
${enter_id}     com.softdesign.minecontrol:id/id_operador

*** Palavras-Chave ***

Acessar a tela inicial do App
    Open Application    ${url_local}    
    ...                 platformName=Android
    ...                 deviceName=Android Emulator
    ...                 automationName=UiAutomator2
    ...                 app=${EXECDIR}/mobile/app/homolog_fast2mine_2.12.17.02.apk
    ...                 udid=emulator-5554
    ...                 autoGrantPermissions=true

