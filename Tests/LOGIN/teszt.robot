*** Settings ***
Resource  ../../Resources/login_resource.robot
Variables  ../../Resources/variable.py
Resource    ../../Resources/variables.robot
Resource  ../../Resources/PO/po_mymenu.robot

*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}

*** Test Cases ***
Test2
    [Tags]  most
    common.Begin web test  https://qa.varoskartya.com  chrome
    Give the email in the login page  tamas.vincze@intertick.hu
    ${ertek} =  get value  css=input[formcontrolname=username]
    log to console  ${ertek}

Test1
    open browser and login to stemx or stemxcity  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
    po_mymenu.Click the Mymenu
    sleep  2s
    ${width}  ${height} =	Get Element Size	xpath=//*[@class="cdk-overlay-pane"]
    log to console  ${width}
    log to console  ${height}
    ${width1} =  set variable  ${width}
    ${x} =  get horizontal position  xpath=//*[@class="cdk-overlay-pane"]
    ${x1} =  set variable  ${x}
    log to console  ${x}
    ${mymenu} =  get horizontal position  xpath=//*[@class="material-icons ng-star-inserted"]
    ${mymenu_width}  ${mymenu_height} =	Get Element Size	xpath=//*[@class="material-icons ng-star-inserted"]
    log to console  ${mymenu}
    ${menu} =  evaluate  ${x}+${width}
    log to console  ${menu}
    ${wi_width}  ${wi_height}=	Get Window Size
    log to console  ${wi_width}
    should be true  ${menu} > ${mymenu}+${mymenu_width}
    #Open Vk login page  ${OLDAL_URL}  ${bogeszo}
    #Give login date and login  ${box_office1_email_ok}  ${box_office1_password_ok}
    #change the language to english via mymenu