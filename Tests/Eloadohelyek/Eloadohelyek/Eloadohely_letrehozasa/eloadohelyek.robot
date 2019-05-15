*** Settings ***
Resource  ../../../../Resources/eloadohelyek_resource.robot

Suite Setup  Open browser and login and after go to the venues page  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
Suite Teardown  Common.End web test

*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}

&{DATA}  Existing=0
...      Venuname=Vinyó törlés

&{AUDITORIUMDATA1}  	Auditoriumname=Vinyó nézőtér
...	                Auditoriumcapacity=20
...	                Auditoriumvenueaddress=${False}
...	                Auditoriumcountry=Hungary
...	                Auditoriumzipcode=3600
...	                Auditoriumcity=Ózd
...	                Auditoriumcounty=Borsod
...	                Auditoriumstreet=Nap
...	                Auditoriumhousenumber=2
...	                Auditoriumdoor=ajtó1
...	                Auditoriumfloor=2emelet

&{AUDITORIUMDATA2}  	Auditoriumname=Vinyó nézőtér
...	                Auditoriumcapacity=20
...	                Auditoriumvenueaddress=${False}
...	                Auditoriumcountry=Hungary
...	                Auditoriumzipcode=3600
...	                Auditoriumcity=Ózd
...	                Auditoriumcounty=Borsod
...	                Auditoriumstreet=Nap
...	                Auditoriumhousenumber=2
...	                Auditoriumdoor=ajtó1
...	                Auditoriumfloor=2emelet

&{AUDITORIUMDATA3}  	Auditoriumname=Vinyó nézőtér
...	                Auditoriumcapacity=20
...	                Auditoriumvenueaddress=${True}
#...	                Auditoriumcountry=Hungary
#...	                Auditoriumzipcode=3600
#...	                Auditoriumcity=Ózd
#...	                Auditoriumcounty=Borsod
#...	                Auditoriumstreet=Nap
#...	                Auditoriumhousenumber=2
#...	                Auditoriumdoor=ajtó1
#...	                Auditoriumfloor=2emelet

&{VENUEDATA}  Venuename=VINYÓ TÖRLÉS1
...	          Venuedescription=Valami szerkesztett előadás
...	          Venuecountry=Hungary
...	          Venuezipcode=1144
...	          Venuecity=Jászfelsőszentgyörgy
...	          Venuecounty=Pest
...	          Venuestreet=Október huszonharmadika utca
...	          Venuehousenumber=11/D
...	          Venuedoor=41
...	          Venuefloor=10


@{AUDITORIUMS}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA2}  &{AUDITORIUMDATA1}  &{AUDITORIUMDATA3}
&{VENUEAUDITORIUMS}  Venue=${VENUEDATA}
#                ...  Audits=${AUDITORIUMS}

*** Test Cases ***
Test1
    [Tags]  most
    ${ido} =  get time in string
    ${VENUEAUDITORIUMS.Venue.Venuename} =  set variable  ${VENUEAUDITORIUMS.Venue.Venuename}${ido}
    Create new venue and audits start the venues page  ${VENUEAUDITORIUMS}
    Check the new venue was created  ${VENUEAUDITORIUMS.Venue.Venuename}