*** Settings ***
Library  SeleniumLibrary
Resource  ../Common_resource.robot

*** Variables ***
${PO_VENUES_SEARCH_INPUT_ID} =  xpath=//*[@formcontrolname="searchText"]
${PO_VENUES_VENUES_NAME_INPUT_ID} =  xpath=//*[@formcontrolname="name"]
${PO_VENUES_VENUES_DESCRIPTION_INPUT_ID} =  xpath=//*[@formcontrolname="description"]
${PO_VENUES_VENUES_COUNTRY_ID} =  xpath=//*[@formcontrolname="country"]
${PO_VENUES_VENUES_ZIPCODE_ID} =  xpath=//*[@formcontrolname="zipCode"]
${PO_VENUES_VENUES_CITY_ID} =  xpath=//*[@formcontrolname="city"]
${PO_VENUES_VENUES_COUNTY_ID} =  xpath=//*[@formcontrolname="county"]
${PO_VENUES_VENUES_STREET_ID} =  xpath=//*[@formcontrolname="street"]
${PO_VENUES_VENUES_HOUSENUMBER_ID} =  xpath=//*[@formcontrolname="houseNumber"]
${PO_VENUES_VENUES_DOOR_ID} =  xpath=//*[@formcontrolname="door"]
${PO_VENUES_VENUES_FLOOR_ID} =  xpath=//*[@formcontrolname="floor"]
${PO_VENUES_NEW_AUDITORIUM_BUTTON_ID} =  xpath=//button[@class="button tiny"]
${PO_VENUES_NEW_AUDITORIUM_WIZARD_ID} =  xpath=//*[@class="row new-auditorium-container"]
${PO_VENUES_AUDITORIUM_NAME_ID} =  xpath=//*[@class="row new-auditorium-container"]//*[@formcontrolname="name"]
${PO_VENUES_AUDITORIUM_CAPACITY_ID} =  xpath=//*[@class="row new-auditorium-container"]//*[@formcontrolname="capacity"]
${PO_VENUES_AUDITORIUM_NOT_USE_VENUE_ADDRESS} =  xpath=//*[@formcontrolname="useVenueAddress"]
${PO_VENUES_AUDITORIUM_ZIPCODE} =  xpath=//*[@class="row new-auditorium-container"]//*[@formcontrolname="zipCode"]
${PO_VENUES_AUDITORIUM_CITY} =  xpath=//*[@class="row new-auditorium-container"]//*[@formcontrolname="city"]
${PO_VENUES_AUDITORIUM_COUNTY_ID} =  xpath=//*[@class="row new-auditorium-container"]//*[@formcontrolname="county"]
${PO_VENUES_AUDITORIUM_STREET_ID} =  xpath=//*[@class="row new-auditorium-container"]//*[@formcontrolname="street"]
${PO_VENUES_AUDITORIUM_HOUSE_NUMBER_ID} =  xpath=//*[@class="row new-auditorium-container"]//*[@formcontrolname="houseNumber"]
${PO_VENUES_AUDITORIUM_DOOR_ID} =  xpath=//*[@class="row new-auditorium-container"]//*[@formcontrolname="door"]
${PO_VENUES_AUDITORIUM_FLOOR_ID} =  xpath=//*[@class="row new-auditorium-container"]//*[@formcontrolname="floor"]
${PO_VENUES_ADD_AUDITORIUM_BUTTON_ID} =  xpath=//*[@class="row new-auditorium-container"]//*[@class="button success"]
${PO_VENUES_AUDITORIUM_COUNTRY_ID} =  //*[@class="row new-auditorium-container"]//*[@formcontrolname="country"]
${PO_VENUES_NAME_IN_TABLE_ID} =  xpath=//mat-cell[1]
${PO_VENUES_ADDRESS_IN_TABLE_ID} =  xpath=//mat-cell[2]
${PO_VENUES_AUDITORIUM_CONTAINER_ID} =  //shared-auditorium-expansion-panel

*** Keywords ***
Check the auditorium container visiable
    [Documentation]  Megnézi, hogy a hozzáadás során a nézőtér
                ...  rendben megjelenik-e.
    element should be visible  ${PO_VENUES_AUDITORIUM_CONTAINER_ID}

