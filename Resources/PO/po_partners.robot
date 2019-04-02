*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  ../../ExternalResources/mylibrary.py

*** Variables ***
${PO_PARTNERS_INIVETE_BUTTON_TEXT_ID} =  //app-button[@id="invite_partner"]//*[@class="ng-star-inserted"]
${PO_PARTNERS_INIVETE_BUTTON_ID} =  id=invite_partner
${PO_PARTNERS_COMMON_ERROR_ID} =  xpath=//app-show-errors/ul/li
${PO_PARTNERS_COMMON_ERROR_ID2} =  .//app-show-errors/ul/li
${PO_PARTNERS_EMAIL_INPUT_ID} =  //input[@formcontrolname="email"]
${PO_PARTNERS_FIRSTNAME_INPUT_ID} =  xpath=//input[@formcontrolname="firstName"]
${PO_PARTNERS_LASTNAME_INPUT_ID} =  xpath=//input[@formcontrolname="lastName"]
${PO_PARTNERS_COMPANYNAME_INPUT_ID} =  xpath=//input[@formcontrolname="companyName"]
${PO_PARTNERS_DIV_ID_OF_INPUT} =  //div[@class="columns small-12 medium-6"]
${PO_PARTNERS_CEG_DIV_LIST_ID} =  2
${PO_PARTNERS_EMAIL_DIV_LIST_ID} =  3
${PO_PARTNERS_CIM_ID} =  xpath=//*[@class="row"]/div/h1
${PO_PARTNERS_LABEL_ID_IN_DIV_OBJECT} =  .//label
${PO_PARTNERS_LABEL_ID_MENTES_GOMB} =  xpath=//app-button[@ng-reflect-type="submit"]/button/span
${PO_PARTNERS_MENTES_BUTTON_ID} =  //button[@class="button success"]
${PO_PARTNERS_SEARCH_INPUT_ID} =  xpath=//input[@formcontrolname="invitedUserEmail"]
${PO_PARTNERS_SEARCH_BUTTON_ID} =  xpath=//search-button
${PO_PARTNERS_ICON_WAITING_FOR_CONFIRMATION} =  xpath=//*[@class="material-icons status-icon waiting-for-confirmation"]
${PO_PARTNERS_ICON_WATCH} =  xpath=//*[@class="material-icons action-primary"]
${PO_PARTNERS_CONFIRM_POPUP_ID} =  //*[contains(@id,"mat-dialog")]
${PO_PARTNERS_ICON_ACTIVE} =  xpath=//*[@class="material-icons status-icon public"]

*** Keywords ***

Get the mentes button text
    [Documentation]  Visszaadja a partners meghívása oldalon található mentés gomb szövegét.
    ${szoveg} =  get text  ${PO_PARTNERS_LABEL_ID_MENTES_GOMB}
    [Return]  ${szoveg}

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

Give the email of partner
    [Documentation]  Megadjuk az email címet a partner meghívása során
    [Arguments]  ${email_cim}
    input text  ${PO_PARTNERS_EMAIL_INPUT_ID}  ${email_cim}

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

Get the email div object
    [Documentation]  A megkapott elemek listából visszaadja a email div részét
    [Arguments]  ${elemek}
    ${email} =  Get From List  ${elemek}  ${PO_PARTNERS_EMAIL_DIV_LIST_ID}
    [Return]  ${email}

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

Get the label from div object in the partners page
    [Documentation]  A partner oldalon a div object-ből visszaadja a benne lévő label-t.
    ...  Az objectumot paraméterben kapja meg.
    [Arguments]  ${object}
    ${van}  ${veznev_label} =  check the elem contain in parent2  ${object}  ${PO_PARTNERS_LABEL_ID_IN_DIV_OBJECT}
    [Return]  ${van}  ${veznev_label}

Push the Mentes button on the parner invite page
    [Documentation]  A partner meghívása oldalon megnyomja a Mentés gombot.
    click element  ${PO_PARTNERS_MENTES_BUTTON_ID}

Give the email for the search input
    [Documentation]  A partnerek oldalon az email cím keresőbe beírja a paraméterként megadott szöveget.
    [Arguments]  ${szoveg}
    input text  ${PO_PARTNERS_SEARCH_INPUT_ID}  ${szoveg}

Click the search button
    [Documentation]  A partnerek oldalon a keresés gombra kattint.
    click element  ${PO_PARTNERS_SEARCH_BUTTON_ID}

Check the waiting for confirmation icon is appear
    [Documentation]  A partnerek oldalon megnézni, hogy a waitn for confirmation icon megjelenik-e.
    element should be visible  ${PO_PARTNERS_ICON_WAITING_FOR_CONFIRMATION}

Check the active icon is appear
    [Documentation]  A partnerek oldalon megnézi, hogy az aktív ikon megjelenik-e.
    element should be visible  ${PO_PARTNERS_ICON_ACTIVE}

Click the Megtekintes icon
    [Documentation]  A partnerek oldalon a megtekintes(szem) iconra kattint.
    click element  ${PO_PARTNERS_ICON_WATCH}

Waiting the details of partner page loaded
    [Documentation]  Megnézi, hogy a partner adatainak az oldal betöltődött-e
    wait until element is visible  //*[@class="lead"]

Push the jovahagy button
    [Documentation]  A partner adatainak az oldalán megnyomja a jóváhagy gombot.
    click element  xpath=//*[@class="button success"]

Waiting the jovahagy popup appear
    [Documentation]  A partner jóváhagyása során megvárja míg a popup ablak felugrig,
    wait until element is visible  ${PO_PARTNERS_CONFIRM_POPUP_ID}

Push the igen button on the popup appear
    [Documentation]  A partner jóváhagyása során a felugró popup ablakban megnyomja a igen gombot.
    @{elem} =  SeleniumLibrary.Get WebElements  xpath=//button[@class="button success"]
    ${gomb} =  Get From List  ${elem}  1
    click element  ${gomb}