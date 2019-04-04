*** Settings ***
Library  SeleniumLibrary
Library  String
Resource  variables.robot
Variables  variable.py
Resource  PO/po_tempmail.robot
Resource  PO/po_menu.robot
Resource  PO/po_mymenu.robot
Resource  PO/po_givepassword.robot
Resource  partner_invite_resource.robot
Resource  login_resource.robot
Resource  Common.robot

*** Variables ***


*** Keywords ***

Get the only password text
    [Documentation]  A visszakapott password label szövegből kiveszi csak azt a szöveget ami látszik,
                ...  és ezt visszaadja.
    ${label} =  Get the text of password
    log  ${label}
    @{szovegek} =  split the text  ${label}  \n
    log  ${szovegek}
    ${jelszo} =  Get From List  ${szovegek}  0
    [Return]  ${jelszo}