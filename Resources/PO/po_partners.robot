*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  ../../ExternalResources/mylibrary.py
Resource  po_alt.robot
Resource  ../Common.robot

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
#${PO_PARTNERS_LABEL_ID_MENTES_GOMB} =  xpath=//app-button[@ng-reflect-type="submit"]/button/span
${PO_PARTNERS_LABEL_ID_MENTES_GOMB} =  xpath=//*[@class="button success"]/span
${PO_PARTNERS_MENTES_BUTTON_ID} =  //button[@class="button success"]
${PO_PARTNERS_SEARCH_INPUT_ID} =  xpath=//input[@formcontrolname="invitedUserEmail"]
${PO_PARTNERS_SEARCH_BUTTON_ID} =  xpath=//search-button
#${PO_PARTNERS_ICON_WAITING_FOR_CONFIRMATION} =  xpath=//*[@class="material-icons status-icon waiting-for-confirmation"]
${PO_PARTNERS_ICON_WATCH} =  xpath=//*[@class="material-icons action-primary"]
${PO_PARTNERS_CONFIRM_POPUP_ID} =  //*[contains(@id,"mat-dialog")]
#${PO_PARTNERS_ICON_ACTIVE} =  xpath=//*[@class="material-icons status-icon public"]
${PO_PARTNERS_TITLE_ID} =  xpath=//div[@class='columns small-12']/h1[1]
${PO_PARTNERS_PARTNER_NEVE_TEXT_ID} =  //label[1]
${PO_PARTNERS_EMAILCIM_TEXT_ID} =  //label[2]
${PO_PARTNERS_ALLAPOT_TEXT_ID} =  //label[3]
${PO_PARTNERS_TITTLE_H3} =  xpath=//h3
${PO_PARTNERS_TITTLE_H4} =  xpath=//h4
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
#${PO_PO_PARTNERS_ALLAPOT_VALASZTO_ID} =  id=mat-select-1
${PO_PO_PARTNERS_ALLAPOT_VALASZTO_ID} =  xpath=//*[@formcontrolname="partnerStatus"]
${PO_PO_PARTNERS_ALLAPOT_OSSZES_ID} =  id=mat-option-2

${PO_PARTNERS_ALLAPOT_OSSZES_TEXT_ID} =  xpath=//mat-option[1]/span
${PO_PARTNERS_ALLAPOT_UJ_TEXT_ID} =  xpath=//mat-option[2]/span
${PO_PARTNERS_ALLAPOT_JOVAHAGYAS_TEXT_ID} =  xpath=//mat-option[3]/span
${PO_PARTNERS_ALLAPOT_AKTIV_TEXT_ID} =   xpath=//mat-option[4]/span
${PO_PARTNERS_ALLAPOT_SUSPEND_TEXT_ID} =  xpath=//mat-option[5]/span
${PO_PARTNERS_ALLAPOT_DELETE_TEXT_ID} =  xpath=//mat-option[6]/span

${PO_PARTNERS_ALLAPOT_ITEMS_ID} =  xpath=//mat-option
${PO_PARTNERS_ALLAPOT_ID} =  xpath=//mat-select[@formcontrolname="partnerStatus"]
${PO_P_FIRSTNAME_TEXT_ID} =  xpath=//*[@formgroupname="partnerProfile"]//label
${PO_P_PAGE_TITLE_TEXT_ID} =  xpath=//*[@class="columns small-12"]/h1
${PO_P_PAGE_PARTNER_PROFILE_TEXT_ID} =  xpath=//*[@formgroupname="partnerProfile"]//h3
${PO_P_PAGE_COMPANY_PROFILE_TEXT_ID} =  xpath=//*[@formgroupname="company"]//h3
${PO_P_PAGE_COMPANY_TEXT_ID} =  xpath=//*[@formgroupname="company"]//label
${PO_P_PAGE_BILLING_PROFILE_TEXT_ID} =  xpath=//*[@class="columns small-12 large-6"]/h3
${PO_P_PAGE_BILLING_TEXT_ID} =  xpath=//app-billing-information//label
${PO_P_PAGE_CONTACT_BUTTON_TEXT_ID} =  xpath=//*[@class="button tiny no-margin"]/span
${PO_P_PAGE_CONTACT_TITlE_TEXT_ID} =  xpath=//*[@formarrayname="contacts"]//h3
${PO_P_PAGE_FIRST_CONTACT_TITLE_TEXT_ID} =  xpath=//*[@class="columns small-12 medium-6 ng-untouched ng-pristine ng-invalid ng-star-inserted"]//h4
${PO_P_PAGE_CONTACT_TEXT_ID} =  xpath=//*[@class="columns small-12 medium-6 ng-untouched ng-pristine ng-invalid ng-star-inserted"]//label
${PO_P_PAGE_BUTTON_BACK_ID} =  xpath=//*[@class="button hollow secondary"]
${PO_P_PAGE_BUTTON_BACK_TEXT_ID} =  xpath=//*[@class="button hollow secondary"]/span
${PO_P_PAGE_BUTTON_SAVE_ID} =  xpath=//*[@class="button success"]
${PO_P_PAGE_BUTTON_SAVE_TEXT_ID} =  xpath=//*[@class="button success"]/span
${PO_P_PAGE_BUTTON_DELETE_TEXT_ID} =  xpath=//delete-button//button/span
${PO_P_PAGE_INPUT_PARTNER_FIRSTNAME_ID} =  xpath=//*[@formgroupname="partnerProfile"]//input[@formcontrolname="firstName"]
${PO_P_PAGE_INPUT_PARTNER_LASTNAME_ID} =  xpath=//*[@formgroupname="partnerProfile"]//input[@formcontrolname="lastName"]
${PO_P_PAGE_INPUT_PARTNER_EMAIL_ID} =  xpath=//*[@formgroupname="partnerProfile"]//input[@formcontrolname="email"]
${PO_P_PAGE_INPUT_COMPANY_COMPANY_NAME_ID} =  xpath=//*[@formgroupname="company"]//input[@formcontrolname="name"]
${PO_P_PAGE_INPUT_COMPANY_COMPANY_LONG_NAME_ID} =  xpath=//*[@formgroupname="company"]//input[@formcontrolname="longName"]
${PO_P_PAGE_INPUT_COMPANY_COUNTRY_ID} =  xpath=//*[@formgroupname="company"]//*[@formcontrolname="country"]
${PO_P_PAGE_INPUT_COMPANY_ZIPCODE_ID} =  xpath=//*[@formgroupname="company"]//*[@formcontrolname="zipCode"]
${PO_P_PAGE_INPUT_COMPANY_CITY_ID} =  xpath=//*[@formgroupname="company"]//*[@formcontrolname="city"]
${PO_P_PAGE_INPUT_COMPANY_COUNTY_ID} =  xpath=//*[@formgroupname="company"]//*[@formcontrolname="county"]
${PO_P_PAGE_INPUT_COMPANY_STREET_ID} =  xpath=//*[@formgroupname="company"]//*[@formcontrolname="street"]
${PO_P_PAGE_INPUT_COMPANY_HOUSENUMBER_ID} =  xpath=//*[@formgroupname="company"]//*[@formcontrolname="houseNumber"]
${PO_P_PAGE_INPUT_COMPANY_DOOR_ID} =  xpath=//*[@formgroupname="company"]//*[@formcontrolname="houseNumber"]
${PO_P_PAGE_INPUT_COMPANY_FLOOR_ID} =  xpath=//*[@formgroupname="company"]//*[@formcontrolname="floor"]
${PO_P_PAGE_INPUT_BILLING_NAME_ID} =  xpath=//app-billing-information//*[@formcontrolname="name"]
${PO_P_PAGE_INPUT_BILLING_TAXNUMBER_ID} =  xpath=//app-billing-information//*[@formcontrolname="vatNumber"]
${PO_P_PAGE_INPUT_BILLING_BANKNAME_ID} =  xpath=//app-billing-information//*[@formcontrolname="bankName"]
${PO_P_PAGE_INPUT_BILLING_BANKNUMBER_ID} =  xpath=//app-billing-information//*[@formcontrolname="bankAccountNumber"]
${PO_P_PAGE_INPUT_BILLING_IBAN_ID} =  xpath=//app-billing-information//*[@formcontrolname="iban"]
${PO_P_PAGE_INPUT_BILLING_SWIFT_ID} =  xpath=//app-billing-information//*[@formcontrolname="swift"]
${PO_P_PAGE_INPUT_BILLING_ZIPCODE_ID} =  xpath=//app-billing-information//*[@formcontrolname="zipCode"]
${PO_P_PAGE_INPUT_BILLING_CITY_ID} =  xpath=//app-billing-information//*[@formcontrolname="city"]
${PO_P_PAGE_INPUT_BILLING_COUNTY_ID} =  xpath=//app-billing-information//*[@formcontrolname="county"]
${PO_P_PAGE_INPUT_BILLING_HOUSENUMBER_ID} =  xpath=//app-billing-information//*[@formcontrolname="houseNumber"]
${PO_P_PAGE_INPUT_BILLING_DOOR_ID} =  xpath=//app-billing-information//*[@formcontrolname="door"]
${PO_P_PAGE_INPUT_FLOOR_ID} =  xpath=//app-billing-information//*[@formcontrolname="floor"]
${PO_P_PAGE_BUTTON_NEW_CONTACT_ID} =  xpath=//*[@class="button tiny no-margin"]

