*** Settings ***
Library  SeleniumLibrary
Library  Collections

*** Variables ***
${BEFORE_ICON_TEXT_ID} =  xpath=//*[@class="box-title"]/*[@class="material-icons"]
${FULL_ICON_TEXT_ID} =  xpath=//*[@class="box-title"]
${PO_COMMON_INPUT_ERROR_ID} =  xpath=//app-show-errors/ul/li
${PO_COMMON_SAVE_BUTTON} =  xpath=//*[@class="button success"]
${PO_COMMON_RADIO_LABEL_ID} =  //*[@class="mat-radio-label-content"]

*** Keywords ***
Check the input error not visible on the page
    [Documentation]  Ellenőrzi, hogy az input mezőkre vonatkozó hibaüzenet nem látható
                ...  az oldalon.
    element should not be visible  ${PO_COMMON_INPUT_ERROR_ID}

Click the save button on the page
    [Documentation]  Megnyomja a mentés gombot.
    click element  ${PO_COMMON_SAVE_BUTTON}

Wait until input error visible
    [Documentation]  Megvájra amíg az oldalon megjelenik az inputnál a hibaüzenet.
    wait until element is visible  ${PO_COMMON_INPUT_ERROR_ID}

Get first icon item
    ${elem1} =  SeleniumLibrary.Get WebElement  ${BEFORE_ICON_TEXT_ID}
    [Return]  ${elem1}

Get second icon item
    @{elem} =  SeleniumLibrary.Get WebElements  ${BEFORE_ICON_TEXT_ID}
    ${egye_elem} =  get from list  ${elem}  1
    [Return]  ${egye_elem}

Get first full icon item
    ${elem2} =  SeleniumLibrary.Get WebElement  ${FULL_ICON_TEXT_ID}
    [Return]  ${elem2}

Get second full icon item
    @{elem} =  SeleniumLibrary.Get WebElements  ${FULL_ICON_TEXT_ID}
    ${egye_elem} =  get from list  ${elem}  1
    [Return]  ${egye_elem}

Get common icon item
    [Arguments]  ${index}
    @{elem} =  SeleniumLibrary.Get WebElements  ${BEFORE_ICON_TEXT_ID}
    ${egye_elem} =  get from list  ${elem}  ${index}
    [Return]  ${egye_elem}

Get common full icon item
    [Arguments]  ${index}
    @{elem} =  SeleniumLibrary.Get WebElements  ${FULL_ICON_TEXT_ID}
    ${egye_elem} =  get from list  ${elem}  ${index}
    [Return]  ${egye_elem}