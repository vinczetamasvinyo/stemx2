*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  ../../ExternalResources/mylibrary.py

*** Variables ***
${PO_PARTNERS_INIVETE_BUTTON_TEXT_ID} =  //app-button[@id="invite_partner"]//*[@class="ng-star-inserted"]
${PO_PARTNERS_INIVETE_BUTTON_ID} =  id=invite_partner
${PO_PARTNERS_COMMON_ERROR_ID} =  xpath=//app-show-errors/ul/li
${PO_PARTNERS_COMMON_ERROR_ID2} =  .//app-show-errors/ul/li
${PO_PARTNERS_FIRSTNAME_INPUT_ID} =  xpath=//input[@formcontrolname="firstName"]
${PO_PARTNERS_LASTNAME_INPUT_ID} =  xpath=//input[@formcontrolname="lastName"]
${PO_PARTNERS_COMPANYNAME_INPUT_ID} =  xpath=//input[@formcontrolname="companyName"]
${PO_PARTNERS_DIV_ID_OF_INPUT} =  //div[@class="columns small-12 medium-6"]
${PO_PARTNERS_CEG_DIV_LIST_ID} =  2
${PO_PARTNERS_CIM_ID} =  xpath=//*[@class="row"]/div/h1
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

Give the name of company
    [Documentation]  Megadjuk a cégnevet a partner meghívása oldalon.
    [Arguments]  ${cegnev}
    input text  ${PO_PARTNERS_COMPANYNAME_INPUT_ID}  ${cegnev}

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

Get the all div element of input from partner page
    [Documentation]  Visszaadja az összes div eleme
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_PARTNERS_DIV_ID_OF_INPUT}
    [Return]  @{elem}

Get the company div object
    [Documentation]  A megkapott elemek listából visszaadja a cég div részét
    [Arguments]  ${elemek}
    ${ceg} =  Get From List  ${elemek}  ${PO_PARTNERS_CEG_DIV_LIST_ID}
    [Return]  ${ceg}

Check the error message
    [Arguments]  ${d_object}
    ${v1}  ${v2} =  check the elem contain in parent2  ${d_object}  ${PO_PARTNERS_COMMON_ERROR_ID2}

Check the cim appear on the page
    [Documentation]  Megnézi, hogy a cím megjelenik-e az oldalon.
    element should be visible  ${PO_PARTNERS_CIM_ID}

Get the text of the cim
    [Documentation]  Visszaadja a cim-ben lévő szöveget
    ${cim} =  get text  ${PO_PARTNERS_CIM_ID}
    [Return]  ${cim}

Get the first text of i icon
    [Documentation]  A partner oldalon visszaadja az i icon mögötti első szöveget
    ${szov} =  get text  xpath=//*[@class="box-title"]/*[@class="material-icons"]
    [Return]  ${szov}

Get the full text of i icon
    [Documentation]  Visszaadja a partner oldalon található i icon mögötti teljes szöveget
    ${szov} =  get text  xpath=//*[@class="box-title"]
    [Return]  ${szov}