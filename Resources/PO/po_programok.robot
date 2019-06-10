*** Settings ***
Library  SeleniumLibrary
Resource  ../Common_resource.robot

*** Variables ***
${PO_PROGRAMOK_SEARCH_INPUT_ID} =  xpath=//*[@formcontrolname="programName"]
${PO_PROGRAMOK_PROGRAM_NAME_INPUT_ID} =  xpath=//*[@formcontrolname="name"]
${PO_PROGRAMOK__INPUT_ID} =  xpath=//*[@formcontrolname="name"]
${PO_PROGRAMOK_SHORT_DESCRIPTION_ID} =  xpath=//*[@formcontrolname="shortDescription"]
${PO_PROGRAMOK_LISTBOX_IVES_ID} =  //*[@formcontrolname="sheet"]
${PO_PROGRAMOK_LISTBOX_DB_ID} =  //*[@formcontrolname="pieces"]
${PO_PROGRAMOK_LISTBOX_ELECTRONIC_ID} =  //*[@formcontrolname="electronic"]
${PO_PROGRAMOK_GALLARY_ID} =  xpath=//*[@class="upload-image"]
${PO_PROGRAMOK_INPUT} =  xpath=//input
${PO_PROGRAMOK_SELECT_BUTTON_ID} =  xpath=//app-button[@ng-reflect-label="admin_label_select"]
${PO_PROGRAMOK_VENUES_DATA_ID} =  //*[@class="row program-place-item"]
${PO_PROGRAMOK_TICKET_TYPE_NAME} =  //*[@formcontrolname="name"]
${PO_PROGRAMOK_TICKET_TYPE_PRICE_ID} =  //*[@formcontrolname="price"]
${PO_PROGRAMOK_TICKET_CAPACITY_ID} =  //*[@formcontrolname="maxCapacity"]
${PO_PROGRAMOK_TICKET_GROUP_ID} =  //*[@formcontrolname="group"]
${PO_PROGRAMOK_CREATE_TICKET_BUTTON_ID} =  //*[contains(@class,'create-new-ticket-column')]//app-button
${PO_PROGRAMOK_START_DATE_ID} =  //*[@formcontrolname="startDateTime"]
${PO_PROGRAMOK_CREATE_DATATIME_ID} =  //*[contains(@class,'new-date-time-column')]//app-button
${PO_PROGRAMOK_TICKET_ASSIGNMENT_ROW_ID} =  //mat-expansion-panel-header
${PO_PROGRAMOK_LONG_DESCRIPTION_ID} =  //*[@role="textbox"]
${PO_PROGRAMOK_TAX_LISTBOX_ID} =  //*[@formcontrolname="taxId"]
${PO_PROGRAMOK_TICKET_DEFAULT_TYPE_ID} =  //*[@formcontrolname="defaultBoxOfficeTicketFormatType"]
${PO_PROGRAMOK_FREE_EVENT_TICKET_ID} =  //*[@formcontrolname="isFree"]
${PO_PROGRAMOK_PICTURE_ID} =  id=imageUpload
${PO_PROGRAMOK_PICTURE_CONTAINER_ID} =  //*[contains(@class,'it-thumbnail')]
${PO_PROGRAMOK_EVENTS_HEADER_IN_THE_TICKETS_ASSIGN_ID} =  //app-programs-ticket-assign//mat-expansion-panel-header
${PO_PROGRAMOK_EVENTS_BLOCK_ID} =  //app-programs-ticket-assign//mat-expansion-panel
${PO_PROGRAMOK_EVENTS_SUBPANEL_ID} =  //*[@class="ticket-list-container"]
${PO_PROGRAMOK_ALL_TICKETS_CHECKBOX_ID} =  //*[contains(@class,'tickets-header')]//mat-checkbox
${PO_PROGRAMOK_EVENTS_ID_AFTER_GIVE} =  //app-programs-date-time-item
${PO_PROGRAMOK_TICKETS_ID_AFTER_GIVE} =  //app-programs-ticket
${PO_PROGRAMOK_TICKETS_NAME_ID} =  //*[@class="ticket-name"]


*** Keywords ***
wait the ticket group input filed visiable in the programs page
    [Documentation]  Megvárja amíg megjelenik a ticket csoport mező
    wait until element is visible  ${PO_PROGRAMOK_TICKET_GROUP_ID}

wait the search input visiable in the programs page
    [Documentation]  Megvárja amíg a programok oldalon megjelenik a kereső
    wait until element is visible  ${PO_PROGRAMOK_SEARCH_INPUT_ID}

