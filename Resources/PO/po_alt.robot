*** Settings ***
Library  SeleniumLibrary
Library  Collections

*** Variables ***
${PO_ALT_EYE_ICON} =  xpath=//*[@class="material-icons action-primary"]
${PO_ALT_EDIT_ICON} =  xpath=//*[@class="material-icons edit-primary"]
${PO_ALT_DELETE_ICON} =  xpath=//*[@class="material-icons delete-primary"]
${PO_ALT_SOR} =  xpath=//mat-row
${PO_PARTNERS_ICON_WAITING_FOR_CONFIRMATION} =  xpath=//*[@class="material-icons status-icon waiting-for-confirmation"]
${PO_PARTNERS_ICON_ACTIVE} =  xpath=//*[@class="material-icons status-icon public"]
${PO_PARTNERS_ICON_DRAFT} =  xpath=//*[@class="material-icons status-icon draft"]
${PO_RESTOR_ICON_ID} =  xpath=//*[@class="material-icons face-primary"]
${PO_DELETED_ROW_ID} =  xpath=//mat-row[contains(@class,'row-deleted')]
${PO_ACTIVE_ROW_ID} =  xpath=//mat-row[@class="mat-row ng-tns-c10-15 ng-star-inserted"]
${PO_NEW_BUTTON_ID} =  xpath=//new-button
${PO_NEW_BUTTON_TEXT_ID} =  xpath=//new-button//span
${PO_SAVE_BUTTON_ID} =  xpath=//save-button
${PO_ALT_SEARCH_BUTTON_ID} =  xpath=//search-button
${PO_ALT_SEARCH_BUTTON_TEXT_ID} =  xpath=//search-button//span
${PO_ALT_RESET_BUTTON_ID} =  xpath=//reset-button
${PO_ALT_RESET_BUTTON_TEXT_ID} =  xpath=//reset-button//span
${PO_ALT_INPUT_VALUE_ID} =  xpath=//*[@class="lead"]
${PO_ALT_PAGE_HEADER_TITTLE_ID} =  xpath=//*[@class="page-content"]//h1
${PO_ALT_LABEL_ID} =  xpath=//label
${PO_ALT_TABLE_HEADER_BUTTON_TEXT_ID} =  xpath=//*[@class="mat-sort-header-button"]
${PO_ALT_TABLE_HEADER_TEXT_ID} =  xpath=//mat-header-cell
${PO_ALT_PAGE_SCHROOL_LISTBOX_ID} =  //*[@class="mat-form-field-infix"]/mat-select
${PO_ALT_PAGE_SCHROOL_CLASS_ID} =  aria-owns
${PO_ALT_PAGE_SEARCH_INPUT_ID} =  xpath=//input[@formcontrolname="searchText"]

*** Keywords ***
Get the all eyes from the page
    [Documentation]  Visszaadja egy listában a szemek objektumot
    @{lista} =  SeleniumLibrary.Get WebElements  ${PO_ALT_EYE_ICON}
    [Return]  ${lista}

Get the eyes count
    [Documentation]  Visszaadja a szemek darabszámát.
    ${db} =  get element count  ${PO_ALT_EYE_ICON}
    [Return]  ${db}

Get the edit count
    [Documentation]  Visszaadja a szerkesztes ikonok számát.
    ${db} =  get element count  ${PO_ALT_EDIT_ICON}
    [Return]  ${db}

Get the Delete count
    [Documentation]  Visszaadja a törlés ikonok számát.
    ${db} =  get element count  ${PO_ALT_DELETE_ICON}
    [Return]  ${db}

Get the row count
    [Documentation]  Visszaadja a sorok számát az oldalon.
    ${db} =  get element count  ${PO_ALT_SOR}
    [Return]  ${db}

Get the deleted row count
    [Documentation]  Visszaadja a törölt sorok számát
    ${db} =  get element count  ${PO_DELETED_ROW_ID}
    [Return]  ${db}

Get all deleted row
    [Documentation]  Visszaadja a törölt sorokat egy listában
    @{elemek} =  SeleniumLibrary.Get WebElements  ${PO_DELETED_ROW_ID}
    [Return]  ${elemek}

