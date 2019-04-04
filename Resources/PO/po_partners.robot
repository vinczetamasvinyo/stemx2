*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  ../../ExternalResources/mylibrary.py
Library  ../../ExternalResources/mylibrary.py

*** Variables ***
${PO_PARTNERS_INIVETE_BUTTON_TEXT_ID} =  //app-button[@id="invite_partner"]//*[@class="ng-star-inserted"]
${PO_PARTNERS_INIVETE_BUTTON_ID} =  id=invite_partner
${PO_PARTNERS_ADD_PARNTER_BUTTON_ID} =  id=new_button
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
${PO_PARTNERS_TITLE_ID} =  xpath=//div[@class='columns small-12']/h1[1]
${PO_PARTNERS_PARTNER_NEVE_TEXT_ID} =  //label[1]
${PO_PARTNERS_EMAILCIM_TEXT_ID} =  //label[2]
${PO_PARTNERS_ALLAPOT_TEXT_ID} =  //label[3]
${PO_PARTNERS_BUTTON_ID} =  xpath=//*[@class="button secondary hollow"]
${PO_PARTNERS_BUTTON_TEXT_ID} =  ${PO_PARTNERS_BUTTON_ID}/span
#${PO_PARTNERS_BUTTON_TEXT_ID} =  xpath=//*[@class="button secondary hollow"]/span
${PO_PARTNERS_SEARCH_BUTTON_TEXT_ID} =  //search-button/app-button/button/span
${PO_PO_PARTNERS_PARTNER_NAME_IN_TABLE_TEXT_ID} =  //mat-header-row/mat-header-cell[1]/div/button
${PO_PO_PARTNERS_EMAILCIM_IN_TABLE_TEXT_ID} =  //mat-header-row/mat-header-cell[2]/div/button
${PO_PO_PARTNERS_CIM_IN_TABLE_TEXT_ID} =  //mat-header-row/mat-header-cell[3]
${PO_PO_PARTNERS_ALLAPOT_IN_TABLE_TEXT_ID} =  //mat-header-row/mat-header-cell[4]
${PO_PO_PARTNERS_LEHETOSEGEK_IN_TABLE_TEXT_ID} =  //mat-header-row/mat-header-cell[5]
${PO_PO_PARTNERS_NEW_PARTNER_TEXT_ID} =  //new-button//span
${PO_PO_PARTNERS_ALLAPOT_VALASZTO_ID} =  id=mat-select-1
${PO_PO_PARTNERS_ALLAPOT_OSSZES_ID} =  id=mat-option-2
${PO_PARTNERS_ALLAPOT_OSSZES_TEXT_ID} =  xpath=//mat-option[1]/span
${PO_PARTNERS_ALLAPOT_UJ_TEXT_ID} =  xpath=//mat-option[2]/span
${PO_PARTNERS_ALLAPOT_JOVAHAGYAS_TEXT_ID} =  xpath=//mat-option[3]/span
${PO_PARTNERS_ALLAPOT_AKTIV_TEXT_ID} =   xpath=//mat-option[4]/span
${PO_PARTNERS_ALLAPOT_SUSPEND_TEXT_ID} =  xpath=//mat-option[5]/span
${PO_PARTNERS_ALLAPOT_DELETE_TEXT_ID} =  xpath=//mat-option[6]/span
${PO_PARTNERS_ALLAPOT_ITEMS_ID} =  xpath=//mat-option
${PO_PARTNERS_ALLAPOT_ID} =  xpath=//mat-select[@formcontrolname="partnerStatus"]

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

Get the title of partner page
    ${szoveg} =  get text  ${PO_PARTNERS_TITLE_ID}
    [Return]  ${szoveg}

Get the partner neve text
    ${szoveg} =  get text  ${PO_PARTNERS_PARTNER_NEVE_TEXT_ID}
    [Return]  ${szoveg}

Get the email cim text
    ${szoveg} =  get text  ${PO_PARTNERS_EMAILCIM_TEXT_ID}
    [Return]  ${szoveg}

Get the allapot text
    ${szoveg1} =  get text  ${PO_PARTNERS_ALLAPOT_TEXT_ID}
    @{lista} =  mylibrary.split the text  ${szoveg1}  ${SPACE}
    log  ${lista}
    log  ${szoveg1}
    ${szoveg} =  get from list  ${lista}  0
    [Return]  ${szoveg}

Get the visszaallit button text
    ${szoveg} =  get text  ${PO_PARTNERS_BUTTON_TEXT_ID}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the kereses button text
    ${szoveg} =  get text  ${PO_PARTNERS_SEARCH_BUTTON_TEXT_ID}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the partner neve text form the table header
    [Documentation]  A partner táblázat címsorából visszaadja a partner neve szövegét.
    ${szoveg} =  get text  ${PO_PO_PARTNERS_PARTNER_NAME_IN_TABLE_TEXT_ID}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the email text form the table header
    [Documentation]  A partner táblázat címsorából visszaadja a email szövegét.
    ${szoveg} =  get text  ${PO_PO_PARTNERS_EMAILCIM_IN_TABLE_TEXT_ID}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the cim text form the table header
    [Documentation]  A partner táblázat címsorából visszaadja a cím szövegét.
    ${szoveg} =  get text  ${PO_PO_PARTNERS_CIM_IN_TABLE_TEXT_ID}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the allapot text form the table header
    [Documentation]  A partner táblázat címsorából visszaadja az Állapot szövegét.
    ${szoveg} =  get text  ${PO_PO_PARTNERS_ALLAPOT_IN_TABLE_TEXT_ID}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the lehetosegek text form the table header
    [Documentation]  A partner táblázat címsorából visszaadja a lehetőségek szövegét.
    ${szoveg} =  get text  ${PO_PO_PARTNERS_LEHETOSEGEK_IN_TABLE_TEXT_ID}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the uj letrehozasa button text
    [Documentation]  Visszaadja az uj letrehozas gom szövegeét.
    ${szoveg} =  get text  ${PO_PO_PARTNERS_NEW_PARTNER_TEXT_ID}
    log  ${szoveg}
    [Return]  ${szoveg}