${PO_P_PAGE_CONTACT_FIRSTNAME_ID} =  xpath=//*[@class="columns small-12 medium-6 ng-untouched ng-pristine ng-invalid ng-star-inserted"]//*[@formcontrolname="firstName"]
${PO_P_PAGE_CONTACT_LASTNAME_ID} =  xpath=//*[@class="columns small-12 medium-6 ng-untouched ng-pristine ng-invalid ng-star-inserted"]//*[@formcontrolname="lastName"]
${PO_P_PAGE_CONTACT_PHONE_ID} =  xpath=//*[@class="columns small-12 medium-6 ng-untouched ng-pristine ng-invalid ng-star-inserted"]//*[@formcontrolname="phone"]
${PO_P_PAGE_CONTACT_EMAIL_ID} =  xpath=//*[@class="columns small-12 medium-6 ng-untouched ng-pristine ng-invalid ng-star-inserted"]//*[@formcontrolname="email"]
${PO_P_PAGE_CONTACT_JOB_ID} =  xpath=//*[@class="columns small-12 medium-6 ng-untouched ng-pristine ng-invalid ng-star-inserted"]//*[@formcontrolname="jobDescription"]
${PO_P_PAGE_LABEL_ID} =  xpath=//label
${PO_P_PAGE_COM_NAME_NEW_PARTNER_ID} =  xpath=//*[@formgroupname="company"]//*[@formcontrolname="name"]
${PO_P__CONTACT_FIRSTNAME_ID} =  xpath=//*[@formarrayname="contacts"]//input[@formcontrolname="firstName"]
${PO_P__CONTACT_LASTNAME_ID} =  xpath=//*[@formarrayname="contacts"]//input[@formcontrolname="lastName"]
${PO_P_CONTACT_EMAIL_ID} =  xpath=//*[@formarrayname="contacts" ]//input[@formcontrolname="email"]
${PO_P_JOBDESCRIPTION_ID} =  xpath=//*[@formcontrolname="jobDescription"]
${hely} =  xpath=//*[@formcontrolname="partnerStatus"]
${PARTNER_DETAILS_TITTLE_ID} =  xpath=//*[@class="columns small-12"]/h1
${PARTNER_DETAILS_TEXT_ID} =  xpath=//h6

*** Keywords ***


Get status listbox item
    [Arguments]  ${xpath}  ${class}
    ${valami} =  get element attribute  ${xpath}  ${class}
    log  ${valami}
    @{elemek} =  mylibrary.split the text  ${valami}  ${SPACE}
    log  ${elemek}[0]
    log  ${elemek}
    ${szotar} =  create dictionary
    ${i} =  set variable  0
    :FOR  ${valt}  IN  @{elemek}
    \  ${i} =  Evaluate  ${i} + 1
    \  ${resz} =  set variable  //*[@id="${valt}"]/span
    \  log  ${resz}
    \  ${a} =  convert to string  ${i}
    \  set to dictionary  ${szotar}  ${a}  ${resz}
    log  ${szotar}
    [Return]  ${szotar}


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

Click the firstanme input
    [Documentation]  Belekattint a Keresztnév mezőbe.
    click element  ${PO_PARTNERS_FIRSTNAME_INPUT_ID}

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
    [Return]  ${v1}  ${v2}

Check the cim appear on the page
    [Documentation]  Megnézi, hogy a cím megjelenik-e az oldalon.
    element should be visible  ${PO_PARTNERS_CIM_ID}

Get the text of the cim
    [Documentation]  Visszaadja a cim-ben lévő szöveget
    ${cim} =  get text  ${PO_PARTNERS_CIM_ID}
    [Return]  ${cim}