Get the auditoriums number
    [Documentation]  A létrehozás során visszaadja a nézőterek számát
    ${db} =  get element count  ${PO_VENUES_AUDITORIUM_CONTAINER_ID}
    [Return]  ${db}

Reload the venues page
    reload the page
    Wait until the venues page loaded

Wait until the venues page loaded
    [Documentation]  Megvárja amíg betöltődik a venues oldal.
    wait until element is visible  ${PO_VENUES_SEARCH_INPUT_ID}
    Waiting the page loaded finish

Give the venues name
    [Documentation]  Megadja a venue a nevét a létrehozása során
    [Arguments]  ${text}
    input text  ${PO_VENUES_VENUES_NAME_INPUT_ID}  ${text}

Give the venues description
    [Documentation]  Megadja a venue nevét a létrehozás során.
    [Arguments]  ${text}
    input text  ${PO_VENUES_VENUES_DESCRIPTION_INPUT_ID}  ${text}

Give the country of venue
    [Documentation]  Megadja a venue-hoz tartozó országot.
    [Arguments]  ${text}
    Choose item from listbox  ${text}  ${PO_VENUES_VENUES_COUNTRY_ID}

Give the zipcode of venue
    [Documentation]  Megadja a venue-hoz tartozó zipcode-t
    [Arguments]  ${text}
    input text  ${PO_VENUES_VENUES_ZIPCODE_ID}  ${text}

Give the city of venue
    [Documentation]  Megadja a venue-hoz tartozó várost-t
    [Arguments]  ${text}
    input text  ${PO_VENUES_VENUES_CITY_ID}  ${text}

Give the county of venue
    [Documentation]  Megadja a venue-hoz tartozó megyét-t
    [Arguments]  ${text}
    input text  ${PO_VENUES_VENUES_COUNTY_ID}  ${text}

Give the street of venue
    [Documentation]  Megadja a venue-hoz tartozó utcát
    [Arguments]  ${text}
    input text  ${PO_VENUES_VENUES_STREET_ID}  ${text}

Give the housenumber of venue
    [Documentation]  Megadja a venue-hoz tartozó házszámot
    [Arguments]  ${text}
    input text  ${PO_VENUES_VENUES_HOUSENUMBER_ID}  ${text}

Give the door of venue
    [Documentation]  Megadja a venue-hoz tartozó ajtót
    [Arguments]  ${text}
    input text  ${PO_VENUES_VENUES_DOOR_ID}  ${text}

Give the floor of venue
    [Documentation]  Megadja a venue-hoz tartozó ajtót
    [Arguments]  ${text}
    input text  ${PO_VENUES_VENUES_FLOOR_ID}  ${text}

Click the new auditorium on the wizard
    [Documentation]  Megnyomja az új nézőtér létrehozása gombot.
    click element  ${PO_VENUES_NEW_AUDITORIUM_BUTTON_ID}

wait the auditorium wizard appear
    [Documentation]  Megvárja amíg az auditorium wizard megjelenik
                ...  az új auditorium gomb megnyomása után
    wait until element is visible  ${PO_VENUES_NEW_AUDITORIUM_WIZARD_ID}  20
    sleep  1s

Give the auditorium name
    [Documentation]  Megadja az auditorium nevét a wizardban.
    [Arguments]  ${text}
    input text  ${PO_VENUES_AUDITORIUM_NAME_ID}  ${text}

Give the auditorium capacity
    [Documentation]  Megadja az auditorium kapacitását.
    [Arguments]  ${text}
    input text  ${PO_VENUES_AUDITORIUM_CAPACITY_ID}  ${text}

Click not use venues address on the auditorium
    [Documentation]  Belekattint, hogy ne használjuk az auditorium címét a nézőtérnél.
    click element  ${PO_VENUES_AUDITORIUM_NOT_USE_VENUE_ADDRESS}

Wait the auditoriums address fields appear
    [Documentation]  Megvárja amíg az auditorium-nál a tövábbi címek is megjelennek.
    wait until element is visible  xpath=//*[@class="row new-auditorium-container"]//*[@formcontrolname="floor"]