Click the allapotvlaszto
    [Documentation]  Belekattint az állapotválasztó listbox-ba.
    click element  ${PO_PO_PARTNERS_ALLAPOT_VALASZTO_ID}

Choose the osszes elem from the allapotvalaszto
    [Documentation]  Az állapotválasztó listából kiválasztja az összes elemet.
    click element  ${PO_PO_PARTNERS_ALLAPOT_OSSZES_ID}

Click the allapotvlaszto and chose the osszes item
    [Documentation]  Az állapotválasztóba belekattint majd kiválasztja az összes elemet.
    Click the allapotvlaszto
    sleep  1s
    Choose the osszes elem from the allapotvalaszto

Get the allapotvalaszto elso eleme text
    [Documentation]  Visszaadja az állapotválasztóban lévő elem szövegeét.
    Click the allapotvlaszto
    sleep  1s
    ${szoveg} =  get text  ${PO_PARTNERS_ALLAPOT_OSSZES_TEXT_ID}
    Choose the osszes elem from the allapotvalaszto
    log  ${szoveg}
    [Return]  ${szoveg}

Get the allapotvalaszto masodik eleme text
    [Documentation]  Visszaadja az állapotválasztóban lévő második elem szövegeét.
    Click the allapotvlaszto
    sleep  1s
    ${szoveg} =  get text  ${PO_PARTNERS_ALLAPOT_UJ_TEXT_ID}
    Choose the osszes elem from the allapotvalaszto
    #${szoveg} =  get text  ${PO_PARTNERS_ALLAPOT_UJ_TEXT_ID}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the allapotvalaszto harmadik eleme text
    [Documentation]  Visszaadja az állapotválasztóban lévő harmadik elem szövegeét.
    Click the allapotvlaszto
    sleep  1s
    ${szoveg} =  get text  ${PO_PARTNERS_ALLAPOT_JOVAHAGYAS_TEXT_ID}
    Choose the osszes elem from the allapotvalaszto
    log  ${szoveg}
    [Return]  ${szoveg}

Get the allapotvalaszto negyedik eleme text
    [Documentation]  Visszaadja az állapotválasztóban lévő negyedik elem szövegeét.
    Click the allapotvlaszto
    sleep  1s
    ${szoveg} =  get text  ${PO_PARTNERS_ALLAPOT_AKTIV_TEXT_ID}
    Choose the osszes elem from the allapotvalaszto
    log  ${szoveg}
    [Return]  ${szoveg}

Get the allapotvalaszto otodik eleme text
    [Documentation]  Visszaadja az állapotválasztóban lévő otodik elem szövegeét.
    Click the allapotvlaszto
    sleep  1s
    ${szoveg} =  get text  ${PO_PARTNERS_ALLAPOT_SUSPEND_TEXT_ID}
    Choose the osszes elem from the allapotvalaszto
    log  ${szoveg}
    [Return]  ${szoveg}

Get the allapotvalaszto hatodik eleme text
    [Documentation]  Visszaadja az állapotválasztóban lévő hatodik elem szövegeét.
    Click the allapotvlaszto
    sleep  1s
    ${szoveg} =  get text  ${PO_PARTNERS_ALLAPOT_DELETE_TEXT_ID}
    Choose the osszes elem from the allapotvalaszto
    log  ${szoveg}
    [Return]  ${szoveg}

Get the count item of allapotvalaszto
    [Documentation]  Visszaadja az állapotválasztóban lévő  összes elem darabszámát.
    Click the allapotvlaszto
    sleep  1s
    @{elemek} =  SeleniumLibrary.Get WebElements  ${PO_PARTNERS_ALLAPOT_ITEMS_ID}
    Choose the osszes elem from the allapotvalaszto
    ${darabszam} =  get length  ${elemek}
    [Return]  ${darabszam}

Check the partner invite button appear in the page
    [Documentation]  megnézi, hogy a partner meghívása gomb mejelenik-e az oldalon.
    element should be visible  ${po_partners_inivete_button_id}

Check the partner add button appear in the page
    [Documentation]  megnézi, hogy a partner felvitele gomb megjelenik-e az oldalon.
    element should be visible  ${PO_PARTNERS_ADD_PARNTER_BUTTON_ID}

Check the company input field appear in the page
    [Documentation]  megnézi, hogy a partner neve input mező megjelenik-e az oldalon.
    element should be visible  ${po_partners_companyname_input_id}

Check the "email cim" input field appear in the page
    [Documentation]  Megnézi, hogy az email cím szűrésére alkalmas mező
                ...  megjelenik-e az oldalon.
    element should be visible  ${PO_PARTNERS_SEARCH_INPUT_ID}

Check the "allapotvalaszto" appear in the page
    [Documentation]  Megnézi, hogy az állapotválasztó megjelenik-e az oldalon.
    element should be visible  ${po_po_partners_allapot_valaszto_id}

Check the "visszaállítás" button appear in the page
    [Documentation]  Megnézi, hogy az a visszaállítás gomb megjelenik-e az oldalon.
    element should be visible  ${PO_PARTNERS_BUTTON_ID}

Check the "Kereses" button appear in the page
    [Documentation]  Megnézi, hogy a keresés gomb megjelenik-e az oldalon.
    element should be visible  ${PO_PARTNERS_SEARCH_BUTTON_ID}