Get the first text of i icon
    [Documentation]  A partner oldalon visszaadja az i icon mögötti első szöveget
    [Arguments]  ${elem}
    #${szov} =  get text  xpath=//*[@class="box-title"]/*[@class="material-icons"]
    ${szov} =  get text  ${elem}
    [Return]  ${szov}

Get the full text of i icon
    [Documentation]  Visszaadja a partner oldalon található i icon mögötti teljes szöveget
    [Arguments]  ${elem}
    #${szov} =  get text  xpath=//*[@class="box-title"]
    ${szov} =  get text  ${elem}
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
    [Arguments]  ${elem}
    click element  ${elem}

Click the allapotvlaszto and chose the osszes item
    [Documentation]  Az állapotválasztóba belekattint majd kiválasztja az összes elemet.
    Click the allapotvlaszto
    sleep  1s
    Choose the osszes elem from the allapotvalaszto

Get the allapotvalaszto elso eleme text
    [Documentation]  Visszaadja az állapotválasztóban lévő elem szövegeét.
    Click the allapotvlaszto
    sleep  1s
    ${kesz_szotar} =  Get status listbox item  ${hely}  aria-owns
    ${szoveg} =  get text  ${kesz_szotar}[1]
    Choose the osszes elem from the allapotvalaszto  ${kesz_szotar}[1]
    log  ${szoveg}
    [Return]  ${szoveg}

Get the allapotvalaszto masodik eleme text
    [Documentation]  Visszaadja az állapotválasztóban lévő második elem szövegeét.
    Click the allapotvlaszto
    sleep  1s
    ${kesz_szotar} =  Get status listbox item  ${hely}  aria-owns
    ${szoveg} =  get text  ${kesz_szotar}[2]
    Choose the osszes elem from the allapotvalaszto  ${kesz_szotar}[1]
    log  ${szoveg}
    [Return]  ${szoveg}

Get the allapotvalaszto harmadik eleme text
    [Documentation]  Visszaadja az állapotválasztóban lévő harmadik elem szövegeét.
    Click the allapotvlaszto
    sleep  1s
    ${kesz_szotar} =  Get status listbox item  ${hely}  aria-owns
    ${szoveg} =  get text  ${kesz_szotar}[3]
    Choose the osszes elem from the allapotvalaszto  ${kesz_szotar}[1]
    log  ${szoveg}
    [Return]  ${szoveg}

Get the allapotvalaszto negyedik eleme text
    [Documentation]  Visszaadja az állapotválasztóban lévő negyedik elem szövegeét.
    Click the allapotvlaszto
    sleep  1s
    ${kesz_szotar} =  Get status listbox item  ${hely}  aria-owns
    ${szoveg} =  get text  ${kesz_szotar}[4]
    Choose the osszes elem from the allapotvalaszto  ${kesz_szotar}[1]
    log  ${szoveg}
    [Return]  ${szoveg}

Get the allapotvalaszto otodik eleme text
    [Documentation]  Visszaadja az állapotválasztóban lévő otodik elem szövegeét.
    Click the allapotvlaszto
    sleep  1s
    ${kesz_szotar} =  Get status listbox item  ${hely}  aria-owns
    ${szoveg} =  get text  ${kesz_szotar}[5]
    Choose the osszes elem from the allapotvalaszto  ${kesz_szotar}[1]
    log  ${szoveg}
    [Return]  ${szoveg}

Get the allapotvalaszto hatodik eleme text
    [Documentation]  Visszaadja az állapotválasztóban lévő hatodik elem szövegeét.
    Click the allapotvlaszto
    sleep  1s
    ${kesz_szotar} =  Get status listbox item  ${hely}  aria-owns
    ${szoveg} =  get text  ${kesz_szotar}[6]
    Choose the osszes elem from the allapotvalaszto  ${kesz_szotar}[1]
    log  ${szoveg}
    [Return]  ${szoveg}

Get the count item of allapotvalaszto
    [Documentation]  Visszaadja az állapotválasztóban lévő  összes elem darabszámát.
    Click the allapotvlaszto
    sleep  1s
    @{elemek} =  SeleniumLibrary.Get WebElements  ${PO_PARTNERS_ALLAPOT_ITEMS_ID}
    ${kesz_szotar} =  Get status listbox item  ${hely}  aria-owns
    Choose the osszes elem from the allapotvalaszto  ${kesz_szotar}[1]
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

Check the "visszaallitas" button appear in the page
    [Documentation]  Megnézi, hogy az a visszaállítás gomb megjelenik-e az oldalon.
    element should be visible  ${PO_PARTNERS_BUTTON_ID}

Check the "Kereses" button appear in the page
    [Documentation]  Megnézi, hogy a keresés gomb megjelenik-e az oldalon.
    element should be visible  ${PO_PARTNERS_SEARCH_BUTTON_ID}

Get the valu of allapotvalaszto
    [Documentation]  Visszaadja az állapotválasztóban lévő szöveg értékét.
    ${allapot} =  get text  //*[@class="mat-select-value"]/span/span
    log  ${allapot}
    [Return]  ${allapot}

Get the value of partner name
    [Documentation]  Visszaadja a partner neve szűrőben lévő értéket.
    ${allapot} =  get value  ${PO_PARTNERS_COMPANYNAME_INPUT_ID}
    log  ${allapot}
    [Return]  ${allapot}

Get the value of email adress
    [Documentation]  Visszaadja az email cím szűrőben lévő értéket.
    ${allapot} =  get value  ${PO_PARTNERS_COMPANYNAME_INPUT_ID}
    log  ${allapot}
    [Return]  ${allapot}

Give the valeu of the partner name input field
    [Documentation]  A partner néve szűrőbe megadja a paraméterként adott értéket.
    [Arguments]  ${szoveg}
    input text  ${PO_PARTNERS_COMPANYNAME_INPUT_ID}  ${szoveg}

Give the value of the partner email input field
    [Documentation]  A partner email cím szűrőbe megadja a paraméterként adott értéket.
    [Arguments]  ${szoveg}
    input text  ${PO_PARTNERS_SEARCH_INPUT_ID}  ${szoveg}

Click the new partner
    [Documentation]  Rákattint a partner létrehozása gombra.
    click element  ${PO_PARTNERS_ADD_PARNTER_BUTTON_ID}

Waiting the new partner page loaded
    [Documentation]  Megvárjva amíg a partner létrehozása oldal betöltődik.
    wait until element is visible  ${PO_PARTNERS_FIRSTNAME_INPUT_ID}