wait until the program name input field visiable
    [Documentation]  Megvárja amíg a program neve mező megjelenik
    wait until element is visible  ${PO_PROGRAMOK_PROGRAM_NAME_INPUT_ID}

Give the program name
    [Documentation]  Megadja a program létrehozása oldalon a program nevét
    [Arguments]  ${text}
    input text  ${PO_PROGRAMOK_PROGRAM_NAME_INPUT_ID}  ${text}

Give the program short description
    [Documentation]  Megadja a program létrehozása oldalon a program leírását
    [Arguments]  ${text}
    input text  ${PO_PROGRAMOK_SHORT_DESCRIPTION_ID}  ${text}

Give the vat class
    [Documentation]  Megadja az áfaosztályt
    [Arguments]  ${elem}
    Choose item from listbox  ${elem}  ${PO_PROGRAMOK_TAX_LISTBOX_ID}

Give the vat class by by index or name
    [Documentation]  A programok oldalon megadja az áfa értéket az index
                ...  vagy ném alapján.
    [Arguments]  ${data}
    Choose item from listbox by index or name  ${data}  ${PO_PROGRAMOK_TAX_LISTBOX_ID}

Give the ives jegy sablon
    [Documentation]  Megadja az íves jegy sablon típusát
    [Arguments]  ${elem}
    Choose item from listbox  ${elem}  ${PO_PROGRAMOK_LISTBOX_IVES_ID}

Give the ives ticket template by index
    [Documentation]  Megadja az íves jegy formátumát index alapján.
    [Arguments]  ${index}
    Choose item from listbox by index  ${PO_PROGRAMOK_LISTBOX_IVES_ID}  ${index}

Give the ives ticket template by index or name
    [Documentation]  Megadja az íves ticket formátum típus index vagy név alapján
    [Arguments]  ${data}
    Choose item from listbox by index or name  ${data}  ${PO_PROGRAMOK_LISTBOX_IVES_ID}

Give the darabos jegy sablon
    [Documentation]  Megadja a darabos jegy sablon típusát
    [Arguments]  ${elem}
    Choose item from listbox  ${elem}  ${PO_PROGRAMOK_LISTBOX_DB_ID}

Give the db tickets template by index
    [Documentation]  Megadja a darabos jegy sablon típusát index alapján.
    [Arguments]  ${index}
    Choose item from listbox by index  ${PO_PROGRAMOK_LISTBOX_DB_ID}  ${index}

Give the db tickets template by index or name
    [Documentation]  Megadja a darabos jegy sablon típusát index vagy név alapján.
    [Arguments]  ${data}
    Choose item from listbox by index or name  ${data}  ${PO_PROGRAMOK_LISTBOX_DB_ID}

Give the electronic jegy sablon
    [Documentation]  Megadja az electroni jegy sablon típusát
    [Arguments]  ${elem}
    Choose item from listbox  ${elem}  ${PO_PROGRAMOK_LISTBOX_ELECTRONIC_ID}

Give the electronic ticket template be index
    [Documentation]  Megadja az elektronikus sablon típusát
    [Arguments]  ${index}
    Choose item from listbox by index  ${PO_PROGRAMOK_LISTBOX_ELECTRONIC_ID}  ${index}

Give the electronic ticket template be name or index
    [Documentation]  Megadja az elektronikus sablon típusát name vagy index alapján.
    [Arguments]  ${data}
    Choose item from listbox by index or name  ${data}  ${PO_PROGRAMOK_LISTBOX_ELECTRONIC_ID}

Give the ticket default type be name or index
    [Documentation]  A programok oldalon
    [Arguments]  ${data}
    Click raido button by name or index  ${data}  ${PO_PROGRAMOK_TICKET_DEFAULT_TYPE_ID}

Click the ives
    click element  xpath=//*[@class="mat-radio-label"]

Wait the gallery step page loaded
    [Documentation]  Megvárja amígy a galéria lépés oldala betöltődik
    wait until element is visible  ${PO_PROGRAMOK_GALLARY_ID}

Wait the palce step page loaded
    [Documentation]  Megvárja amíg az input mező megjelenik.
    wait until element is visible  ${PO_PROGRAMOK_INPUT}  10

Give the venues name in the program create step page
    [Documentation]  Megadja az előadóhely nevét a program létrehozása lépésnél
    [Arguments]  ${text}
    input text  ${PO_PROGRAMOK_INPUT}  ${text}