Get all active row
    [Documentation]  Visszaadja a törölt sorokat egy listában
    @{elemek} =  SeleniumLibrary.Get WebElements  ${PO_ACTIVE_ROW_ID}
    [Return]  ${elemek}

Get the active row count
    [Documentation]  Visszaadja az aktív sorok számát
    ${db} =  get element count  ${PO_ACTIVE_ROW_ID}
    [Return]  ${db}

Get the restore icon count
    [Documentation]  Visszaadja az visszaállít ikonok számát
    ${db} =  get element count  ${PO_RESTOR_ICON_ID}
    [Return]  ${db}

Get the draft icon
    ${db} =  get element count  ${PO_PARTNERS_ICON_DRAFT}
    [Return]  ${db}

Get the waiting icon
    ${db} =  get element count  ${PO_PARTNERS_ICON_WAITING_FOR_CONFIRMATION}
    [Return]  ${db}

Get the active icon
    ${db} =  get element count  ${PO_PARTNERS_ICON_ACTIVE}
    [Return]  ${db}

Get checkbox value
    [Documentation]  Lerkédezi egy checkbox állapotást
    [Arguments]  ${path}
    ${ertek} =  get element attribute  ${path}  aria-checked
    [Return]  ${ertek}

Check checkbox value
    [Documentation]  Leellenőrzi a checkbox értékét.
    [Arguments]  ${path}  ${value}
    ${ertek} =  Get checkbox value  ${path}
    #${ertek} =  get element attribute  ${path}  aria-checked
    should be equal  ${value}  ${ertek}

Check the deleted row not visiable
    [Documentation]  Megnézi, hogy a törölt sor nem jelenik meg az oldalon.
    element should not be visible  ${PO_DELETED_ROW_ID}

Wait until the deleted row visible
    wait until element is visible  ${PO_DELETED_ROW_ID}
    sleep  1s

Check the restor icon not visibel on the page
    [Documentation]  Megnézi, hogy a visszaállít ikon nem jelenik meg az oldalon.
     element should not be visible  ${PO_RESTOR_ICON_ID}

Click the new button
    [Documentation]  Az új létrehozása gombra kattint.
    click element  ${PO_NEW_BUTTON_ID}

Click the save button
    [Documentation]  Megnyomja a mentés gombot.
    click element  ${PO_SAVE_BUTTON_ID}

Click the search button
    [Documentation]  Megnyomja a keresés gombot.
    click element  ${PO_ALT_SEARCH_BUTTON_ID}

Click the reset button
    [Documentation]
    click element  ${PO_ALT_RESET_BUTTON_ID}

Get common value from the page
    [Documentation]  Az olaláról visszaadja a megadott elem(input mező) értékét.
    [Arguments]  ${index}
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_ALT_INPUT_VALUE_ID}
    ${egye_elem} =  get from list  ${elem}  ${index}
    ${szoveg} =  get text  ${egye_elem}
    Log  ${szoveg}
    [Return]  ${szoveg}

Check the search input field visiable on the page
    [Documentation]  Megnézi, hogy a keresési mező megjelenik-e.
    element should be visible  ${PO_ALT_PAGE_SEARCH_INPUT_ID}

Check the reset button visiable on the page
    [Documentation]  Megnézi, hogy a visszaállít gomb megjelenik-e.
    element should be visible  ${PO_ALT_RESET_BUTTON_ID}

Check the search button visiable on the page
     [Documentation]  Megnézi, hogy a kereső gomb megjelenik-e az oldalon
     element should be visible  ${PO_ALT_SEARCH_BUTTON_ID}

Check the new button visiable on the page
    [Documentation]  Megnézi, hogy az új gomb megjelenik-e az oldalon.
    element should be visible  ${PO_NEW_BUTTON_ID}

Give the search value
    [Documentation]  Megadja a keresési mezőbe az értéket.
    [Arguments]  ${text}
    input text  ${PO_ALT_PAGE_SEARCH_INPUT_ID}  ${text}

Get value of the search input
    [Documentation]  Visszaadja a serach mezőben lévő értéket
    ${szoveg} =  get value  ${PO_ALT_PAGE_SEARCH_INPUT_ID}
    [Return]  ${szoveg}