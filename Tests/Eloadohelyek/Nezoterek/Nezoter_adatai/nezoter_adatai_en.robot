*** Settings ***
Resource  ../../../../Resources/auditoriums_resource.robot

Suite Setup  csinal  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
Suite Teardown  Common.End web test


*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}  language=${LAN}
&{AUDITORIUMDATA1}  	Auditoriumname=Vinyó nézőtér teszt
...	                Auditoriumcapacity=20
...	                Auditoriumvenueaddress=${False}
...	                Auditoriumcountry=Hungary
...	                Auditoriumzipcode=1144
...	                Auditoriumcity=Budapest
...	                Auditoriumcounty=Pest
...	                Auditoriumstreet=Füredi utca
...	                Auditoriumhousenumber=11/D
...	                Auditoriumdoor=41
...	                Auditoriumfloor=10


&{VENUEDATA}  Venuename=VINYÓ teszt
...	          Venuedescription=Vinyó létrehozzsa
...	          Venuecountry=Hungary
...	          Venuezipcode=3600
...	          Venuecity=Ózd
...	          Venuecounty=Pest
...	          Venuestreet=Nap
...	          Venuehousenumber=2
...	          Venuedoor=41
...	          Venuefloor=10


@{AUDITORIUMS}  &{AUDITORIUMDATA1}
&{VENUEAUDITORIUMS}  Venue=${VENUEDATA}
                ...  Audits=${AUDITORIUMS}
${LAN} =  En

*** Test Cases ***

test1
    #${elem} Create capacity venue
    ${va} =  set variable  ${CURDIR}
    #${szoveg} =  read from file  C:/development/robot-scripts/varoskartya/DATA/proba.txt
    ${szoveg} =  read csv file   C:/development/robot-scripts/varoskartya/DATA/proba.csv
    log  ${szoveg}

Test the audits name on the audit details page
    [Documentation]  A teszt során azt nézzük meg, hogy a nézőtér neve
                ...  megfelelően jelenik-e meg.
    ${name} =  Get the audits name from the audits details page
    should be equal  ${name}  ${VENUEAUDITORIUMS.Audits[0].Auditoriumname}

Test the audits address on the audit details page
    [Documentation]  A teszt során azt nézzük meg, hogy a nézőtér cím
                ...  megfelelően jelenik-e meg az oldalon.
     ${getauditaddress} =  Get the audits address from the audits details page
     ${realaddress} =  Create dicauditiumaddress  ${VENUEAUDITORIUMS.Audits[0]}
     ${createaddress} =  create_address_string  ${LAN}  ${realaddress}
     should be equal  ${getauditaddress}  ${createaddress}

Test the audits capacity on the audit details page
    [Documentation]  A teszt során azt nézzük meg, hogy a nézőtér
                ...  capacitása megfelelően jelenik-e meg.
    ${capacity} =  Create capacity venue  ${LAN}  ${VENUEAUDITORIUMS.Audits[0].Auditoriumcapacity}
    ${realcapacity} =  Get the audits capacity from the audits details page
    should be equal  ${capacity}  ${realcapacity}

Test the venue name on the audit details page
    [Documentation]  A teszt során azt nézzük meg, hogy a nézőtér oldalán
                ...  a nézőtérhez tartozó venuename megfelelően megjelenik-e.
    ${venuename} =  Get the venue name from the audits details page
    should be equal  ${venuename}  ${VENUEAUDITORIUMS.Venue.Venuename}

Test the venue address on the audit details page
    [Documentation]  A test során azt nézzük meg, hogy a nézőtér oldalán
                ...  a nézőtérhez tartozó venue cím az megfelelően jelenike-e meg.
    ${getvenueaddress} =  Get the venue address from the audits details page
    ${realaddress} =  Create dicvenueaddress  ${VENUEAUDITORIUMS.Venue}
    ${createaddress} =  create_address_string  ${LAN}  ${realaddress}
    should be equal  ${getvenueaddress}  ${createaddress}


*** Keywords ***
csinal
    [Arguments]  ${old}  ${bon}  ${log}
    Open browser and login and after go to the venues page  ${old}  ${bon}  ${log}
    ${ido} =  get time in string
    #log  ${VENUEAUDITORIUMS.Audits[0].Auditoriumcity}
    ${VENUEAUDITORIUMS.Audits[0].Auditoriumname} =   set variable  ${VENUEAUDITORIUMS.Audits[0].Auditoriumname}${ido}
    #${VENUEAUDITORIUMS.Audits[0].Auditoriumcity} =   set variable  ${VENUEAUDITORIUMS.Audits[0].Auditoriumcity}${ido}
    #${VENUEAUDITORIUMS.Audits[0].Auditoriumzipcode} =  set variable  ir${ido}
    #${VENUEAUDITORIUMS.Audits[0].Auditoriumstreet} =  set variable  ${VENUEAUDITORIUMS.Audits[0].Auditoriumstreet}${ido}
    #${VENUEAUDITORIUMS.Audits[0].Auditoriumhousenumber} =  set variable  ${VENUEAUDITORIUMS.Audits[0].Auditoriumhousenumber}${ido}
    Create new venue and audits start the venues page  ${VENUEAUDITORIUMS}
    Click the auditoriums submenu
    wait the auditoriums page loaded
    Give the search value  ${VENUEAUDITORIUMS.Audits[0].Auditoriumname}
    po_alt.Click the search button
    sleep  3s
    ${lista} =  Get the all eyes from the page
    ${elem} =  Get random item from the list  ${lista}
    click element  ${elem}
    Waiting the details of auditorium loaded