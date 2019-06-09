*** Settings ***
Resource  ../../../../Resources/eloadohelyek_resource.robot
#proba
Suite Setup  Open browser and login and after go to the venues page  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
Suite Teardown  Common.End web test

*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}  language=${LAN}
${LAN}=  En

#&{DATA}  Existing=0
#...      Venuname=Vinyó szerkesztes teszt ma

&{AUDITORIUMDATA1}  	Auditoriumname=Gödöllő nézőtér
...	                Auditoriumcapacity=20
...	                Auditoriumvenueaddress=${False}
...	                Auditoriumcountry=Denmark
...	                Auditoriumzipcode=3600
...	                Auditoriumcity=Ózd
...	                Auditoriumcounty=Borsod
...	                Auditoriumstreet=Nap
...	                Auditoriumhousenumber=2
...	                Auditoriumdoor=ajtó1
...	                Auditoriumfloor=2emelet

&{AUDITORIUMDATA2}  	Auditoriumname=Mogyoródi vinyó nézőtér
...	                Auditoriumcapacity=20
...	                Auditoriumvenueaddress=${True}
#...	                Auditoriumcountry=Denmark
#...	                Auditoriumzipcode=3600
#...	                Auditoriumcity=Ózd
#...	                Auditoriumcounty=Borsod
#...	                Auditoriumstreet=Nap
#...	                Auditoriumhousenumber=2
#...	                Auditoriumdoor=ajtó1
#...	                Auditoriumfloor=2emelet

&{AUDITORIUMDATA3}  	Auditoriumname=ózdi nézőtér olvasó1
...	                Auditoriumcapacity=20
...	                Auditoriumvenueaddress=${True}
#...	                Auditoriumcountry=Denmark
#...	                Auditoriumzipcode=3600
#...	                Auditoriumcity=Ózd
#...	                Auditoriumcounty=Borsod
#...	                Auditoriumstreet=Nap
#...	                Auditoriumhousenumber=2
#...	                Auditoriumdoor=ajtó1
#...	                Auditoriumfloor=2emelet

&{AUDITORIUMDATA4}  	Auditoriumname=Ózdi nézőtér olvasó2
...	                Auditoriumcapacity=20
...	                Auditoriumvenueaddress=${True}
#...	                Auditoriumcountry=Denmark
#...	                Auditoriumzipcode=3600
#...	                Auditoriumcity=Ózd
#...	                Auditoriumcounty=Borsod
#...	                Auditoriumstreet=Nap
#...	                Auditoriumhousenumber=2
#...	                Auditoriumdoor=ajtó1
#...	                Auditoriumfloor=2emelet

&{AUDITORIUMDATA5}  	Auditoriumname=Bartók Béla nézőtér nagybetűs1
...	                Auditoriumcapacity=20
...	                Auditoriumvenueaddress=${True}
#...	                Auditoriumcountry=Denmark
#...	                Auditoriumzipcode=3600
#...	                Auditoriumcity=Ózd
#...	                Auditoriumcounty=Borsod
#...	                Auditoriumstreet=Nap
#...	                Auditoriumhousenumber=2
#...	                Auditoriumdoor=ajtó1
#...	                Auditoriumfloor=2emelet

&{AUDITORIUMDATA6}  	Auditoriumname=bartók béla nézőtér kisbetűs2
...	                Auditoriumcapacity=20
...	                Auditoriumvenueaddress=${True}
#...	                Auditoriumcountry=Denmark
#...	                Auditoriumzipcode=3600
#...	                Auditoriumcity=Ózd
#...	                Auditoriumcounty=Borsod
#...	                Auditoriumstreet=Nap
#...	                Auditoriumhousenumber=2
#...	                Auditoriumdoor=ajtó1
#...	                Auditoriumfloor=2emelet



&{VENUEDATA}  Venuename=Vinyó színház
...	          Venuedescription=Valami szerkesztett előadás
...	          Venuecountry=Denmark
...	          Venuezipcode=1144
...	          Venuecity=Jászfelsőszentgyörgy
...	          Venuecounty=Pest
...	          Venuestreet=Október huszonharmadika utca
...	          Venuehousenumber=11/D
...	          Venuedoor=41
...	          Venuefloor=10


@{AUDITORIUMS}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA4}  &{AUDITORIUMDATA5}  &{AUDITORIUMDATA6}
#&{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}    &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}    &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}    &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}    &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}    &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}    &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}    &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}    &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}    &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}    &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}    &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}    &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}
#...  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}    &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}    &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}    &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}    &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}    &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}    &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}    &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}    &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}    &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}    &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}    &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}    &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}
&{VENUEAUDITORIUMS}  Venue=${VENUEDATA}
                ...  Audits=${AUDITORIUMS}

*** Test Cases ***
Test1
    [Tags]  most
    ${ido} =  get time in string
    ${venuedb} =  get length  ${AUDITORIUMS}
    log to console  ${venuedb}
    ${VENUEAUDITORIUMS.Venue.Venuename} =  set variable  ${VENUEAUDITORIUMS.Venue.Venuename}${ido}
    log to console  ${VENUEAUDITORIUMS.Venue.Venuename}
    Create new venue and audits start the venues page  ${VENUEAUDITORIUMS}
    Check the new venue was created  ${VENUEAUDITORIUMS.Venue.Venuename}