*** Settings ***
Documentation  A teszt suite azokat a teszteseteket tartalmazza, hogy a venue lista oldalon
          ...  minden elem megfelelően jelenik-e meg.

Resource  ../../../../Resources/eloadohelyek_resource.robot

Suite Setup  Open browser and login and after go to the venues page  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
Suite Teardown  Common.End web test

*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}  language=${LAN}
${LAN}=  Hun


*** Test Cases ***
Test the search button is visiable on the venues page
    [Documentation]  Megnézzük, hogy a keresés gomb megjelenik-e az oldalon.
    Check the search button visiable on the page

Test the search input field visiable on the venues page
    [Documentation]  Megnézzük, hogy a keresés mező megjelenik-e az oldalon.
    Check the search input field visiable on the page

Test the new button visiable on the venues page
    [Documentation]  Megnézzük, hogy az új gomb megjelenik-e az oldalon.
    Check the new button visiable on the page

Test the reset button visiable on the page
    [Documentation]  Megnézi, hogy a visszaállít gomb megjelenik-e az oldalon.
    Check the reset button visiable on the page

Test the Venue name appear on the table on the venues page
    [Documentation]  Megnézi, hogy a táblában a venue név megfelelően jelenik-e meg.
    sleep  3s
    Check the all venues name appear and length is correct

Test the Venue address appear on the table on the venues page
    [Documentation]  Megnézi, hogy a táblában a venu address megfelelően jelenik-e meg.
    sleep  3s
    Check the all venues address appear and length is correct

Test the all edit icon apper in the venues page
    [Documentation]  Megnézzük, hogy az összes szerkesztés icon megjelenik-e.
    Check the all edit icon appear in the page

Test the all eyes icon apper in the venues page
    [Documentation]  Megnézzük, hogy az összes megtekintés icon megjelenik-e.
    Check the all edit icon appear in the page

Test the deleted icon not appear in the venues page
    [Documentation]  Megnézzük, hogy a törlés ikon nem jelenik meg az oldalon.
    Check the delete icon not appear in tha page

Test the default order in the venues page
    [Documentation]  Megnézzük, hogy a megfelelően jelennek-e meg az elemek.
                ...  rendezés ABC szerint sorrendben az oldalon.
    Check the default order on the venues page