waiting the edit partner page loaded
    [Documentation]  Megvárjva amíg a partner szerkesztése oldal betöltődik.
    wait until element is visible  ${PO_P_PAGE_INPUT_COMPANY_COMPANY_NAME_ID}

Get the firtname text
    [Documentation]  Visszaadja a keresztnév szöveg értékét
                ...  a partner létrehozása oldalról.
    ${szoveg} =  get text  ${PO_P_FIRSTNAME_TEXT_ID}
    [Return]  ${szoveg}

Get the secondname label text
    [Documentation]  Visszaadja a vezetéknév mezőhöz tartozó label értékét.
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_FIRSTNAME_TEXT_ID}
    ${veznev} =  get from list  ${elem}  1
    ${szoveg} =  get text  ${veznev}
    [Return]  ${szoveg}

Get the email address text
    [Documentation]  visszaadja az email cím mezőhoz tartozó label értékét.
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_FIRSTNAME_TEXT_ID}
    ${veznev} =  get from list  ${elem}  2
    ${szoveg} =  get text  ${veznev}
    [Return]  ${szoveg}

Get the page title
    [Documentation]  Visszaadja az olda címét
    ${szoveg} =  get text  ${PO_P_PAGE_TITLE_TEXT_ID}
    [Return]  ${szoveg}

Get the partner profile block title
    [Documentation]  Visszaadja a partner block címét
    ${szoveg} =  get text  ${PO_P_PAGE_PARTNER_PROFILE_TEXT_ID}
    [Return]  ${szoveg}

Get the company profile block title
    [Documentation]  Visszaadja a cég block címét
    ${szoveg} =  get text  ${PO_P_PAGE_COMPANY_PROFILE_TEXT_ID}
    [Return]  ${szoveg}

Get the company name text
    [Documentation]  Visszaadja a cég nevéhez tartozó label text id-ját.
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_COMPANY_TEXT_ID}
    ${company_name} =  get from list  ${elem}  0
    ${szoveg} =  get text  ${company_name}
    [Return]  ${szoveg}

Get the company long name text
    [Documentation]  Visszaadja a cég hoszsú nevéhez tartozó label text.
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_COMPANY_TEXT_ID}
    ${company_long_name} =  get from list  ${elem}  1
    ${szoveg} =  get text  ${company_long_name}
    [Return]  ${szoveg}

Get the company reg number text
    [Documentation]  Visszaadja a céghez tartozó regisztrációs számot.
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_COMPANY_TEXT_ID}
    ${company_reg_number} =  get from list  ${elem}  2
    ${szoveg} =  get text  ${company_reg_number}
    [Return]  ${szoveg}

Get the company country text
    [Documentation]  Visszaadja a cégher tartozó oszág text-jét.
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_COMPANY_TEXT_ID}
    ${company_country} =  get from list  ${elem}  3
    ${szoveg1} =  get text  ${company_country}
    @{szoveg_lista} =  mylibrary.split the text  ${szoveg1}  ${SPACE}
    ${szoveg} =  set variable  ${szoveg_lista}[0]
    [Return]  ${szoveg}

Get listbox label text
    [Documentation]  Visszaadja a listboxhoz tartozó text-jét.
    [Arguments]  ${hely}  ${index}
    @{elem} =  SeleniumLibrary.Get WebElements  ${hely}
    ${company_country} =  get from list  ${elem}  ${index}
    ${szoveg1} =  get text  ${company_country}
    @{szoveg_lista} =  mylibrary.split the text  ${szoveg1}  ${SPACE}
    ${szoveg} =  set variable  ${szoveg_lista}[0]
    [Return]  ${szoveg}

Get the company zipcode text
    [Documentation]  Visszaadja a céghez tartozó oszág text-jét.
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_COMPANY_TEXT_ID}
    ${company_zipcode} =  get from list  ${elem}  4
    ${szoveg} =  get text  ${company_zipcode}
    [Return]  ${szoveg}

Get the city text
    [Documentation]  Visszaadja a céghez tartozó települést
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_COMPANY_TEXT_ID}
    ${company_city} =  get from list  ${elem}  5
    ${szoveg} =  get text  ${company_city}
    [Return]  ${szoveg}

Get the county text
    [Documentation]  Visszaadja a céghez tartozó megye textjét.
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_COMPANY_TEXT_ID}
    ${company_county} =  get from list  ${elem}  6
    element should be visible  ${company_county}
    ${szoveg} =  get text  ${company_county}
    [Return]  ${szoveg}

Get the street text
    [Documentation]  Visszaadja az utca input-hoz tartozó label text-jét.
    ${elem} =  elem from list  ${PO_P_PAGE_COMPANY_TEXT_ID}  7
    ${szoveg} =  get text  ${elem}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the housenumber text
    [Documentation]  Visszaadja a házszámhoz tartozó input mező label text-jét
    ${elem} =  elem from list  ${PO_P_PAGE_COMPANY_TEXT_ID}  8
    ${szoveg} =  get text  ${elem}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the door text
    [Documentation]  Visszaadja az ajtóhoz tartozó input mező label text-jét.
    ${elem} =  elem from list  ${PO_P_PAGE_COMPANY_TEXT_ID}  9
    ${szoveg} =  get text  ${elem}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the floor text
    [Documentation]  Visszaadja az emelethez tartozó input mező label text-jét.
    ${elem} =  elem from list  ${PO_P_PAGE_COMPANY_TEXT_ID}  10
    ${szoveg} =  get text  ${elem}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the billing title text
    [Documentation]  Visszaadja a számlázási blokkhoz kapcsolódó cím textjét.
    ${szoveg} =  get text  ${PO_P_PAGE_BILLING_PROFILE_TEXT_ID}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the billing name text
    [Documentation]  Visszaadja a számlázási blokk-on belüli név input mező label text-jét.
    ${elem} =  elem from list  ${PO_P_PAGE_BILLING_TEXT_ID}  0
    ${szoveg} =  get text  ${elem}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the billing taxnumber text
    [Documentation]  Visszaadja a számlázási blokk-on belüli adószám input mező label text-jét.
    ${elem} =  elem from list  ${PO_P_PAGE_BILLING_TEXT_ID}  1
    ${szoveg} =  get text  ${elem}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the billing bank text
    [Documentation]  Visszaadja a számlázási blokk-on belüli bank input mező label text-jét.
    ${elem} =  elem from list  ${PO_P_PAGE_BILLING_TEXT_ID}  2
    ${szoveg} =  get text  ${elem}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the billing banknumber text
    [Documentation]  Visszaadja a számlázási blokk-on belüli bankszámlaszám input mező
                ...  label text-jét.
    ${elem} =  elem from list  ${PO_P_PAGE_BILLING_TEXT_ID}  3
    ${szoveg} =  get text  ${elem}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the billing iban text
    [Documentation]  Visszaadja a számlázási blokk-on belüli az iban input mező
                ...  label text-jét.
    ${elem} =  elem from list  ${PO_P_PAGE_BILLING_TEXT_ID}  4
    ${szoveg} =  get text  ${elem}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the billing swift text
    [Documentation]  Visszaadja a számlázási blokk-on belüli az swift input mező
                ...  label text-jét.
    ${elem} =  elem from list  ${PO_P_PAGE_BILLING_TEXT_ID}  5
    ${szoveg} =  get text  ${elem}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the billing country text
    [Documentation]  Visszaadja a számlázási blokk-on belüli az ország input mező
                ...  label text-jét.
    ${elem} =  elem from list  ${PO_P_PAGE_BILLING_TEXT_ID}  6
    ${szoveg1} =  get text  ${elem}
    @{szoveg_lista} =  mylibrary.split the text  ${szoveg1}  ${SPACE}
    ${szoveg} =  set variable  ${szoveg_lista}[0]
    log  ${szoveg}
    [Return]  ${szoveg}

