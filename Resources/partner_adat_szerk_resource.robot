*** Settings ***
Library  SeleniumLibrary
Resource   login_resource.robot
Resource  variables.robot
Variables  variable.py
Resource  PO/po_menu.robot
Library  Collections
Resource  Common_resource.robot
Resource  partner_letrehozasa_szoveg_resource.robot

*** Keywords ***
Chose elem and go the the edit page
    ${ikon} =  get element count  xpath=//*[@class="material-icons edit-primary"]
    log  ${ikon}
    ${ikon2} =  SeleniumLibrary.Get WebElementS  xpath=//*[@class="material-icons edit-primary"]
    ${random} =  Evaluate  random.randint(0, ${ikon}-1)  modules=random
    log  ${random}
    ${elem} =  get from list  ${ikon2}  ${random}
    scroll to element  ${elem}  100
    click element  ${elem}
    sleep  3s