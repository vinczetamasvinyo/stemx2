*** Settings ***
Resource  Common_resource.robot
Resource  PO/po_venues.robot

*** Keywords ***
Check the new venue was created
    [Arguments]  ${text}
    Give the search value on the venues page  ${text}
    po_alt.Click the search button
    sleep  3s
    ${eredmeny} =  Get the venues name on the venues page
    Check result of full venue name search results  ${eredmeny}  ${text}

Create new venue and audits start the venues page
    [Documentation]  létrehoz egy új előadőhelyet és ha szükséges,
                ...  akkor nézőtereket is
                ...  Ha a szótárban nincs benne az Audits key akkor
                ...  nem hoz létre nézőteret.
    [Arguments]  ${data}
    po_alt.Click the new button
    Give the new venue datas  ${data}[Venue]
    ${vaudits} =  szotarban van e  ${data}  Audits
    run keyword if  ${vaudits}==${TRUE}  Click the new auditorium button and give datas  ${data}[Audits]
    po_alt.Click the save button
    Common.Wait the succes message and click

Click the new auditorium button and give datas
    [Arguments]  ${datas}
    :FOR  ${data}  IN  @{datas}
    \  Click the new auditorium on the wizard
    \  wait the auditorium wizard appear
    \  Give the auditorium datas  ${data}
    \  Click the add auditorium button

Click the not use venue address of auditorium and wait

    Click not use venues address on the auditorium
    Wait the auditoriums address fields appear


Use the venue address on the auditorium
    [Documentation]
    [Arguments]  ${ad}
    run keyword if  ${ad}==${False}  Click the not use venue address of auditorium and wait

Give the new venue datas
    [Arguments]  ${adatok}
    ${vvenuename} =  szotarban van e  ${adatok}  Venuename
    run keyword if  ${vvenuename}==${TRUE}  give the venues name  ${adatok}[Venuename]
    ${vvenudescription} =  szotarban van e  ${adatok}  Venuedescription
    run keyword if  ${vvenuename}==${TRUE}  give the venues description  ${adatok}[Venuedescription]
    ${vvenuedecountry} =  szotarban van e  ${adatok}  Venuecountry
    run keyword if  ${vvenuedecountry}==${TRUE}  give the country of venue  ${adatok}[Venuecountry]
    ${vvenuezipcode} =  szotarban van e  ${adatok}  Venuezipcode
    run keyword if  ${vvenuezipcode}==${TRUE}  give the zipcode of venue  ${adatok}[Venuecountry]
    ${vvenuecity} =  szotarban van e  ${adatok}  Venuecity
    run keyword if  ${vvenuecity}==${TRUE}   give the city of venue  ${adatok}[Venuecity]
    ${vvenuecounty} =  szotarban van e  ${adatok}  Venuecounty
    run keyword if  ${vvenuecounty}==${TRUE}   give the county of venue  ${adatok}[Venuecounty]
    ${vvenuestreet} =  szotarban van e  ${adatok}  Venuestreet
    run keyword if  ${vvenuecounty}==${TRUE}   give the street of venue  ${adatok}[Venuecounty]
    ${vvenuehousenumber} =  szotarban van e  ${adatok}  Venuehousenumber
    run keyword if  ${vvenuehousenumber}==${TRUE}   give the housenumber of venue  ${adatok}[Venuehousenumber]
    ${vvenuedoor} =  szotarban van e  ${adatok}  Venuedoor
    run keyword if  ${vvenuehousenumber}==${TRUE}   give the door of venue  ${adatok}[Venuedoor]
    ${vvenuefloor} =  szotarban van e  ${adatok}  Venuefloor
    run keyword if  ${vvenuehousenumber}==${TRUE}   give the floor of venue  ${adatok}[Venuefloor]







Give the auditorium datas
    [Documentation]  Megadja a nézőtérhez kapcsolódó adatokat.
	[Arguments]  ${adatok}
    ${vauditoriumname} =  szotarban van e  ${adatok}  Auditoriumname
    run keyword if  ${vauditoriumname}==${TRUE}  Give the auditorium name  ${adatok}[Auditoriumname]
    ${vauditoriumcapacity} =  szotarban van e  ${adatok}  Auditoriumcapacity
    run keyword if  ${vauditoriumcapacity}==${TRUE}  Give the auditorium capacity  ${adatok}[Auditoriumcapacity]
    ${vauditoriumvenueaddress} =  szotarban van e  ${adatok}  Auditoriumvenueaddress
    run keyword if  ${vauditoriumvenueaddress}==${TRUE}  Use the venue address on the auditorium  ${adatok}[Auditoriumvenueaddress]
    ${vauditoriumcountry} =  szotarban van e  ${adatok}  Auditoriumcountry
    run keyword if  ${vauditoriumcountry}==${TRUE}  Give the auditorium country  ${adatok}[Auditoriumcountry]
    ${vauditoriumzipcode} =  szotarban van e  ${adatok}  Auditoriumzipcode
    run keyword if  ${vauditoriumzipcode}==${TRUE}  Give the auditorium zipcode  ${adatok}[Auditoriumzipcode]
    ${vauditoriumcity} =  szotarban van e  ${adatok}  Auditoriumcity
    run keyword if  ${vauditoriumcity}==${TRUE}  Give the auditorium city  ${adatok}[Auditoriumcity]
    ${vauditoriumcounty} =  szotarban van e  ${adatok}  Auditoriumcounty
    run keyword if  ${vauditoriumcity}==${TRUE}  Give the auditorium county  ${adatok}[Auditoriumcounty]
    ${vauditoriumstreet} =  szotarban van e  ${adatok}  Auditoriumstreet
    run keyword if  ${vauditoriumcity}==${TRUE}  Give the auditorium street  ${adatok}[Auditoriumstreet]
    ${vauditoriumhousenumber} =  szotarban van e  ${adatok}  Auditoriumhousenumber
    run keyword if  ${vauditoriumhousenumber}==${TRUE}  Give the auditorium housenumber  ${adatok}[Auditoriumhousenumber]
    ${vauditoriumdoor} =  szotarban van e  ${adatok}  Auditoriumdoor
    run keyword if  ${vauditoriumdoor}==${TRUE}  Give the auditorium door  ${adatok}[Auditoriumdoor]
    ${vauditoriumfloor} =  szotarban van e  ${adatok}  Auditoriumfloor
    run keyword if  ${vauditoriumdoor}==${TRUE}  Give the auditorium floor  ${adatok}[Auditoriumfloor]


create venue or aurditoriums
    [Arguments]  ${data}
    run keyword if  ${data}[Existing]==0  po_alt.Click the new button