Get the billing zipcode text
    [Documentation]  Visszaadja a számlázási blokk-on belüli az irányítószám input mező
                ...  label text-jét.
    ${elem} =  elem from list  ${PO_P_PAGE_BILLING_TEXT_ID}  7
    ${szoveg} =  get text  ${elem}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the billing city text
    [Documentation]  Visszaadja a számlázási blokk-on belüli a város input mező
                ...  label text-jét.
    ${elem} =  elem from list  ${PO_P_PAGE_BILLING_TEXT_ID}  8
    ${szoveg} =  get text  ${elem}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the billing county text
    [Documentation]  Visszaadja a számlázási blokk-on belüli a megye input mező
                ...  label text-jét.
    ${elem} =  elem from list  ${PO_P_PAGE_BILLING_TEXT_ID}  9
    ${szoveg} =  get text  ${elem}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the billing street text
    [Documentation]  Visszaadja a számlázási blokk-on belüli az utca input mező
                ...  label text-jét.
    ${elem} =  elem from list  ${PO_P_PAGE_BILLING_TEXT_ID}  10
    ${szoveg} =  get text  ${elem}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the billing housenumber text
    [Documentation]  Visszaadja a számlázási blokk-on belüli a házszám input mező
                ...  label text-jét.
    ${elem} =  elem from list  ${PO_P_PAGE_BILLING_TEXT_ID}  11
    ${szoveg} =  get text  ${elem}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the billing door text
    [Documentation]  Visszaadja a számlázási blokk-on belüli a ajtó input mező
                ...  label text-jét.
    ${elem} =  elem from list  ${PO_P_PAGE_BILLING_TEXT_ID}  12
    ${szoveg} =  get text  ${elem}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the billing floor text
    [Documentation]  Visszaadja a számlázási blokk-on belüli az emelet input mező
                ...  label text-jét.
    ${elem} =  elem from list  ${PO_P_PAGE_BILLING_TEXT_ID}  13
    ${szoveg} =  get text  ${elem}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the new contact button text
    [Documentation]  Visszaadja az új kontakt létrehozása gomb szövegét.
    ${szoveg} =  get text  ${PO_P_PAGE_CONTACT_BUTTON_TEXT_ID}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the contact title text
    [Documentation]  Visszaadja az Elérhetőségekhez tartozó cím szövegét.
    ${szoveg} =  get text  ${PO_P_PAGE_CONTACT_TITlE_TEXT_ID}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the firt contact Title text
    [Documentation]  Visszaadja a kontakt részhez tartozó cím szövegét.
    ${szoveg} =  get text  ${PO_P_PAGE_FIRST_CONTACT_TITLE_TEXT_ID}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the contact firstname text
    ${elem} =  elem from list  ${PO_P_PAGE_CONTACT_TEXT_ID}  0
    ${szoveg} =  get text  ${elem}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the contact secondname text
    ${elem} =  elem from list  ${PO_P_PAGE_CONTACT_TEXT_ID}  1
    ${szoveg} =  get text  ${elem}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the contact phone text
    ${elem} =  elem from list  ${PO_P_PAGE_CONTACT_TEXT_ID}  2
    ${szoveg} =  get text  ${elem}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the contact email text
    ${elem} =  elem from list  ${PO_P_PAGE_CONTACT_TEXT_ID}  3
    ${szoveg} =  get text  ${elem}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the job text
    ${elem} =  elem from list  ${PO_P_PAGE_CONTACT_TEXT_ID}  4
    ${szoveg} =  get text  ${elem}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the back button text
    [Documentation]  Visszaadja a vissza a listához gomb szövegét.
    ${szoveg} =  get text  ${PO_P_PAGE_BUTTON_BACK_TEXT_ID}
    log  ${szoveg}
    [Return]  ${szoveg}

Get he save button text
    [Documentation]  Visszaadja a mentés gomb szövegét
    ${szoveg} =  get text  ${PO_P_PAGE_BUTTON_SAVE_TEXT_ID}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the delete button text
    [Documentation]  Visszaadja a mentés gomb szövegét
    ${szoveg} =  get text  ${PO_P_PAGE_BUTTON_DELETE_TEXT_ID}
    log  ${szoveg}
    [Return]  ${szoveg}


Get partner firstname input is visiable
    [Documentation]  Megnézi, hogy a partner adatain belül a keresztnév mező megjelenik-e.
    Element should be visible  ${PO_P_PAGE_INPUT_PARTNER_FIRSTNAME_ID}

Get partner lastname input is visiable
    [Documentation]  Megnézi, hogy a partner adatain belül a vezeténév mező megjelenik-e.
    Element should be visible  ${PO_P_PAGE_INPUT_PARTNER_LASTNAME_ID}

Get partner email input is visiable
    [Documentation]  Megnézi, hogy a partner adatain belül az email mező megjelenik-e.
    element should be visible  ${PO_P_PAGE_INPUT_PARTNER_EMAIL_ID}

Get company company name input is visiable
    [Documentation]  Megnézi, hogy a céginformáción belül a cég neve mező megjelenik-e.
    element should be visible  ${PO_P_PAGE_INPUT_COMPANY_COMPANY_NAME_ID}

