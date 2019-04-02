*** Settings ***
Library  SeleniumLibrary


*** Variables ***
# ${PO_MENU_JEGYPENZTER_ID} =  mat-expansion-panel-header-3
${PO_MENU_JEGYPENZTER_ID} =  xpath=//a[contains(text(),'Jegypénztár')]
${PO_MENU_JEGYPENZTER_SUBMENU_ID} =  cdk-accordion-child-3
${PO_MENU_ELADAS_SUBMENU_ID} =  link=Eladás
${PO_MENU_FELHASZNALOK_KARB_ID} =  id=mat-expansion-panel-header-0
${PO_MENU_FELHASZNALOK_KARB_SUBMENU_ID} =  id=cdk-accordion-child-0
${PO_MENU_FELHASZNALOK_KARB_PARTNER_ID} =  id=partners_submenu

*** Keywords ***
Click the jegypenzter menu and wait for the submenu
    click element  ${PO_MENU_JEGYPENZTER_ID}
    wait until element is visible  ${PO_MENU_JEGYPENZTER_SUBMENU_ID}
    wait until element is visible  ${PO_MENU_ELADAS_SUBMENU_ID}

Click the "eladas" submenu
    click element  ${PO_MENU_ELADAS_SUBMENU_ID}

Click the Esemenyek menu and wait for the submenu
    click element  xpath=//a[contains(text(),'Események')]
    wait until element is visible  cdk-accordion-child-2

Click the Programok submenu
    wait until element is visible  link=Programok
    click element  link=Programok

Click the felhasznalok karbantartasa
    [Documentation]  A menüben a felhasználók karbantartása menüpontra kattint.
    click element  ${PO_MENU_FELHASZNALOK_KARB_ID}

Wait the felhasznalaok karbantartasa submenu visiable
    [Documentation]  Megvárjuk míg a submenu megjelenik.
    wait until element is visible  ${PO_MENU_FELHASZNALOK_KARB_SUBMENU_ID}

Wait the partner menu is visiable
    [Documentation]  Megvárjuk míg a partnerek menüpont megjelenik
    wait until element is visible  ${PO_MENU_FELHASZNALOK_KARB_SUBMENU_ID}

Click the partner menu
    sleep  1s
    click element  ${PO_MENU_FELHASZNALOK_KARB_PARTNER_ID}


Go to the partners page via menu
    Click the felhasznalok karbantartasa
    #click element  id=mat-expansion-panel-header-0
    Wait the felhasznalaok karbantartasa submenu visiable
    #wait until element is visible  id=cdk-accordion-child-0
    #wait until element is visible  id=partners_submenu
    Click the partner menu
    sleep  2s
    #click element  id=partners_submenu