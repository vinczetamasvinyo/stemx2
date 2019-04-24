*** Settings ***
Resource  ../Common.robot
Resource  po_userprofile.robot

*** Variables ***
${PO_PAGE_NAVIGATE_LISTBOX} =  xpath=//*[@class="mat-form-field-infix"]/mat-select
${PO_PAGE_NAVIGATE_LISTBOX_PANEL} =  xpath=//*[contains(@class,'mat-select-panel')]
${PO_PAGE_NAVIGATE_LISTBOX_CLASS} =  aria-owns

*** Keywords ***
Elem kivalasztasa
    [Arguments]  ${item}
    scroll to element  ${PO_PAGE_NAVIGATE_LISTBOX}  100
    click element  ${PO_PAGE_NAVIGATE_LISTBOX}
    wait until element is visible  ${PO_PAGE_NAVIGATE_LISTBOX_PANEL}
    ${el} =  Get listbox item xpath  ${item}  ${PO_PAGE_NAVIGATE_LISTBOX}  ${PO_PAGE_NAVIGATE_LISTBOX_CLASS}
    click element  ${el}