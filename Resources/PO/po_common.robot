*** Settings ***
Library  SeleniumLibrary
Library  Collections

*** Variables ***
${BEFORE_ICON_TEXT_ID} =  xpath=//*[@class="box-title"]/*[@class="material-icons"]
${FULL_ICON_TEXT_ID} =  xpath=//*[@class="box-title"]

*** Keywords ***
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