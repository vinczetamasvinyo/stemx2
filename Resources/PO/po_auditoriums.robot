*** Settings ***
Library  SeleniumLibrary
Resource  po_alt.robot
Resource  ../Common_resource.robot

*** Variables ***
${PO_AUDITORIUMS_SEARCH_INPUT_ID} =  xpath=//input[@formcontrolname="searchText"]
${PO_AUDITORIUMS_SHOW_DELETED_CHECKBOX} =  xpath=//input[@class="mat-checkbox-input cdk-visually-hidden"]
${PO_AUDITORIUMS_SHOW_DELETED_CHECKBOX2}=  xpath=//*[@formcontrolname="showDeleted"]
${PO_AUDITORIUMS_TITLE_TEXT_ID} =  xpath=//*[@class="page-content"]//h1
${PO_AUDITORIUMS_LABEL_ID} =  xpath=//label
${PO_AUDITORIUMS_NEW_BUTTON_ID} =  xpath=//new-button
${PO_AUDITORIUMS_NEW_BUTTON_TEXT_ID} =  xpath=//new-button//span
${PO_AUDITORIUMS_RESET_BUTTON_ID} =  xpath=//reset-button
${PO_AUDITORIUMS_RESET_BUTTON_TEXT_ID} =  xpath=//reset-button//span
${PO_AUDITORIUMS_SEARCH_BUTTON_ID} =  xpath=//search-button
${PO_AUDITORIUMS_SEARCH_BUTTON_TEXT_ID} =  xpath=//search-button//span
${PO_AUDITORIUMS_TABLE_HEADER1_TEXT_ID} =  xpath=//mat-header-cell[1]//*[@class="mat-sort-header-button"]
${PO_AUDITORIUMS_TABLE_HEADER2_TEXT_ID} =  xpath=//mat-header-cell[2]//*[@class="mat-sort-header-button"]
${PO_AUDITORIUMS_TABLE_HEADER3_TEXT_ID} =  xpath=//mat-header-cell[3]
${PO_AUDITORIUMS_TABLE_HEADER4_TEXT_ID} =  xpath=//mat-header-cell[4]
${PO_AUDITORIUMS_AUDITS_NAME_ADDRESS_ID} =  xpath=//mat-cell[1]
${PO_AUDITORIUMS_AUDITS_PLACE_NAME_ADDRESS_ID} =  xpath=//mat-cell[2]

*** Keywords ***
Wait the auditoriums page loaded
    [Documentation]  Megvárja amíg a nézőterek oldal betöltődik.
    wait until element is visible  ${PO_AUDITORIUMS_SEARCH_INPUT_ID}
    sleep  1s

Check the input text visible on the auditoriums page
    [Documentation]  Megnézi, hogy a Keresés input mező látható-e.
    element should be visible  ${PO_AUDITORIUMS_SEARCH_INPUT_ID}

Check the show deleted checkbox visible on the auditorium page
    [Documentation]  Megnézi, hogy törölt elemek mutatás checkbox megjelenik-e az oldalon.
    element should be visible  ${PO_AUDITORIUMS_SHOW_DELETED_CHECKBOX}

Check the checkbox is not select on th auditorium page
    [Documentation]  Megnézi, hogy alaphelyzetben a checkbox nincs bepipálva.
    Check checkbox value  ${PO_AUDITORIUMS_SHOW_DELETED_CHECKBOX}  false

Check the new auditorium button is visiable
    [Documentation]  Megnézi, hogy az új gomb megjelenik-e.
    element should be visible  ${PO_AUDITORIUMS_NEW_BUTTON_ID}

Check the reset button is visiable
    [Documentation]  Megnézi, hogy az visszaállít gomb megjelenik-e.
    element should be visible  ${PO_AUDITORIUMS_RESET_BUTTON_ID}

Check the search button is visiable
    [Documentation]  Megnézi, hogy az visszaállít gomb megjelenik-e.
    element should be visible  ${PO_AUDITORIUMS_SEARCH_BUTTON_ID}

Get all audits name from the audits page
    [Documentation]  Visszaadja az audits page oldalról az összes nézőtér nevét
    @{lista} =  Get list from items2  ${True}  ${PO_AUDITORIUMS_AUDITS_NAME_ADDRESS_ID}  \n  0
    [Return]  ${lista}

Get all audits address from the audits page
    [Documentation]  Visszaadja az audits page oldalról az összes nézőtér nevét
    @{lista} =  Get list from items2  ${True}  ${PO_AUDITORIUMS_AUDITS_NAME_ADDRESS_ID}  \n  1
    [Return]  ${lista}

Get all audits place name from the audits page
    [Documentation]  Visszaadja az audits page oldalról az összes nézőtér nevét
    @{lista} =  Get list from items2  ${True}  ${PO_AUDITORIUMS_AUDITS_PLACE_NAME_ADDRESS_ID}  \n  0
    [Return]  ${lista}

Get all audits place address from the audits page
    [Documentation]  Visszaadja az audits page oldalról az összes nézőtér nevét
    @{lista} =  Get list from items2  ${True}  ${PO_AUDITORIUMS_AUDITS_PLACE_NAME_ADDRESS_ID}  \n  1
    [Return]  ${lista}

Click the show deleted checkbox
    click element  ${PO_AUDITORIUMS_SHOW_DELETED_CHECKBOX2}

Click the search button
    click element  ${PO_AUDITORIUMS_SEARCH_BUTTON_ID}