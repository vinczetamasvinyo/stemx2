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
${PO_PROGRAMOK_CREATE_TICKET_BUTTON_ID} =  //*[@ng-reflect-label="create_ticket"]
${PO_PROGRAMOK_START_DATE_ID} =  //*[@formcontrolname="startDateTime"]
${PO_PROGRAMOK_CREATE_DATATIME_ID} =  //*[@ng-reflect-label="create_date_time"]
${PO_PROGRAMOK_TICKET_ASSIGNMENT_ROW_ID} =  //mat-expansion-panel-header

*** Keywords ***
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
    Choose item from listbox  ${elem}  //*[@formcontrolname="taxId"]

Give the ives jegy sablon
    [Documentation]  Megadja az íves jegy sablon típusát
    [Arguments]  ${elem}
    Choose item from listbox  ${elem}  ${PO_PROGRAMOK_LISTBOX_IVES_ID}

Give the darabos jegy sablon
    [Documentation]  Megadja az darabos jegy sablon típusát
    [Arguments]  ${elem}
    Choose item from listbox  ${elem}  ${PO_PROGRAMOK_LISTBOX_DB_ID}

Give the electronic jegy sablon
    [Documentation]  Megadja az electroni jegy sablon típusát
    [Arguments]  ${elem}
    Choose item from listbox  ${elem}  ${PO_PROGRAMOK_LISTBOX_ELECTRONIC_ID}


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

Click the select button ont place step page
    Click the select button

Wait the venues data loaded on the place page
    [Documentation]  Megvárja amígy a venue adatai beöltődnek.
    wait until element is visible  ${PO_PROGRAMOK_VENUES_DATA_ID}

Give the ticket type name on the program create
    [Documentation]  Megadja a ticket típusának a nevét.
    [Arguments]  ${text}
    input text  ${PO_PROGRAMOK_TICKET_TYPE_NAME}  ${text}

Waiting the tickets step page loaded
    [Documentation]  Megvárja amíg a jegyek oldal betöltődik a program léterhozása során
    wait until element is visible  ${PO_PROGRAMOK_TICKET_TYPE_NAME}

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

Click the create datetime
    [Documentation]  Rákattint az időpont létrehoására
    click element  ${PO_PROGRAMOK_CREATE_DATATIME_ID}

Waiting the ticket assignment page loaded
    [Documentation]  Megvárja amíg a ticket hozzárendelő oldal betöltődik.
    wait until element is visible  ${PO_PROGRAMOK_TICKET_ASSIGNMENT_ROW_ID}

