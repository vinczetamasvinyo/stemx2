*** Settings ***
#Resource  ../../Resources/partner_invite_common_resource.robot
Resource  ../../Resources/partner_page_element_resource.robot
Suite Setup  Login and go to partners page
Suite Teardown  Common.End web test

*** Variables ***

#Todo: az állapotjelző ikonok darabszám ellenőrzését meg kell csinálni.
*** Test Cases ***
Test "partner meghivasa" button appear in the page
    [Documentation]  A teszt során azt nézzük meg, hogy a partner meghívása gomb
                ...  megjelenik-e az oldalon
    Check the partner invite button appear in the page

Test the "partner felvitele" button appear in the page
    [Documentation]  A teszt soránt azt nézzük meg, hogy a partner felvitele gomb
                ...  megjelenik-e az oldalon.
    Check the partner add button appear in the page

Test the "partner input" field appear in the page
    [Documentation]  A teszt során azt nézzük meg, hogy a partner név szűrésére
                ...  használt mező megjelenik-e az oldalon.
    Check the company input field appear in the page

Test the "partner email cim" field appear in the page
    [Documentation]  A teszt soránt azt nézzük meg, hogy a partner email címének
                ...  szűrésére való mező megjelenik-e az oldalon.
    Check the "email cim" input field appear in the page

Test the "allapotvalaszto" field
    [Documentation]  A teszt során azt nézzük meg, hogy az állapotválasztó szűrű
                ...  megjelenik-e az oldalon.
    Check the "allapotvalaszto" appear in the page

Test the "Visszaallitas" gomb
    [Documentation]  A teszt soránt azt nézzük, hogy a visszaallitas
                ...  gomb megjelenik-e az oldalon.
    Check the "visszaállítás" button appear in the page

Test the "kereses" button apper in the page
    [Documentation]  A teszt során azt nézzük, hogy a Keresés gomb
                ...  megjelenik-e az oldalon.
    Check the "Kereses" button appear in the page

Test the szemek megjelenese
    [Documentation]  Megnézi, hogy az összes szem megjelenik-e az oldalon.
                ...  Annyi szemnek kell megjelennie amennyi sor van.
    [Tags]  High
    Check the all eyes appear in the page

Test the edit icon appear in the page
    [Documentation]  Megnézi, hogy az összes edit ikon megjelenik-e az oldalon.
                ...  Annyi edit ikonnak kell megjelennie amennyi sor van.
    [Tags]  High
    Check the all edit icon appear in the page

Test the delete icon appear in the page
    [Tags]  High
    Check the all delete icon appear in the page

Test the all allapot icon appear in the page
    [Documentation]  A teszt során azt nézzük meg, hogy az összes állapot icon
               ...   megjelenik-e az oldalon.
    [Tags]  valami
    Chcek the all allapot icon appear in the page
    #${sorok} =  Get the row count
    #${db_new} =  get element count  xpath=//*[@class="material-icons status-icon draft"]
    #${db_aktiv} =  get element count  xpath=//*[@class="material-icons status-icon public"]
    #${db_waite} =  get element count  xpath=//*[@class="material-icons status-icon waiting-for-confirmation"]
    #${osszes} =  Evaluate   ${db_new}+${db_aktiv}+${db_waite}
    #should be equal  ${sorok}  ${osszes}

