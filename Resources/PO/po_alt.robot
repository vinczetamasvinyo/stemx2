*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${PO_ALT_EYE_ICON} =  xpath=//*[@class="material-icons action-primary"]
${PO_ALT_EDIT_ICON} =  xpath=//*[@class="material-icons edit-primary"]
${PO_ALT_DELETE_ICON} =  xpath=//*[@class="material-icons delete-primary"]
${PO_ALT_SOR} =  xpath=//mat-row
${PO_PARTNERS_ICON_WAITING_FOR_CONFIRMATION} =  xpath=//*[@class="material-icons status-icon waiting-for-confirmation"]
${PO_PARTNERS_ICON_ACTIVE} =  xpath=//*[@class="material-icons status-icon public"]
${PO_PARTNERS_ICON_DRAFT} =  xpath=//*[@class="material-icons status-icon draft"]

*** Keywords ***
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

Get the draft icon
    ${db} =  get element count  ${PO_PARTNERS_ICON_DRAFT}
    [Return]  ${db}

Get the waiting icon
    ${db} =  get element count  ${PO_PARTNERS_ICON_WAITING_FOR_CONFIRMATION}
    [Return]  ${db}

Get the active icon
    ${db} =  get element count  ${PO_PARTNERS_ICON_ACTIVE}
    [Return]  ${db}