*** Settings ***
Resource  ../../../../Resources/auditoriums_resource.robot

Suite Setup  Open browser and login and after go to the auditoriums page  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
#Suite Teardown  Common.End web test


*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}  language=${LAN}
${LAN}=  En

*** Test Cases ***
Test the search input visiable
    [Documentation]  A teszt során megnézzük, hogy a keresés mező megjelenik-e.
    Check the input text visible on the auditoriums page

Test the show deleted checkbox is visiable
    [Documentation]  A teszt során megnézzük, hogy a törölt elemek mutatására
                ...  szolgáló checkbox megjelenik-e.
    Check the show deleted checkbox visible on the auditorium page

Test the show deleted checkbox default value
    [Documentation]  Megnézzük, hogy a checkbox alapból nincs bepipálva.
    Check the checkbox is not select on th auditorium page

Test the new auditorium button visible on the page
    [Documentation]  Megnézi, hogy az új auditorium gomb megjelenik-e.
    Check the new auditorium button is visiable

Test the reset button visiabale on the auditorium page
    [Documentation]  Megnézi, hogy a visszaállít gomb megjelenik-e.
    Check the reset button is visiable

Test the search button visiable on the auditorium page
    [Documentation]  Megnézi, hogy a keresés gomb megjelenik-e az oldalon.
    Check the search button is visiable

Test the view icon appear on the auditorium page
    [Documentation]  Megnézi, hogy a megtekintés ikon megfelelő
                ...  számban megjelenik-e az odalon.
    Check the search button is visiable

Test the edit button appear on the auditorium page
    [Documentation]  Megnézi, hogy a szerkesztés gomb megjelenik-e
                ...  a nézőtér oldalon. A számát is ellenőrzi.
    Check the all edit icon appear in the page

Test the all delete button appear on the page
    [Documentation]  Megnézi, hogy a törlés gomb megjelenik-e a nézőtér oldalon.
    Check the all delete icon appear in the page

Test the deleted auditoriums not visiable on the page
    [Documentation]  Megnézi, hogy törölt sor nem jelenik meg az oldalon.
    Check the deleted row not visiable

Test the restor button not visibable on the page
    [Documentation]  Megnézi, hogy visszaállít ikon nem jelenik meg az oldalon.
    Check the restor icon not visibel on the page

Test the all audits name visible on the page
    [Documentation]  Megnézi, hogy az összes nézőtér név megfelelően megjelenik-e.
    Check the all audits name appear and length

Test the all audits address visible on the page
    [Documentation]  Megnézi, hogy az összes nézőtér cím megfelelően megjelenik-e.
    Check the all audits address appear and length is correct

Test the all palce name visible on the page
    [Documentation]  Megnézi, hogy az összes helyszín name megfelelően jelenik-e meg.
    Check the all palce name appear and length is correct

Test the all palce address visible on the page
    [Documentation]  Megnézi, hogy az összes helyszín címe megfelelően jelenik-e meg.
    Check the all palce address appear and length is correct

Test the default order is correct on the audits page
    [Documentation]  Megnézi, hogy a default rendezés szerint jelenik-e meg a nézőtér lista.
    Check the default odder on the audits page

Test the deleted auditoriums
    [Documentation]  Megnézi, hogy a törölt
    ${ck} =  Get checkbox value  xpath=//input[@class="mat-checkbox-input cdk-visually-hidden"]
    run keyword if  "${ck}" == "true"  reload the auditorium
    Click the show deleted checkbox
    po_auditoriums.Click the search button
    run keyword and ignore error  Wait until the deleted row visible
    ${deleted} =  Get the deleted row count
    log  ${deleted}
    should be true  ${deleted} > 0
    # Check
    @{lista} =  Get all deleted row
    #:FOR  ${elem}  IN  @{lista}
    #\  ${vane}  ${elemertek} =  check_the_elem_contain_in_parent2  ${elem}  .//*[@class="material-icons face-primary"]
    #\  should be true  ${vane}==${True}


*** Keywords ***
reload the auditorium
    reload page
    Wait the auditoriums page loaded

Check the elem appear in the row
    [Documentation]  Megnézi, hogy a paraméterként megadott elem megjelenik-e az adott listában.
    [Arguments]  ${lista}  ${path}
    :FOR  ${elem}  IN  @{lista}
    \  ${vane}  ${elemertek} =  check_the_elem_contain_in_parent2  ${elem}  ${path}
    \  should be true  ${vane}==${True}