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