Get company company long name input is visiable
    [Documentation]  Megnézi, hogy a céginformáción belül a cég hosszú neve az megjelenik-e.
    element should be visible  ${PO_P_PAGE_INPUT_COMPANY_COMPANY_LONG_NAME_ID}

Get company country input is visiable
    [Documentation]  Megnézi, hogy a céginformáción belül az országválasztó megjelenik-e.
    element should be visible  ${PO_P_PAGE_INPUT_COMPANY_COUNTRY_ID}

Get company zipcode input is visiable
    [Documentation]  Megnézi, hogy a céginformáción belül az irányítószám input mező megjelenik-e.
    element should be visible  ${PO_P_PAGE_INPUT_COMPANY_ZIPCODE_ID}

Get company city input is visiable
    [Documentation]  Megnézi, hogy a céginformáción belül a város irányítószám az megjelenik-e.
    element should be visible  ${PO_P_PAGE_INPUT_COMPANY_CITY_ID}

Get company county input is visiable
    [Documentation]  Megnézi, hogy a céginformáción belül a Megye megjelenik-e.
    element should be visible  ${PO_P_PAGE_INPUT_COMPANY_COUNTY_ID}

Get company street input is visiable
    [Documentation]  Megnézi, hogy a céginformáción belül a street megjelenik-e.
    element should be visible  ${PO_P_PAGE_INPUT_COMPANY_STREET_ID}

Get company housenumber input is visiable
    [Documentation]  Megnézi, hogy a céginformáción belül a házszám megjelenik-e.
    element should be visible  ${PO_P_PAGE_INPUT_COMPANY_HOUSENUMBER_ID}

Get company door input is visiable
    [Documentation]  Megnézi, hogy a céginformáción belül az ajtó input mező megjelenik-e.
    element should be visible  ${PO_P_PAGE_INPUT_COMPANY_DOOR_ID}

Get company floor input is visiable
    [Documentation]  Megnézi, hogy a céginformáción belül az emelet input megző megjelenik-e.
    element should be visible  ${PO_P_PAGE_INPUT_COMPANY_FLOOR_ID}

Get billing name input is visiable
    [Documentation]  Megnézi, hogy a számlázáson belül a név az megjelenik-e.
    element should be visible  ${PO_P_PAGE_INPUT_BILLING_NAME_ID}

Get billing taxnumber input is visiable
    [Documentation]  Megnézi, hogy a számlázáson belül az adószám megjelenik-e.
    element should be visible  ${PO_P_PAGE_INPUT_BILLING_TAXNUMBER_ID}

Get billing bank name input is visiable
    [Documentation]  Megnézi, hogy a számlázáson belül a bank input mező megjelenik-e.
    element should be visible  ${PO_P_PAGE_INPUT_BILLING_BANKNAME_ID}

Get billing bankaccountnumber input is visiable
    [Documentation]  Megnézi, hogy a számlázáson belül a bankszámlaszám mező megjelenik-e.
    element should be visible  ${PO_P_PAGE_INPUT_BILLING_BANKNUMBER_ID}

Get billing iban input is visiable
    [Documentation]  Megnézi, hogy a számlázáson belül a iban mező megjelenik-e.
    element should be visible  ${PO_P_PAGE_INPUT_BILLING_IBAN_ID}

Get billing swift input is visiable
    [Documentation]  Megnézi, hogy a számlázáson belül a swift mező megjelenik-e.
    element should be visible  ${PO_P_PAGE_INPUT_BILLING_SWIFT_ID}

Get billing country input is visiable
    [Documentation]  Megnézi, hogy a számlázáson belül az ország választó megjelenik-e.
    element should be visible  ${PO_P_PAGE_INPUT_BILLING_SWIFT_ID}

Get billing zipcode input is visiable
    [Documentation]  Megnézi, hogy a számlázáson belül a város mező megjelenik-e.
    element should be visible  ${PO_P_PAGE_INPUT_BILLING_ZIPCODE_ID}

Get billing city input is visiable
    [Documentation]  Megnézi, hogy a számlázáson belül a város mező megjelenik-e.
    element should be visible  ${PO_P_PAGE_INPUT_BILLING_CITY_ID}

Get billing county input is visiable
    [Documentation]  Megnézi, hogy a számlázáson belül a város mező megjelenik-e.
    element should be visible  ${PO_P_PAGE_INPUT_BILLING_COUNTY_ID}

Get billing street input is visiable
    [Documentation]  Megnézi, hogy a számlázáson belül az utca mező megjelenik-e.
    element should be visible  ${PO_P_PAGE_INPUT_BILLING_COUNTY_ID}

Get billing housenumber input is visiable
    [Documentation]  Megnézi, hogy a számlázáson belül az utca mező megjelenik-e.
    element should be visible  ${PO_P_PAGE_INPUT_BILLING_HOUSENUMBER_ID}

Get billing door input is visiable
    [Documentation]  Megnézi, hogy a számlázáson belül az ajtó mező megjelenik-e.
    element should be visible  ${PO_P_PAGE_INPUT_BILLING_DOOR_ID}

Get billing floor input is visiable
    [Documentation]  Megnézi, hogy a számlázáson belül az emelet mező megjelenik-e.
    element should be visible  ${PO_P_PAGE_INPUT_FLOOR_ID}

Get new contact button is visiable
    [Documentation]  Megnézi, hogy az új elérhetőség hozzáadása a gomb az megjelenik-e.
    element should be visible  ${PO_P_PAGE_BUTTON_NEW_CONTACT_ID}

Get contact firstname input is visiable
    [Documentation]  Megnézi, hogy az keresztnév input mező megjelenik-e.
    element should be visible  ${PO_P_PAGE_CONTACT_FIRSTNAME_ID}

Get contact lastname input is visiable
    [Documentation]  Megnézi, hogy a vezetéknév input mező megjelenik-e.
    element should be visible  ${PO_P_PAGE_CONTACT_LASTNAME_ID}

Get contact phone input is visiable
    [Documentation]  Megnézi, hogy a telefonszám input mező megjelenik-e.
    element should be visible  ${PO_P_PAGE_CONTACT_PHONE_ID}

Get contact email input is visiable
    [Documentation]  Megnézi, hogy a email input mező megjelenik-e.
    element should be visible  ${PO_P_PAGE_CONTACT_EMAIL_ID}