Click the select button on place step page
    Click the select button

Wait the venues data loaded on the place page
    [Documentation]  Megvárja amígy a venue adatai beöltődnek.
    Waiting the page loaded finish
    wait until element is visible  ${PO_PROGRAMOK_VENUES_DATA_ID}

Give the ticket type name on the program create
    [Documentation]  Megadja a ticket típusának a nevét.
    [Arguments]  ${text}
    input text  ${PO_PROGRAMOK_TICKET_TYPE_NAME}  ${text}

Waiting the date step page loaded
    [Documentation]  Megvárja amíg az időpont oldal betöltődik
                ...  a program létrehozása során
    wait until element is visible  ${PO_PROGRAMOK_START_DATE_ID}  20  Az esemény letrehozása oldal nem töltődött be
    sleep  1s

Click the free event ticket on the date step page
    [Documentation]  belekattint az ingyenes eseménybe
    Click checkbox by index  1  ${PO_PROGRAMOK_FREE_EVENT_TICKET_ID}

Waiting the create datetime button is visiable
    [Documentation]  Megvárja amíg az időpont hozzáadása gombt active lesz
    Wait until element is active own  ${PO_PROGRAMOK_CREATE_DATATIME_ID}

Click the create datetime
    [Documentation]  Rákattint az időpont létrehoására
    click element  ${PO_PROGRAMOK_CREATE_DATATIME_ID}

Waiting the create datetime button is visiable and click
    [Documentation]  Megvárja amígy az időpont létrehozása gomb aktív lesz
                ...  majd rákattint.
    Waiting the create datetime button is visiable
    Click the create datetime

Waiting the category step page loaded
    [Documentation]  Megvárja amíg a kategória oldal betöltődik
                ...  a program létrehozása során
    wait until element is visible  //*[@class="mat-radio-container"]    20
    sleep  1s

Waiting the subcategory visiable
    [Documentation]  Megvárja amígy a subcategory megjelenik.
    wait until element is visible  //mat-checkbox  20

Give the ticket price on the program create
    [Documentation]  Megadja a jegyhezu tartozó árat.
    [Arguments]  ${text}
    input text  ${PO_PROGRAMOK_TICKET_TYPE_PRICE_ID}  ${text}

Give the max capacity on the program create
    [Documentation]  Megadja a jegyhez tartozó capacitást
    [Arguments]  ${text}
    input text  ${PO_PROGRAMOK_TICKET_CAPACITY_ID}  ${text}

Give the group on the program create
    [Documentation]  Megadja a jegyhez tartozó capacitást
    [Arguments]  ${text}
    input text  ${PO_PROGRAMOK_TICKET_GROUP_ID}  ${text}

Click the create ticket button on the create program
    [Documentation]  Megnyomja a jegy
    click element  ${PO_PROGRAMOK_CREATE_TICKET_BUTTON_ID}

Give the start date on the program create
    [Documentation]  Megadja a program kezdeti dátumát
    [Arguments]  ${text}
    input text  ${PO_PROGRAMOK_START_DATE_ID}  ${text}

Give the program time
    [Documentation]  megadja a program idejét
    [Arguments]  ${text}
    ${xpath} =  set variable  //*[@class="program-length-list-container"]//*[contains(text(),'${text}')]
    click element  ${xpath}



Waiting the ticket assignment page loaded
    [Documentation]  Megvárja amíg a ticket hozzárendelő oldal betöltődik.
    wait until element is visible  ${PO_PROGRAMOK_TICKET_ASSIGNMENT_ROW_ID}

Give the long description
    [Documentation]  Megadja a részletes leírást a programok oldalon.
    [Arguments]  ${text}
    input text  ${PO_PROGRAMOK_LONG_DESCRIPTION_ID}  ${text}

Give the main category by name or index
    [Documentation]  Kiválasztja a főkategóriát
    [Arguments]  ${data}
    Click raido button by name or index   ${data}

upload picture for the program
    [Documentation]  A programok oldalon feltölt egy képet.
    [Arguments]  ${picture}
    Common_resource.upload picture  ${PO_PROGRAMOK_PICTURE_ID}  ${picture}

upload pictures for the program
    [Documentation]  EGy listából feltölt képeket
    [Arguments]  ${listpicture}
    upload pictures  ${PO_PROGRAMOK_PICTURE_ID}  ${PO_PROGRAMOK_PICTURE_CONTAINER_ID}  ${listpicture}

