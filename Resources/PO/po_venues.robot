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


*** Keywords ***
Wait until the venues page loaded
    [Documentation]  Megvárja amíg betöltődik a venues oldal.
    wait until element is visible  ${PO_VENUES_SEARCH_INPUT_ID}

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
