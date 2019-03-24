*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${PO_PARTNERS_INIVETE_BUTTON_TEXT_ID} =  //app-button[@id="invite_partner"]//*[@class="ng-star-inserted"]
${PO_PARTNERS_INIVETE_BUTTON_ID} =  id=invite_partner
${PO_PARTNERS_COMMON_ERROR_ID} =  xpath=//app-show-errors/ul/li
${PO_PARTNERS_FIRSTNAME_INPUT_ID} =  xpath=//input[@formcontrolname="firstName"]
${PO_PARTNERS_LASTNAME_INPUT_ID} =  xpath=//input[@formcontrolname="lastName"]

*** Keywords ***

Get the text of invite partner button
    [Documentation]  Visszaadja a partner meghívása gomb szövegét.
    ${szoveg} =  get text  ${PO_PARTNERS_INIVETE_BUTTON_TEXT_ID}
    [Return]  ${szoveg}

Click invite button
    click element  ${PO_PARTNERS_INIVETE_BUTTON_ID}

Check the Error message not visiable
    element should not be visible  ${PO_PARTNERS_COMMON_ERROR_ID}

Give the firstname
    [Documentation]  Megadjuk a first nevet a partner meghívása oldalon.
    [Arguments]  ${firstname}
    input text  ${PO_PARTNERS_FIRSTNAME_INPUT_ID}  ${firstname}

Give the lastname
    [Documentation]  Megadjuk a lastname-t a partner meghívása oldalon.
    [Arguments]  ${lastname}
    INPUT TEXT  ${PO_PARTNERS_LASTNAME_INPUT_ID}  ${lastname}

Wait the error message is visible
    [Documentation]  Megvárjuk míg megjelenik az error message
    #wait until element is visible  xpath=//app-show-errors/ul/li
    wait until element is visible  ${PO_PARTNERS_COMMON_ERROR_ID}

Check the error message visiable
    [Documentation]  Megnézzük, hogy az error message továbbra is látható-e.
    # element should be visible  xpath=//app-show-errors/ul/li
    element should be visible  ${PO_PARTNERS_COMMON_ERROR_ID}

Get the error message text
    [Documentation]  Megadja az error message hibaüzenetét.
    ${szoveg} =  get text  ${PO_PARTNERS_COMMON_ERROR_ID}
    [Return]  ${szoveg}

Check the first name field visiable on the page
    [Documentation]  Megnézi, hogy a keresztnév megjelenik-e az oldalon.
    wait until element is visible  ${PO_PARTNERS_FIRSTNAME_INPUT_ID}