Get events from the tickets assigne steppage
    [Documentation]  A jegy hozzárendelése alpageről vissza az eseményeket.
    @{lista} =  SeleniumLibrary.Get WebElements  ${PO_PROGRAMOK_EVENTS_HEADER_IN_THE_TICKETS_ASSIGN_ID}
    [Return]  ${lista}

Wait until the events subpanel visiable
    [Documentation]  Megvárja amíg a jegyek eseményhez rendelése oldalon egy eseményre való
                ...  kattintás után az alpanel megjelenik.
    [Arguments]  ${index}
    ${elso_resz} =  catenate  SEPARATOR=${EMPTY}  ${PO_PROGRAMOK_EVENTS_BLOCK_ID}  [
    ${masodik_resz} =  catenate  SEPARATOR=${EMPTY}  ]  ${PO_PROGRAMOK_EVENTS_SUBPANEL_ID}
    wait until element is visible  ${elso_resz}${index}${masodik_resz}

Wait until the events subpanel not visiable
    [Documentation]  Megvárja amíg a jegyek eseményhez rendelése oldalon egy eseményre való
                ...  kattintás után az alpanel már nem jelenik.
    [Arguments]  ${index}
    ${elso_resz} =  catenate  SEPARATOR=${EMPTY}  ${PO_PROGRAMOK_EVENTS_BLOCK_ID}  [
    ${masodik_resz} =  catenate  SEPARATOR=${EMPTY}  ]  ${PO_PROGRAMOK_EVENTS_SUBPANEL_ID}
    wait until element is not visible  ${elso_resz}${index}${masodik_resz}


Click the all ticket
    [Documentation]  Bekapcsolja az összes ticketet a jegyhozzárendelésnél.
    [Arguments]  ${index}
    ${elso_resz} =  catenate  SEPARATOR=${EMPTY}  ${PO_PROGRAMOK_EVENTS_BLOCK_ID}  [
    ${masodik_resz} =  catenate  SEPARATOR=${EMPTY}  ]  ${PO_PROGRAMOK_ALL_TICKETS_CHECKBOX_ID}
    click element  ${elso_resz}${index}${masodik_resz}

Wait until page contains count events
    [Documentation]  Megvárja amíg az esemény hozzáadása után az megjelenik az oldalon
    [Arguments]  ${db}
    Wait until page contains count elements  ${PO_PROGRAMOK_EVENTS_ID_AFTER_GIVE}  ${db}

Wait until page contains count tickets
    [Documentation]  Megvárja amíg a jegy hozzáadása után az megjelenik az oldalon
    [Arguments]  ${db}
    Wait until page contains count elements  ${PO_PROGRAMOK_TICKETS_ID_AFTER_GIVE}  ${db}

Get checkbox ticket list
    [Documentation]  visszaadja a ticket listát a program létrehozása oldalról
    [Arguments]  ${index}
    ${elso_resz} =  catenate  SEPARATOR=${EMPTY}  ${PO_PROGRAMOK_EVENTS_BLOCK_ID}  [
    ${masodik_resz} =  catenate  SEPARATOR=${EMPTY}  ]  ${PO_PROGRAMOK_TICKETS_NAME_ID}
    ${xpath} =  set variable  ${elso_resz}${index}${masodik_resz}
    #${xpath} =  set variable  //app-programs-ticket-assign//mat-expansion-panel[${index}]//*[@class="ticket-name"]
    @{lista} =  SeleniumLibrary.Get WebElements  ${xpath}
    ${szotar} =  create dictionary
    ${i} =  set variable  -1
    :FOR  ${valt}  IN  @{lista}
    \  ${i} =  Evaluate  ${i} + 1
    \  ${szoveg_eredeti} =  get text  ${valt}
    \  ${a} =  convert to string  ${i}
    \  set to dictionary  ${szotar}  ${szoveg_eredeti}  ${a}
    log  ${szotar}
    [Return]  ${szotar}

Click the ticket checkbox
    [Documentation]  Bekapcsolja a jegyeket
    [Arguments]  ${index}  ${szotar}  ${text}
    ${xpath} =  set variable  //mat-expansion-panel[${index}]//*[contains(@class,'ticket-container')]//mat-checkbox
    @{lista} =  SeleniumLibrary.Get WebElements  ${xpath}
    log  ${lista}
    ${db} =  get length  ${lista}
    log  ${db}
    log  ${szotar}[${text}]
    ${egye_elem} =  get from list  ${lista}  ${szotar}[${text}]
    click element  ${egye_elem}