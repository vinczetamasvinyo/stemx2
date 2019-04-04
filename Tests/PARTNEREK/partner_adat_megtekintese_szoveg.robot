*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/login_resource.robot
Resource  ../../Resources/variables.robot
Variables  ../../Resources/variable.py
Resource  ../../Resources/PO/po_menu.robot
Library  Collections

Test Setup  login_resource.Open Vk login page  ${OLDAL_URL}  ${bogeszo}

*** Variables ***

*** Test Cases ***
Test1
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Go to the partners page via menu
    sleep  1s
    ${ikon} =  get element count  css=a.link-action-icon.link-icon
    ${ikon2} =  SeleniumLibrary.Get WebElementS  css=a.link-action-icon.link-icon
    ${random} =  Evaluate  random.randint(0, ${ikon})  modules=random
    log  ${random}
    #click element  ${ikon2}[0]
    #click element  ${ikon2}[${random}]
    ${elem} =  get from list  ${ikon2}  ${random}
    click element  ${elem}
    sleep  3s

*** Keywords ***
