*** Settings ***
Resource  Common_resource.robot
Resource  paga_element_resource.robot
Resource  eloadohelyek_resource.robot
Library  ../ExternalResources/mylibrary.py
Library    robot.libraries.String
Library  Collections

*** Variables ***
&{AUDITORIUMS_TITTLE_TEXT}  Hun=Nézőterek  En=Auditoriums
&{AUDITORIUMS_SEARCH_INPUT_TEXT}  Hun=Keresés  En=Search
&{AUDITORIUMS_SEARCH_INPUT_PLACEHOLDER_TEXT}  Hun=Keresés  En=Search
&{AUDITORIUMS_CHECKBOX_TEXT}  Hun=Törölt nézőterek is  En=Include deleted auditoriums
&{AUDITORIUMS_NEW_BUTTON_TEXT}  Hun=Új létrehozása  En=Create new
&{AUDITORIUMS_RESET_BUTTON_TEXT}  Hun=Visszaállítás  En=Reset
&{AUDITORIUMS_SEARCH_BUTTON_TEXT}  Hun=Keresés  En=Search
&{AUDITORIUMS_TABLE_HEADER_AUDIT_NAME_TEXT}  Hun=Nézőtér neve  En=Auditorium name
&{AUDITORIUMS_TABLE_HEADER_ADDRESS_NAME_TEXT}  Hun=Helyszín neve  En=Place name
&{AUDITORIUMS_TABLE_HEADER_CAPACITY_TEXT}  Hun=Nézőtér férőhelye  En=Auditorium capacity
&{AUDITORIUMS_TABLE_HEADER_Feature_TEXT}  Hun=Lehetőségek  En=Features
&{AUDITORIUMS_ERROR_TEXT_TOO_LONG}  Hun=Kérem legfeljebb 127 karaktert adjon meg  En=Please enter no more than 127 characters
&{AUDITDETAILS_TITTLE}  Hun=Nézőtér megtekintése  En=Auditorium view
&{AUDITDETAILS_AUDIT_NAME_TITTLE}  Hun=Nézőtér neve  En=Auditorium name
&{AUDITDETAILS_AUDIT_ADDRESS_TITTLE}  Hun=Nézőtér címe  En=Auditorium address
&{AUDITDETAILS_AUDIT_CAPACITY_TITTLE}  Hun=Max. kapacitás  En=Max Capacity
&{AUDITDETAILS_VENUE_INFORMATION_TITTLE}  Hun=Előadóhely információ  En=Venue Information
&{AUDITDETAILS_BACK_BUTTON}  Hun=Vissza a listához  En=Back to list
&{AUDITDETAILS_DELETE_BUTTON}  Hun=Törlés  En=Delete
&{AUDITDETAILS_EDIT_BUTTON}  Hun=Szerkesztés  En=Edit


*** Keywords ***
Check the text on the auditoriums page
    [Arguments]  ${type}  ${text}  ${index}  ${path}
    Check text on the page  ${type}  ${text}  ${index}  ${path}

Check the all audits name appear and length
    @{lista} =  Get all audits name from the audits page
    log  ${lista}
    Check the length is bigger in the list  ${lista}  0

Check the all audits address appear and length is correct
    @{lista} =  Get all audits address from the audits page
    log  ${lista}
    Check the length is bigger in the list  ${lista}  0

Check the all palce name appear and length is correct
    @{lista} =  Get all audits place name from the audits page
    log  ${lista}
    Check the length is bigger in the list  ${lista}  0

Check the all palce address appear and length is correct
    @{lista} =  Get all audits place address from the audits page
    log  ${lista}
    Check the length is bigger in the list  ${lista}  0

Check the default odder on the audits page
    [Documentation]  Megnézi, hogy az oldalon alapból név szerint van-e a rendezés.
    @{lista} =  Get all audits name from the audits page
    log  ${lista}
    @{rendezett} =  copy list  ${lista}
    log   ${rendezett}
    lists should be equal  ${lista}   ${rendezett}

Check the search input value on the audtioriums page
    [Arguments]  ${ertek2}
    ${ertek} =  Get value of the search input
    should be equal  ${ertek}  ${ertek2}

Check the search input value is empty on the auditoriums page
    [Documentation]  Megnézi, hogy a kereső mező értéke üres-e.
    ${ertek2} =  Get value of the search input
    should be empty  ${ertek2}

Reset on the auditorium page
    [Documentation]  Megnyomja a visszaállít gombot és várakozik.
    Click the reset button
    sleep  2s

Check result of full auditorium name search results
    [Documentation]
    [Arguments]  ${eredmeny}  ${kivalasztott}
    Check the result value  ${eredmeny}  ${kivalasztott}  ${True}

Check the result of search auditorium address
    [Documentation]
    [Arguments]  ${eredmeny}  ${kivalasztott}
    Check the result value  ${eredmeny}  ${kivalasztott}  ${False}

Check result of full venue name search results
    [Documentation]
    [Arguments]  ${eredmeny}  ${kivalasztott}
    Check the result value  ${eredmeny}  ${kivalasztott}  ${True}

check result when search of substring of auditorium name
    [Documentation]
    [Arguments]  ${eredmeny}  ${kivalasztott}
    Check the result value  ${eredmeny}  ${kivalasztott}  ${False}

