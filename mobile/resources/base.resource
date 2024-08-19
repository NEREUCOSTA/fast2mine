*** Settings ***

Library    AppiumLibrary

*** Variables ***
${url_local}    http://localhost:4723
${enter_id}     com.softdesign.minecontrol:id/id_operador

*** Keywords ***

Acessar a tela inicial do App
    Open Application    ${url_local}    
    ...                 platformName=Android
    ...                 deviceName=Android Emulator
    ...                 automationName=UiAutomator2
    ...                 app=C:\\Fast2mine - miningcontrol\\fast2_mine_main\\fast2mine\\mobile\\app\\fast2mine_2.13.02.02.apk
    ...                 udid=emulator-5554
    ...                 autoGrantPermissions=true
    ...                desired_caps['uiautomator2ServerInstallTimeout'] = 60000  # 60 segundos

    
