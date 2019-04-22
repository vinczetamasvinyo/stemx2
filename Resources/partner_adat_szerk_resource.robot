*** Settings ***
Library  SeleniumLibrary
Resource   login_resource.robot
Resource  variables.robot
Variables  variable.py
Resource  PO/po_menu.robot
Library  Collections
Resource  Common_resource.robot
Resource  partner_letrehozasa_szoveg_resource.robot
Resource  variables/new_partner_variables.robot
Resource  PO/po_partners.robot

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
    waiting the edit partner page loaded
    #sleep  3s

Get text from edit of partner page
    [Documentation]  Visszaadja az egyszerű label-nek a szövegét.
    [Arguments]  ${path}  ${index}
    @{elem} =  SeleniumLibrary.Get WebElements  ${path}
    ${egye_elem} =  get from list  ${elem}  ${index}
    ${szoveg} =  get text  ${egye_elem}
    Log  ${szoveg}
    [Return]  ${szoveg}

Check the text on the edit partner page
    [Documentation]  megnézi, hogy az adott szöveg megfelelő-e.
    [Arguments]  ${type}  ${szoveg}  ${path}  ${index}
    ${szoveg_on_the_page} =  run keyword if  "${type}" == "szoveg"  Get text from edit of partner page  ${path}  ${index}
    ...  ELSE IF  "${type}" == "list"  Get listbox label text  ${path}  ${index}
    should be equal  ${szoveg}  ${szoveg_on_the_page}