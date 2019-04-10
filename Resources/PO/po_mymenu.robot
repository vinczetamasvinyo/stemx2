*** Settings ***
Library  SeleniumLibrary
Resource  po_login.robot
Resource  po_userprofile.robot

*** Variables ***
${PO_MYMENU_MENU_ID} =  xpath=//*[@class="user-profile"]
${PO_MYMENU_SUBMENU_ID} =  xpath=//*[@class="mat-menu-content"]
${PO_MYMENU_SUBMENU_LOGOUT_ID} =  xpath=//*[@id="menu_loguout"]
${PO_MYMENU_SUBMENU_MYPROFIL} =  id=menu-account

*** Keywords ***
Click the Mymenu
    [Documentation]  A Mymenu ikonkra kattint
    click element  ${PO_MYMENU_MENU_ID}
    wait until element is visible  ${PO_MYMENU_SUBMENU_ID}
    sleep  1s

Click the myprofil
    [Documentation]  Mymenu megynitása után a Fiókom ikonra kattint.
    click element  ${PO_MYMENU_SUBMENU_MYPROFIL}
    po_userprofile.Waiting the myprofil page loaded

Click the logout submenu
    [Documentation]  A mymenu menün belül a kijelentkezésre kattint.
    click element  ${PO_MYMENU_SUBMENU_LOGOUT_ID}
    po_login.Waiting the login pager loaded

Click the language
    click element  id=menu_language
    #sleep  2s

Wait the language submenu appear
    wait until element is visible  id=cdk-overlay-1

Click the english language
    click element  id=menu_change_languageen

Waiting the new language is loaded
    #TOdo: ezt még meg kell csinálni
    wait until element is visible  id=menu  10
    sleep  1s

Change the language to English via mymenu
    [Documentation]  A nyelvet angolra állítja a mymenu-n keresztül.
    po_mymenu.Click the Mymenu
    po_mymenu.Click the language
    po_mymenu.Wait the language submenu appear
    po_mymenu.Click the english language
    po_mymenu.Waiting the new language is loaded