check result when search of substring of venue name
    [Documentation]
    [Arguments]  ${eredmeny}  ${kivalasztott}
    Check the result value  ${eredmeny}  ${kivalasztott}  ${False}

Get random auditoriums name of the list
    [Documentation]  Visszad
    [Arguments]  ${lista}
    ${kivalasztott} =  Get random item from the list  ${lista}
    [Return]  ${kivalasztott}

Get random venue name of the list
    [Documentation]  Visszad
    [Arguments]  ${lista}
    ${kivalasztott} =  Get random item from the list  ${lista}
    [Return]  ${kivalasztott}

Get the auditoriums name on the auditoriums page
    [Documentation]  Lekéri az nézőterek nevit a nézőtér oldalon
    @{lista}=  Get list from items2  ${True}  //mat-cell[1]  \n  0
    log  ${lista}
    [Return]  ${lista}

Get the auditoriums address on the auditoriums page
    [Documentation]  Lekéri az nézőterek címet a nézőtér oldalon
    @{lista}=  Get list from items2  ${True}  //mat-cell[1]  \n  1
    log  ${lista}
    [Return]  ${lista}

Get the venue name on the auditoriums page
    [Documentation]  Lekéri az nézőterek nevit a nézőtér oldalon
    @{lista}=  Get list from items2  ${True}  //mat-cell[2]  \n  0
    log  ${lista}
    [Return]  ${lista}

Check the text on the auditorium details page
    [Arguments]  ${type}  ${text}  ${index}  ${path}
    Check text on the page  ${type}  ${text}  ${index}  ${path}

Create dicaddres
    [Arguments]  ${data}
    ${cim} =  create dictionary  zipcode=${data.Auditoriumzipcode}  city=${data.Auditoriumcity}  street=${data.Auditoriumstreet}
    ...  housenumber=${data.Auditoriumhousenumber}  floor=${data.Auditoriumfloor}  door=${data.Auditoriumdoor}
    [Return]  ${cim}

Create dicauditiumaddress
    [Arguments]  ${data}
    ${cim} =  create dictionary
    ${vzipcode} =  szotarban van e  ${data}  Auditoriumzipcode
    run keyword if  ${vzipcode}==${TRUE}  Set To Dictionary  ${cim}  zipcode=${data.Auditoriumzipcode}
    ${vcity} =  szotarban van e  ${data}  Auditoriumcity
    run keyword if  ${vcity}==${TRUE}  Set To Dictionary  ${cim}  city=${data.Auditoriumcity}
    ${vstreet} =  szotarban van e  ${data}  Auditoriumstreet
    run keyword if  ${vstreet}==${TRUE}  Set To Dictionary  ${cim}  street=${data.Auditoriumstreet}
    ${vhousenumber} =  szotarban van e  ${data}  Auditoriumhousenumber
    run keyword if  ${vhousenumber}==${TRUE}  Set To Dictionary  ${cim}  housenumber=${data.Auditoriumhousenumber}
    ${vfloor} =  szotarban van e  ${data}  Auditoriumfloor
    run keyword if  ${vfloor}==${TRUE}  Set To Dictionary  ${cim}  floor=${data.Auditoriumfloor}
    ${vdoor} =  szotarban van e  ${data}  Auditoriumdoor
    run keyword if  ${vfloor}==${TRUE}  Set To Dictionary  ${cim}  door=${data.Auditoriumdoor}
    [Return]  ${cim}

Create dicvenueaddress
    [Arguments]  ${data}
    ${cim} =  create dictionary
    ${vzipcode} =  szotarban van e  ${data}  Venuezipcode
    run keyword if  ${vzipcode}==${TRUE}  Set To Dictionary  ${cim}  zipcode=${data.Venuezipcode}
    ${vcity} =  szotarban van e  ${data}  Venuecity
    run keyword if  ${vcity}==${TRUE}  Set To Dictionary  ${cim}  city=${data.Venuecity}
    ${vstreet} =  szotarban van e  ${data}  Venuestreet
    run keyword if  ${vstreet}==${TRUE}  Set To Dictionary  ${cim}  street=${data.Venuestreet}
    ${vhousenumber} =  szotarban van e  ${data}  Venuehousenumber
    run keyword if  ${vhousenumber}==${TRUE}  Set To Dictionary  ${cim}  housenumber=${data.Venuehousenumber}
    ${vfloor} =  szotarban van e  ${data}  Venuedoor
    run keyword if  ${vfloor}==${TRUE}  Set To Dictionary  ${cim}  floor=${data.Venuefloor}
    ${vdoor} =  szotarban van e  ${data}  Venuefloor
    run keyword if  ${vdoor}==${TRUE}  Set To Dictionary  ${cim}  door=${data.Venuedoor}
    [Return]  ${cim}

Create capacity venue
    [Documentation]  Előállítja, hogy a capacitás-nak hogyan kell megjelennie
                ...  az egyes nyelvek esetében.
    [Arguments]  ${lan}  ${elem}
    ${ertek} =  run keyword if  "${lan}"=="Hun"  set variable  ${elem}${SPACE}fő
    ...  ELSE IF  "${lan}"=="En"  set variable  ${elem}${SPACE}person(s)
    [Return]  ${ertek}