Get contact jobdescription input is visible
    [Documentation]  Megnézi, hogy a munkakör input mező megjelenik-e.
    element should be visible  ${PO_P_PAGE_CONTACT_JOB_ID}

Get back button is visible
    [Documentation]  Megnézi, hogy a vissza gomb megjelenik-e.
    element should be visible  ${PO_P_PAGE_BUTTON_BACK_ID}

Get save button is visible
    [Documentation]  Megnézi, hogy a mentés gomb megjelenik-e.
    element should be visible  ${PO_P_PAGE_BUTTON_SAVE_ID}

Get firstname div object of partnerinfo
    [Documentation]  A partner létrehozása oldalon visszaadja keresztnév label objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  xpath=//label
    log  ${elem}
    ${egye_elem} =  get from list  ${elem}  0
    log  ${egye_elem}
    [Return]  ${egye_elem}

Get lastname div object of partnerinfo
    [Documentation]  A partner létrehozása oldalon visszaadja vezetéknév label objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  1
    [Return]  ${egye_elem}

Get email div object of partnerinfo
    [Documentation]  A partner létrehozása oldalon visszaadja email label objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  2
    [Return]  ${egye_elem}

Get companynev div object of companyinfo
    [Documentation]  A partner létrehozása oldalon visszaadja email
                ...  label objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  3
    [Return]  ${egye_elem}

Get company lognev div object of companyinfo
    [Documentation]  A partner létrehozása oldalon visszaadja
                ...  cég hosszabb megnevezése objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  4
    [Return]  ${egye_elem}

Get company regnumber div object of companyinfo
    [Documentation]  A partner létrehozása oldalon visszaadja
                ...  cégjegyzékszám megnevezése objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  5
    [Return]  ${egye_elem}

Get company country div object of companyinfo
    [Documentation]  A partner létrehozása oldalon visszaadja a partnerinfon
                ...  belüli ország megnevezése objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  6
    [Return]  ${egye_elem}

Get company zipcode div object of companyinfo
    [Documentation]  A partner létrehozása oldalon visszaadja a partnerinfon
                ...  belüli zipcode megnevezése objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  7
    [Return]  ${egye_elem}

Get company city div object of companyinfo
    [Documentation]  A partner létrehozása oldalon visszaadja a partnerinfon
                ...  belüli város/település megnevezése objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  8
    [Return]  ${egye_elem}

Get company county div object of companyinfo
    [Documentation]  A partner létrehozása oldalon visszaadja a partnerinfon
                ...  belüli a megye megnevezése objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  9
    [Return]  ${egye_elem}

Get company street div object of companyinfo
    [Documentation]  A partner létrehozása oldalon visszaadja a partnerinfon
                ...  belüli a street megnevezése objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  10
    [Return]  ${egye_elem}

Get company housenumber div object of companyinfo
    [Documentation]  A partner létrehozása oldalon visszaadja a partnerinfon
                ...  belüli a housenumber megnevezése objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  11
    [Return]  ${egye_elem}

Get company door div object of companyinfo
    [Documentation]  A partner létrehozása oldalon visszaadja a partnerinfon
                ...  belüli az ajtó megnevezése objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  12
    [Return]  ${egye_elem}

Get company floor div object of companyinfo
    [Documentation]  A partner létrehozása oldalon visszaadja a partnerinfon
                ...  belüli az emelet megnevezése objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  13
    [Return]  ${egye_elem}

Get name div object of billinginfo
    [Documentation]  A partner létrehozása oldalon visszaadja a számlázási részen
                ...  belüli a név megnevezése objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  14
    [Return]  ${egye_elem}

Get taxnumber div object of billinginfo
    [Documentation]  A partner létrehozása oldalon visszaadja a számlázási részen
                ...  belüli a adószám objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  15
    [Return]  ${egye_elem}

Get bankname div object of billinginfo
    [Documentation]  A partner létrehozása oldalon visszaadja a számlázási részen
                ...  belüli a banknév objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  16
    [Return]  ${egye_elem}

Get banknumber div object of billinginfo
    [Documentation]  A partner létrehozása oldalon visszaadja a számlázási részen
                ...  belüli a banknumber objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  17
    [Return]  ${egye_elem}

Get iban div object of billinginfo
    [Documentation]  A partner létrehozása oldalon visszaadja a számlázási részen
                ...  belüli iban objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  18
    [Return]  ${egye_elem}

Get swift div object of billinginfo
    [Documentation]  A partner létrehozása oldalon visszaadja a számlázási részen
                ...  belüli swfit objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  19
    [Return]  ${egye_elem}

Get country div object of billinginfo
    [Documentation]  A partner létrehozása oldalon visszaadja a számlázási részen
                ...  belüli ország objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  20
    [Return]  ${egye_elem}

Get zipcode div object of billinginfo
    [Documentation]  A partner létrehozása oldalon visszaadja a számlázási részen
                ...  belüli zipcode objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  21
    [Return]  ${egye_elem}

Get city div object of billinginfo
    [Documentation]  A partner létrehozása oldalon visszaadja a számlázási részen
                ...  belüli a város objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  22
    [Return]  ${egye_elem}

Get county div object of billinginfo
    [Documentation]  A partner létrehozása oldalon visszaadja a számlázási részen
                ...  belüli megye objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  23
    [Return]  ${egye_elem}

Get street div object of billinginfo
    [Documentation]  A partner létrehozása oldalon visszaadja a számlázási részen
                ...  belüli utca objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  24
    [Return]  ${egye_elem}

Get housenumber div object of billinginfo
    [Documentation]  A partner létrehozása oldalon visszaadja a számlázási részen
                ...  belüli házszám objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  25
    [Return]  ${egye_elem}

Get door div object of billinginfo
    [Documentation]  A partner létrehozása oldalon visszaadja a számlázási részen
                ...  belüli ajtó objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  26
    [Return]  ${egye_elem}

Get floor div object of billinginfo
    [Documentation]  A partner létrehozása oldalon visszaadja a számlázási részen
                ...  belüli floor objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  27
    [Return]  ${egye_elem}

Get firstname div object of contact
    [Documentation]  A partner létrehozása oldalon visszaadja az elérhetőségi részen
                ...  belüli keresztnév objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  28
    [Return]  ${egye_elem}

Get lastname div object of contact
    [Documentation]  A partner létrehozása oldalon visszaadja az elérhetőségi részen
                ...  belüli vezetéknév objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  29
    [Return]  ${egye_elem}

