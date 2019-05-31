*** Settings ***
Resource  ../../../../Resources/auditoriums_resource.robot
Library    robot.libraries.String

Suite Setup  csinal  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
Suite Teardown  Common.End web test


*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}  language=${LAN}
${LAN} =  En
&{AUDITORIUMDATA1}  	Auditoriumname=Vinyó nézőtér
...	                Auditoriumcapacity=20
...	                Auditoriumvenueaddress=${False}
...	                Auditoriumcountry=Denmark
...	                Auditoriumzipcode=${Empty}
...	                Auditoriumcity=Ózd
...	                Auditoriumcounty=Borsod
...	                Auditoriumstreet=Nap
...	                Auditoriumhousenumber=h
...	                Auditoriumdoor=ajtó1
...	                Auditoriumfloor=2emelet


&{VENUEDATA}  Venuename=VINYÓ TÖRLÉS1
...	          Venuedescription=Valami szerkesztett előadás
...	          Venuecountry=Denmark
...	          Venuezipcode=1144
...	          Venuecity=Ózd
...	          Venuecounty=Pest
...	          Venuestreet=Vinyóutca
...	          Venuehousenumber=11/D
...	          Venuedoor=41
...	          Venuefloor=10


@{AUDITORIUMS}  &{AUDITORIUMDATA1}
&{VENUEAUDITORIUMS}  Venue=${VENUEDATA}
                ...  Audits=${AUDITORIUMS}



*** Test Cases ***
Test the search of the city of auditoriums
    [Documentation]  A teszt során azt nézzük meg, hogy a auditorium címének
                 ...  a város részére való keresés az rendben működik-e.
    Reset on the auditorium page
    Give the search value  ${VENUEAUDITORIUMS.Audits[0].Auditoriumcity}
    po_alt.Click the search button
    sleep  3s
    ${eredmeny} =  Get the auditoriums address on the auditoriums page
    Check the result of search auditorium address  ${eredmeny}  ${VENUEAUDITORIUMS.Audits[0].Auditoriumcity}

Test the search of the zipcode of auditoriums
    [Documentation]  A teszt során azt nézzük meg, hogy a auditorium címének
                 ...  a irányítószám részére való keresés az rendben működik-e.
    Reset on the auditorium page
    Give the search value  ${VENUEAUDITORIUMS.Audits[0].Auditoriumzipcode}
    po_alt.Click the search button
    sleep  3s
    ${eredmeny} =  Get the auditoriums address on the auditoriums page
    Check the result of search auditorium address  ${eredmeny}  ${VENUEAUDITORIUMS.Audits[0].Auditoriumzipcode}

Test the search of the street of auditoriums
    [Documentation]  A teszt során azt nézzük meg, hogy a auditorium címének
                 ...  az utca részére való keresés az rendben működik-e.
    Reset on the auditorium page
    Give the search value  ${VENUEAUDITORIUMS.Audits[0].Auditoriumstreet}
    po_alt.Click the search button
    sleep  3s
    ${eredmeny} =  Get the auditoriums address on the auditoriums page
    Check the result of search auditorium address  ${eredmeny}  ${VENUEAUDITORIUMS.Audits[0].Auditoriumstreet}

Test the search of the housenumer of auditoriums
    [Documentation]  A teszt során azt nézzük meg, hogy a auditorium címének
                 ...  az utca részére való keresés az rendben működik-e.
    Reset on the auditorium page
    Give the search value  ${VENUEAUDITORIUMS.Audits[0].Auditoriumhousenumber}
    po_alt.Click the search button
    sleep  3s
    ${eredmeny} =  Get the auditoriums address on the auditoriums page
    Check the result of search auditorium address  ${eredmeny}  ${VENUEAUDITORIUMS.Audits[0].Auditoriumhousenumber}

*** Keywords ***
csinal
    [Arguments]  ${old}  ${bon}  ${log}
    Open browser and login and after go to the venues page  ${old}  ${bon}  ${log}
    ${ido} =  get time in string
    log  ${VENUEAUDITORIUMS.Audits[0].Auditoriumcity}
    ${VENUEAUDITORIUMS.Audits[0].Auditoriumcity} =   set variable  ${VENUEAUDITORIUMS.Audits[0].Auditoriumcity}${ido}
    ${VENUEAUDITORIUMS.Audits[0].Auditoriumzipcode} =  set variable  ir${ido}
    ${VENUEAUDITORIUMS.Audits[0].Auditoriumstreet} =  set variable  ${VENUEAUDITORIUMS.Audits[0].Auditoriumstreet}${ido}
    ${VENUEAUDITORIUMS.Audits[0].Auditoriumhousenumber} =  set variable  ${VENUEAUDITORIUMS.Audits[0].Auditoriumhousenumber}${ido}
    Create new venue and audits start the venues page  ${VENUEAUDITORIUMS}
    Click the auditoriums submenu
    wait the auditoriums page loaded
