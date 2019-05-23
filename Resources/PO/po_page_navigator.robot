*** Settings ***
Resource  ../Common.robot
Resource  po_userprofile.robot

*** Variables ***
${PO_PAGE_NAVIGATE_LISTBOX} =  xpath=//*[@class="mat-form-field-infix"]/mat-select
${PO_PAGE_NAVIGATE_LISTBOX_PANEL} =  xpath=//*[contains(@class,'mat-select-panel')]
${PO_PAGE_NAVIGATE_LISTBOX_CLASS} =  aria-owns
${PO_PAGE_NAVIGATE_ITEM_COUNT_ID} =  xpath=//*[@class="mat-paginator-range-label"]
${PO_PAGE_NAVIGATE_FIRST_PAGE} =  xpath=//*[contains(@class,'mat-paginator-navigation-first')]
${PO_PAGE_NAVIGATE_LAST_PAGE} =  xpath=//*[contains(@class,'mat-paginator-navigation-last')]
${PO_PAGE_NAVIGATE_PREVIOUS} =  xpath=//*[contains(@class,'mat-paginator-navigation-previous')]
${PO_PAGE_NAVIGATE_NEXT} =  xpath=//*[contains(@class,'mat-paginator-navigation-next')]
${PO_PAGE_NAVIGATE_ACTIVE_OR_DISABLE} =  ng-reflect-disabled

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
    Waiting the page loaded finish

Get the items max count
    [Documentation]  Az adott oldalról visszaadja a max elemszámot.
    ${elemek} =  get text  ${PO_PAGE_NAVIGATE_ITEM_COUNT_ID}
    ${hely} =  get string positon  ${elemek}  /
    ${hely2} =  evaluate  ${hely}+1
    ${darabszam} =  robot.libraries.String.Get Substring  ${elemek}  ${hely2}
    [Return]  ${darabszam}

Get the items firs count
    ${elemek} =  get text  ${PO_PAGE_NAVIGATE_ITEM_COUNT_ID}
    ${hely} =  get string positon  ${elemek}  -
    ${hely2} =  evaluate  ${hely}-1
    ${dbszam} =  robot.libraries.String.Get Substring  ${elemek}  0  ${hely2}
    [Return]  ${dbszam}

Get the items last count
    ${elemek} =  get text  ${PO_PAGE_NAVIGATE_ITEM_COUNT_ID}
    ${hely} =  get string positon  ${elemek}  -
    ${hely2} =  evaluate  ${hely}+2
    ${hely3} =  get string positon  ${elemek}  /
    ${hely4} =  evaluate  ${hely3}-1
    ${dbszam} =  robot.libraries.String.Get Substring  ${elemek}  ${hely2}  ${hely4}
    [Return]  ${dbszam}

Click the navigation first
    click element  ${PO_PAGE_NAVIGATE_FIRST_PAGE}

Click the navigation last
    click element  ${PO_PAGE_NAVIGATE_LAST_PAGE}

Click the navigation previous
    click element  ${PO_PAGE_NAVIGATE_PREVIOUS}

Click the navigation next
    click element  ${PO_PAGE_NAVIGATE_NEXT}

Check the navigation first not active
    ${value} =  get element attribute  ${PO_PAGE_NAVIGATE_FIRST_PAGE}  ng-reflect-disabled
    should be equal as strings  ${value}  true

Check the navigation first active
    ${value} =  get element attribute  ${PO_PAGE_NAVIGATE_FIRST_PAGE}  ${PO_PAGE_NAVIGATE_ACTIVE_OR_DISABLE}
    should be equal as strings  ${value}  false

Check the navigation previous not active
    ${value} =  get element attribute  ${PO_PAGE_NAVIGATE_PREVIOUS}    ${PO_PAGE_NAVIGATE_ACTIVE_OR_DISABLE}
    should be equal as strings  ${value}  true

Check the navigation previous active
    ${value} =  get element attribute  ${PO_PAGE_NAVIGATE_PREVIOUS}  ${PO_PAGE_NAVIGATE_ACTIVE_OR_DISABLE}
    should be equal as strings  ${value}  false

Check the navigation next not active
    ${value} =  get element attribute  ${PO_PAGE_NAVIGATE_NEXT}  ${PO_PAGE_NAVIGATE_ACTIVE_OR_DISABLE}
    should be equal as strings  ${value}  true

Check the navigation next active
    ${value} =  get element attribute  ${PO_PAGE_NAVIGATE_NEXT}  ${PO_PAGE_NAVIGATE_ACTIVE_OR_DISABLE}
    should be equal as strings  ${value}  false

Check the navigation last not active
    ${value} =  get element attribute  ${PO_PAGE_NAVIGATE_LAST_PAGE}  ${PO_PAGE_NAVIGATE_ACTIVE_OR_DISABLE}
    should be equal as strings  ${value}  true

Check the navigation last active
    ${value} =  get element attribute  ${PO_PAGE_NAVIGATE_LAST_PAGE}  ${PO_PAGE_NAVIGATE_ACTIVE_OR_DISABLE}
    should be equal as strings  ${value}  false