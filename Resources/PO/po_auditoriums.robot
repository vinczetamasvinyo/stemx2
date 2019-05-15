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
${PO_AUDITORIUMS_RESET_ICON_ID} =  .//*[@class="material-icons face-primary"]
${PO_AUDITORIUMS_DELETE_ICON_ID} =  .//*[@class="material-icons edit-primary"]
${PO_AUDITORIUMS_TABLE_HEADER3} =  xpath=//mat-header-cell[3]
${PO_AUDITORIUMS_SEARCH_INPUT_INDEX} =  0
${PO_AUDITORIUMS_INPUT_ID} =  //label
${PO_AUDITORIUMS_AUDIT_DETAILS_TITTLE} =  //*[@class="page-content"]//h1
${PO_AUDITORIUMS_AUDIT_DETAILS_SUB_TITTLE} =  //*[@class="page-content"]//h2
${PO_AUDITORIUMS_AUDIT_DETAILS_CANCEL_BUTTON_TEXT_ID} =  //cancel-button//span
${PO_AUDITORIUMS_AUDIT_DETAILS_DELETE_BUTTON_TEXT_ID} =  //delete-button//span
${PO_AUDITORIUMS_AUDIT_DETAILS_EDIT_BUTTON_TEXT_ID} =  //app-button//span


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

Check the checkbox is select on th auditorium page
    [Documentation]  Megnézi, hogy alaphelyzetben a checkbox nincs bepipálva.
    Check checkbox value  ${PO_AUDITORIUMS_SHOW_DELETED_CHECKBOX}  true


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
    [Documentation]  Belekattint a törölt nézőterek mutatása checkbox-ba.
    click element  ${PO_AUDITORIUMS_SHOW_DELETED_CHECKBOX2}

Click the search button
    click element  ${PO_AUDITORIUMS_SEARCH_BUTTON_ID}

Check the reset icon appear in the deleted auditoriums row
    [Documentation]  Megnézi, hogy a kapott listában törölt nézőterek
                ...  megjelenik a visszaállít ikon.
    [Arguments]  ${lista}
    Check the item appear in the row  ${lista}  ${PO_AUDITORIUMS_RESET_ICON_ID}

Check the edit icon not appear in deleted auditoriums row
    [Documentation]  Megnézi, hogy a kapott listában a törölt nézőtereknél
    ...  nem jelenik meg a szerkesztés gomb.
    [Arguments]  ${lista}
    Check the item not apper in the row  ${lista}  ${PO_AUDITORIUMS_DELETE_ICON_ID}

Check the delete icon not appear in deleted auditoriums row
    [Documentation]  Megnézi, hogy a kapott listában a törölt nézőtereknél
    ...  nem jelenik meg a szerkesztés gomb.
    [Arguments]  ${lista}
    Check the item not apper in the row  ${lista}  ${PO_AUDITORIUMS_DELETE_ICON_ID}

Click the header row3 on the auditorium page
    click element  ${PO_AUDITORIUMS_TABLE_HEADER3}

Check error not apper the search fields on the auditorium page
    [Documentation]  Megnézi, hogy a beazonosított elemben nem jelenik meg hibaüzenet.
    Check error message not apper on the object  ${PO_AUDITORIUMS_INPUT_ID}  ${PO_AUDITORIUMS_SEARCH_INPUT_INDEX}

Check the error message appear on the search fields ont the auditorium page
    [Documentation]  Megnézi, hogy a beazonosított elemnél a megfelelő hibaüzenet megjelenik-e.
    [Arguments]  ${error_text}
    Check error message on the object  ${PO_AUDITORIUMS_INPUT_ID}  ${PO_AUDITORIUMS_SEARCH_INPUT_INDEX}  ${error_text}

Waiting the details of auditorium loaded
    [Documentation]  Megvárja amíg a nézőtér adatai oldal betöltődik
    wait until element is visible  //cancel-button

Get the venue name from the audits details page
    [Documentation]  A nézőtér részletei oldalról visszaadja a Venue nevét.
    ${teljes_adat} =  Get common value from the page  3
    ${venue_name} =  cut string   ${teljes_adat}  \n  0
    [Return]  ${venue_name}

Get the venue address from the audits details page
    [Documentation]  A nézőtér részletei oldalról visszaadja a Venue címét.
    ${teljes_adat} =  Get common value from the page  3
    ${venue_name} =  cut string   ${teljes_adat}  \n  1
    [Return]  ${venue_name}


Get the audits name from the audits details page
    [Documentation]  A nézőtér részletei oldalról visszaadja az audit nevét
    ${name} =  Get common value from the page  0
    [Return]  ${name}

Get the audits address from the audits details page
    [Documentation]  A nézőtér részletei oldalról visszaadja az audit címét.
    ${auditaddress} =  Get common value from the page  1
    [Return]  ${auditaddress}

Get the audits capacity from the audits details page
    [Documentation]  A nézőtér részletei oldalról visszaadja a nézőtér capacitását.
    ${capacity} =  Get common value from the page  2
    [Return]  ${capacity}