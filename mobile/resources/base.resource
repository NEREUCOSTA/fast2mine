*** Settings ***
Library    AppiumLibrary

*** Variables ***
${url_local}     http://localhost:4723
${enter_id}      com.softdesign.minecontrol:id/id_operador
${DEVICE_NAME}   emulator-5554 
# R9XX20A3PEF
${APP_PACKAGE}   com.softdesign.minecontrol
${APP_ACTIVITY}  com.softdesign.minecontrol.SplashActivity
${TIMEOUT}       2000
${APK_PATH}      C:\\Fast2mineminingcontrol\\fast2_mine_main\\fast2mine\\mobile\\app\\fast2mine_2.13.03.00.apk

*** Keywords ***

Acessar a tela inicial do App
    Open Application    ${url_local}  
    ...                 platformName=Android
    ...                 deviceName=${DEVICE_NAME}
    ...                 automationName=UiAutomator2
    ...                 app=${APK_PATH}
    ...                 autoGrantPermissions=true
    ...                 uiautomator2ServerInstallTimeout=${TIMEOUT}  # 60 segundos
    ...                 appPackage=${APP_PACKAGE}
    ...                 appActivity=${APP_ACTIVITY}
    ...                 appWaitActivity=com.softdesign.minecontrol.*

    # Adicione um comando para garantir que a aplicação está aberta
    Wait Until Element Is Visible    ${enter_id}    timeout=${TIMEOUT}

    # Caso deseje capturar uma captura de tela após abrir a aplicação
    Capture Page Screenshot    ${OUTPUTDIR}/screenshot.png
