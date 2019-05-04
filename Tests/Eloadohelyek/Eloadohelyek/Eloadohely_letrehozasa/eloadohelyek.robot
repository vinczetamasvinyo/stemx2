*** Settings ***
Resource  ../../../../Resources/eloadohelyek_resource.robot

Suite Setup  Open browser and login and after go to the venues page  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
#Suite Teardown  Common.End web test

*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}


*** Test Cases ***
Test1
    po_alt.Click the new button
    give the venues name  Vinyó előadóhelye2
    give the venues description  Valami hosszú leírás
    give the country of venue  Németország
    give the zipcode of venue  1144
    give the city of venue  Budapest
    give the county of venue  Pest
    give the street of venue  Füredi utca
    give the housenumber of venue  11/D
    give the door of venue  41
    give the floor of venue  10
    click element  xpath=//button[@class="button tiny"]
    wait until element is visible  xpath=//*[@class="row new-auditorium-container"]
    input text  xpath=//*[@class="row new-auditorium-container"]//*[@formcontrolname="name"]  Vinyó nézőtere
    input text  xpath=//*[@class="row new-auditorium-container"]//*[@formcontrolname="capacity"]  20
    click element  xpath=//*[@formcontrolname="useVenueAddress"]
    wait until element is visible  xpath=//*[@class="row new-auditorium-container"]//*[@formcontrolname="floor"]
    input text  xpath=//*[@class="row new-auditorium-container"]//*[@formcontrolname="zipCode"]  3600
    input text  xpath=//*[@class="row new-auditorium-container"]//*[@formcontrolname="city"]  Ózd
    input text  xpath=//*[@class="row new-auditorium-container"]//*[@formcontrolname="county"]  Borsod
    input text  xpath=//*[@class="row new-auditorium-container"]//*[@formcontrolname="street"]  Nap utca
    input text  xpath=//*[@class="row new-auditorium-container"]//*[@formcontrolname="houseNumber"]  2
    input text  xpath=//*[@class="row new-auditorium-container"]//*[@formcontrolname="door"]  1ajtó
    input text  xpath=//*[@class="row new-auditorium-container"]//*[@formcontrolname="floor"]  2
    click element  xpath=//*[@class="row new-auditorium-container"]//*[@class="button success"]
    #sleep  3s
    po_alt.Click the save button
    Common.Wait the succes message and click
    #sleep  3s