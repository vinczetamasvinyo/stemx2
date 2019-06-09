*** Settings ***
Library  SeleniumLibrary
Resource  po_partners.robot
Resource  po_partner_roles.robot
Resource  po_users.robot


*** Variables ***
# ${PO_MENU_JEGYPENZTER_ID} =  mat-expansion-panel-header-3
${PO_MENU_JEGYPENZTER_ID} =  xpath=//a[contains(text(),'Jegypénztár')]
#${PO_MENU_JEGYPENZTER_SUBMENU_ID} =  cdk-accordion-child-3
${PO_MENU_JEGYPENZTER_SUBMENU_ID} =  cdk-accordion-child-2
${PO_MENU_ELADAS_SUBMENU_ID} =  link=Eladás
#${PO_MENU_FELHASZNALOK_KARB_ID} =  id=mat-expansion-panel-header-0
${PO_MENU_FELHASZNALOK_KARB_ID} =  id=user_management_menu
${PO_MENU_FELHASZNALOK_KARB_SUBMENU_ID} =  id=cdk-accordion-child-0
#${PO_MENU_FELHASZNALOK_KARB_SUBMENU_ID} =  cdk-accordion-child-2
${PO_MENU_FELHASZNALOK_KARB_PARTNER_ID} =  id=partners_submenu
${PO_MENU_FELHASZNALOK_KARB_USER_MENU_ID} =  id=users_submenu
#${PO_MENU_VENUES_ID} =  id=mat-expansion-panel-header-4
${PO_MENU_VENUES_ID} =  id=venues_submenu
${PO_MENU_VENUES_SUMENU_ID} =  id=cdk-accordion-child-4
#${PO_MENU_AUDITORIUMS_SUMENU_ID} =  xpath=//a[contains(text(),'Nézőterek')or contains(text(),'Auditoriums')]
${PO_MENU_AUDITORIUMS_SUMENU_ID} =  id=auditoriums_submenu
#${PO_MENU_VENUESS_SUMENU_ID} =  xpath=//a[contains(text(),'Előadóhelyek') or contains(text(),'Venues')]
${PO_MENU_VENUESS_SUMENU_ID} =  xpath=//*[@ng-reflect-router-link="/admin/event/venues"]
${PO_MENU_EVENTS_ID} =  //*[@id="event_menu"]
${PO_MENU_EVENTS_ID2} =  ${PO_MENU_EVENTS_ID}//mat-expansion-panel-header
${PO_MENU_PROGRAMOK_SUBMENU_ID} =  xpath=//*[@id='programs_submenu']
${PO_MENU_EVENTS_SUMNEU_ID} =  //*[@id="events_submenu"]

*** Keywords ***
Click the programs submenu
    [Documentation]  A programok almenüre kattint.
    click element  ${PO_MENU_PROGRAMOK_SUBMENU_ID}

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
    ${sumenu} =  get element attribute  xpath=//*[@id="user_management_menu"]//mat-expansion-panel-header  aria-controls
    wait until element is visible  xpath=//*[@id="${sumenu}"]
    #wait until element is visible  ${PO_MENU_FELHASZNALOK_KARB_SUBMENU_ID}

Wait the partner menu is visiable
    [Documentation]  Megvárjuk míg a partnerek menüpont megjelenik
    wait until element is visible  ${PO_MENU_FELHASZNALOK_KARB_SUBMENU_ID}

Click the users menu
    [Documentation]  Rákattintunk a Felhasználók almenüre.
    click element  ${PO_MENU_FELHASZNALOK_KARB_USER_MENU_ID}

Click the partner menu
    sleep  1s
    click element  ${PO_MENU_FELHASZNALOK_KARB_PARTNER_ID}

Click the partner role menu
    click element  id=partner_roles_submenu

Wait until partner role submenu visible
    wait until element is visible  id=partner_roles_submenu

Go to the partner role via menu
    Click the felhasznalok karbantartasa
    Wait the felhasznalaok karbantartasa submenu visiable
    Wait until partner role submenu visible
    Click the partner role menu
    po_partner_roles.Wait the partner role page loaded


Go to the partners page via menu
    Click the felhasznalok karbantartasa
    Wait the felhasznalaok karbantartasa submenu visiable
    Click the partner menu
    Waiting the partner page loaded

Go to the users page via menu
    Click the felhasznalok karbantartasa
    Wait the felhasznalaok karbantartasa submenu visiable
    Click the users menu
    Wait the users page loaded

Click the Venues menu
    [Documentation]  A jobb oldalon a Venues menüre kattint.
    click element  ${PO_MENU_VENUES_ID}

Click the events menu
    [Documentation]  A jobb oldalon az esemeények menüre kattint
    click element  ${PO_MENU_EVENTS_ID}

Wait until the events submenu visible
    [Documentation]  Megvárja amíg az eseményekhez tartozó submenu megjelenik.
    ${submenu_id} =  get element attribute  ${PO_MENU_EVENTS_ID2}  aria-controls
    log  ${submenu_id}
    wait until element is visible  xpath=//*[@id="${submenu_id}"]

Wait until the venues submenu visible
    [Documentation]  Megvárja amíg a venues submenu megjelenik.
    wait until element is visible  ${PO_MENU_VENUES_SUMENU_ID}

Click the auditoriums submenu
    [Documentation]  A nézőterek almenüre kattint.
    wait until element is visible  ${PO_MENU_AUDITORIUMS_SUMENU_ID}
    click element  ${PO_MENU_AUDITORIUMS_SUMENU_ID}

Click the venues submenu
    [Documentation]  Az előadóhelyek almenüre kattint
    wait until element is visible  ${PO_MENU_VENUESS_SUMENU_ID}
    click element  ${PO_MENU_VENUESS_SUMENU_ID}

Click the events submenu
    [Documentation]  Belekattint az események almenübe.
    wait until element is visible  ${PO_MENU_EVENTS_SUMNEU_ID}
    click element  ${PO_MENU_EVENTS_SUMNEU_ID}