Get phone div object of contact
    [Documentation]  A partner létrehozása oldalon visszaadja az elérhetőségi részen
                ...  belüli telefonszám objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  30
    [Return]  ${egye_elem}

Get email div object of contact
    [Documentation]  A partner létrehozása oldalon visszaadja az elérhetőségi részen
                ...  belüli email objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  31
    [Return]  ${egye_elem}

Get jobdescription div object of contact
    [Documentation]  A partner létrehozása oldalon visszaadja az elérhetőségi részen
                ...  belüli munkakör objectumot
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_P_PAGE_LABEL_ID}
    ${egye_elem} =  get from list  ${elem}  32
    [Return]  ${egye_elem}

Give the company name in new partner page
    [Documentation]  Az új partner létrehozása oldalon megadja a cégnevet.
    [Arguments]  ${szoveg}
    input text  ${PO_P_PAGE_COM_NAME_NEW_PARTNER_ID}  ${szoveg}

Give the contact firstname
    [Documentation]  Megadja a contact-hoz tartozó keresztnevet
    [Arguments]  ${szoveg}
    input text  ${PO_P__CONTACT_FIRSTNAME_ID}  ${szoveg}

Give the contact lastname
    [Documentation]  Megadja a contact-hoz tartozó vezetéknevet
    [Arguments]  ${szoveg}
    input text  ${PO_P__CONTACT_LASTNAME_ID}  ${szoveg}

Give the contact email
    [Documentation]  Megadja a contact-hoz tartozó email címet
    [Arguments]  ${szoveg}
    input text  ${PO_P_CONTACT_EMAIL_ID}  ${szoveg}

Give the jobdescription
    [Documentation]  Megadja a foglalkozást
    [Arguments]  ${szoveg}
    input text  ${PO_P_JOBDESCRIPTION_ID}   ${szoveg}

Waiting the partner page loaded
    Wait the search input apper
    sleep  1s

Wait the search input apper
    [Documentation]
    wait until element is visible  ${PO_PARTNERS_SEARCH_INPUT_ID}

Get title of partner details
    [Documentation]  Visszaadja a partner oldal megtekintésének a címét.
    ${szoveg} =  get text  ${PARTNER_DETAILS_TITTLE_ID}
    [Return]  ${szoveg}

Get common text of partner details page
    [Documentation]   A partnszer részletei oldalról visszaadja a cégnév szöveget
    [Arguments]  ${index}
    Log  ${index}
    @{elem} =  SeleniumLibrary.Get WebElements  ${PARTNER_DETAILS_TEXT_ID}
    ${egye_elem} =  get from list  ${elem}  ${index}
    ${szoveg} =  get text  ${egye_elem}
    [Return]  ${szoveg}


Get company name text of partner details page
    [Documentation]   A partnszer részletei oldalról visszaadja a cégnév szöveget
    @{elem} =  SeleniumLibrary.Get WebElements  ${PARTNER_DETAILS_TEXT_ID}
    ${egye_elem} =  get from list  ${elem}  0
    ${szoveg} =  get text  ${egye_elem}
    [Return]  ${szoveg}

Get company longname text of partner details page
    [Documentation]   A partnszer részletei oldalról visszaadja
                 ...  a cég hosszabb szöveget
    @{elem} =  SeleniumLibrary.Get WebElements  ${PARTNER_DETAILS_TEXT_ID}
    ${egye_elem} =  get from list  ${elem}  1
    ${szoveg} =  get text  ${egye_elem}
    [Return]  ${szoveg}

Get company regnumber text of partner details page
    [Documentation]   A partnszer részletei oldalról visszaadja
                 ...  a cég hosszabb szöveget
    @{elem} =  SeleniumLibrary.Get WebElements  ${PARTNER_DETAILS_TEXT_ID}
    ${egye_elem} =  get from list  ${elem}  2
    ${szoveg} =  get text  ${egye_elem}
    [Return]  ${szoveg}

Get company address text of partner details page
    [Documentation]   A partnszer részletei oldalról visszaadja
                 ...  a cég címének szöveget
    @{elem} =  SeleniumLibrary.Get WebElements  ${PARTNER_DETAILS_TEXT_ID}
    ${egye_elem} =  get from list  ${elem}  3
    ${szoveg} =  get text  ${egye_elem}
    [Return]  ${szoveg}

Get company status text of partner details page
    [Documentation]   A partnszer részletei oldalról visszaadja
                 ...  a cég státusz szöveget
    @{elem} =  SeleniumLibrary.Get WebElements  ${PARTNER_DETAILS_TEXT_ID}
    ${egye_elem} =  get from list  ${elem}  4
    ${szoveg} =  get text  ${egye_elem}
    [Return]  ${szoveg}

Get billing name text of partner details page
    [Documentation]   A partnszer részletei oldalról visszaadja
                 ...  a cég státusz szöveget
    @{elem} =  SeleniumLibrary.Get WebElements  ${PARTNER_DETAILS_TEXT_ID}
    ${egye_elem} =  get from list  ${elem}  5
    ${szoveg} =  get text  ${egye_elem}
    [Return]  ${szoveg}

Wait the partner details page loaded
    [Documentation]  Megvárja amíg a partner részleteinek az oldala
                ...  betöltődik.
    wait until element is visible  ${PARTNER_DETAILS_TITTLE_ID}
    sleep  1s

Get the company information title
    @{elem} =  SeleniumLibrary.Get WebElements  xpath=//*[@class="box-title"]
    ${egye_elem} =  get from list  ${elem}  0
    ${szoveg} =  get text  ${egye_elem}
    Log  ${szoveg}
    #@{szovegek} =  mylibrary.split the text  ${szoveg}  ${SPACE}
    #mylibrary.split the text  ${valami}  ${SPACE}
    #[Return]  ${egye_elem}

Get company name value from partner details page
    [Documentation]  A partner részleteinek az olaláról visszaadja a cég nevét.
    @{elem} =  SeleniumLibrary.Get WebElements  xpath=//*[@class="box-title"]
    ${egye_elem} =  get from list  ${elem}  0
    ${szoveg} =  get text  ${egye_elem}
    Log  ${szoveg}

Get common value from partner details page
    [Documentation]  A partner részleteinek az olaláról visszaadja a megadott elemet.
    [Arguments]  ${index}
    @{elem} =  SeleniumLibrary.Get WebElements  xpath=//*[@class="lead"]
    ${egye_elem} =  get from list  ${elem}  ${index}
    ${szoveg} =  get text  ${egye_elem}
    Log  ${szoveg}
    [Return]  ${szoveg}