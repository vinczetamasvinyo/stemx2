*** Settings ***
Library  SeleniumLibrary
Resource  po_login.robot
Resource  po_userprofile.robot

*** Variables ***
${PO_MYMENU_MENU_ID} =  xpath=//*[@class="user-profile"]
${PO_MYMENU_SUBMENU_ID} =  xpath=//*[@class="mat-menu-content"]
${PO_MYMENU_SUBMENU_LOGOUT_ID} =  xpath=//*[@id="menu_loguout"]
${PO_MYMENU_SUBMENU_MYPROFIL} =  id=menu-account
${PO_MYMENU_} =    id=menu
${PO_WAITING1} =  10
*** Keywords ***
Logout
    [Documentation]  Elvégzi a logout-t.
    Click the Mymenu
    Click the logout submenu


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
    #po_login.Waiting the login pager loaded
    run keyword if  "${DE}" == "stemc"  Waiting page load an apper the element
    ...  ELSE IF  "${DE}" == "stemx"  Wait the stemx login page loaded

Click the language
    click element  id=menu_language
    #sleep  2s

Wait the language submenu appear
    #wait until element is visible  id=cdk-overlay-1
    #wait until element is visible  xpath=//*[@class="mat-menu-panel ng-trigger ng-trigger-transformMenu ng-tns-c15-5 mat-menu-before mat-menu-below mat-elevation-z5 ng-star-inserted"]
    #sleep  2s
    ${idfomenu} =  get element attribute  //*[@class="cdk-overlay-pane"]  id
    log  ${idfomenu}
    ${almenu} =  almenu id szoveg  ${idfomenu}
    log  ${almenu}
    wait until element is visible  id=${almenu}
    #sleep  1s
    #get element attribute
    #@{elem} =  SeleniumLibrary.Get WebElements  xpath=//*[@class="mat-menu-content"]
    #${egye_elem} =  get from list  ${elem}  1
    #wait until element is visible  ${egye_elem}

Click the english language
    click element  id=menu_change_languageen

click the hungarian language
    click element  id=menu_change_languagehu

Waiting the new language is loaded
    #TOdo: ezt még meg kell csinálni
    wait until element is visible  id=menu  10
    sleep  1s

Waiting the page loaded
    wait until element is visible  ${PO_MYMENU_MENU_ID}  ${PO_WAITING1}
    sleep  2s

Change the language to English via mymenu
    [Documentation]  A nyelvet angolra állítja a mymenu-n keresztül.
    po_mymenu.Click the Mymenu
    po_mymenu.Click the language
    po_mymenu.Wait the language submenu appear
    po_mymenu.Click the english language
    #po_mymenu.Waiting the new language is loaded
    po_mymenu.Waiting the page loaded

Change the language to hungarian via mymenu
    [Documentation]  A nyelvet magyarra beállítja a mymenu-n keresztül.
    po_mymenu.Click the Mymenu
    po_mymenu.Click the language
    po_mymenu.Wait the language submenu appear
    po_mymenu.click the hungarian language
    po_mymenu.Waiting the page loaded

Set the language
    [Arguments]  ${lan}
    run keyword if  "${lan}"=="Hun"  Change the language to hungarian via mymenu
    ...  ELSE IF  "${lan}"=="En"  Change the language to English via mymenu
    #po_mymenu.Waiting the page loaded

Check and set language2
    [Arguments]  ${defaultlan}  ${lan}
    log  ${defaultlan}
    log  ${lan}
    run keyword if  "${lan}" != "${defaultlan}"  Set the language  ${lan}
