*** Settings ***
Resource  ../Common.robot
Resource  po_userprofile.robot

*** Variables ***
${PO_PAGE_NAVIGATE_LISTBOX} =  xpath=//*[@class="mat-form-field-infix"]/mat-select
${PO_PAGE_NAVIGATE_LISTBOX_PANEL} =  xpath=//*[contains(@class,'mat-select-panel')]
${PO_PAGE_NAVIGATE_LISTBOX_CLASS} =  aria-owns
${PO_PAGE_NAVIGATE_ITEM_COUNT_ID} =  xpath=//*[@class="mat-paginator-range-label"]

*** Keywords ***
Elem kivalasztasa
    [Arguments]  ${item}
    scroll to element  ${PO_PAGE_NAVIGATE_LISTBOX}  100
    click element  ${PO_PAGE_NAVIGATE_LISTBOX}
    wait until element is visible  ${PO_PAGE_NAVIGATE_LISTBOX_PANEL}
    ${el} =  Common_resource.Get listbox item xpath  ${item}  ${PO_PAGE_NAVIGATE_LISTBOX}  ${PO_PAGE_NAVIGATE_LISTBOX_CLASS}
    click element  ${el}

scroll page
    [Arguments]  ${item}
    Elem kivalasztasa  ${item}
    sleep  4s

Get the items max count
    [Documentation]  Az adott oldalról visszaadja a max elemszámot.
    ${elemek} =  get text  ${PO_PAGE_NAVIGATE_ITEM_COUNT_ID}
    ${hely} =  get string positon  ${elemek}  /
    ${hely2} =  evaluate  ${hely}+1
    ${darabszam} =  robot.libraries.String.Get Substring  ${elemek}  ${hely2}
    [Return]  ${darabszam}