Give the auditorium zipcode
    [Documentation]  Megadja a nézőtérhez tartozó irányítószámot.
    [Arguments]  ${text}
    input text  ${PO_VENUES_AUDITORIUM_ZIPCODE}  ${text}

Give the auditorium city
    [Documentation]  Megadja a nézőtérhez tartozó várost.
    [Arguments]  ${text}
    input text  ${PO_VENUES_AUDITORIUM_CITY}  ${text}

Give the auditorium county
    [Documentation]  Megadja a nézőtérhez tartozó megyét.
    [Arguments]  ${text}
    input text  ${PO_VENUES_AUDITORIUM_COUNTY_ID}  ${text}

Give the auditorium street
    [Documentation]  Megadja a nézőtérhez tartozó utcát.
    [Arguments]  ${text}
    input text  ${PO_VENUES_AUDITORIUM_STREET_ID}  ${text}

Give the auditorium housenumber
    [Documentation]  Megadja a nézőtérhez tartozó házszámot.
    [Arguments]  ${text}
    input text  ${PO_VENUES_AUDITORIUM_HOUSE_NUMBER_ID}  ${text}

Give the auditorium door
    [Documentation]  Megadja a nézőtérhez tartozó ajtót
    [Arguments]  ${text}
    input text  ${PO_VENUES_AUDITORIUM_DOOR_ID}  ${text}

Give the auditorium floor
    [Documentation]  Megadja a nézőtérhez tartozó emeletet
    [Arguments]  ${text}
    input text  ${PO_VENUES_AUDITORIUM_FLOOR_ID}  ${text}

Click the add auditorium button
    [Documentation]  Megnyomja az auditorium hozzáadása gombot.
    click element  ${PO_VENUES_ADD_AUDITORIUM_BUTTON_ID}
    sleep  2s

Give the auditorium country
    [Documentation]  Megadja a venue-hoz tartozó országot.
    [Arguments]  ${text}
    Choose item from listbox  ${text}  ${PO_VENUES_AUDITORIUM_COUNTRY_ID}

Get the venues name on the venues page
    [Documentation]  Lekéri az előadohelyek nevit a nézőtér oldalon
    @{lista}=  Get list from items2  ${False}  //mat-cell[1]  \n  0
    log  ${lista}
    [Return]  ${lista}

Check result of full venue name search results
    [Documentation]
    [Arguments]  ${eredmeny}  ${kivalasztott}
    Check the result value  ${eredmeny}  ${kivalasztott}  ${True}

check result when search of substring of venue name
    [Documentation]
    [Arguments]  ${eredmeny}  ${kivalasztott}
    Check the result value  ${eredmeny}  ${kivalasztott}  ${False}

Give the search value on the venues page
    [Documentation]  Megadja a venue lista oldalon a keresőbe az értéket.
    [Arguments]  ${text}
    input text  ${PO_VENUES_SEARCH_INPUT_ID}  ${text}

Get the page listbox item from the venue page
    [Documentation]  Az előadóhelyek oldalán visszaadja a lapozóban lévő elemeket
               ...  egy szótárban. A szótár első eleme az index utána pedig a szöveg.
    ${lista} =  Go to listbox and get all items xpath  ${PO_ALT_PAGE_SCHROOL_LISTBOX_ID}  ${PO_ALT_PAGE_SCHROOL_CLASS_ID}
    [Return]  ${lista}

Get all venues name from the venues page
    [Documentation]  Visszaadja venues oldalről a megjelene venue neveket.
    @{lista} =  Get list from items2  ${False}  ${PO_VENUES_NAME_IN_TABLE_ID}  ${EMPTY}  ${EMPTY}
    log  ${lista}
    [Return]  ${lista}

Get all venues address from the venues page
    [Documentation]  Visszaadja venues oldalről a megjelene venue neveket.
    @{lista} =  Get list from items2  ${False}  ${PO_VENUES_ADDRESS_IN_TABLE_ID}  ${EMPTY}  ${EMPTY}
    log  ${lista}
    [Return]  ${lista}