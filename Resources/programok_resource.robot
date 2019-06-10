*** Settings ***
Resource  PO/po_programok.robot
Resource  Common_resource.robot

*** Keywords ***
Create program
    [Documentation]  Létrehozza a programot
    [Arguments]  ${data}
    po_alt.Click the new button
    Give the data on the program description step page and click next button  ${data}
    Give the category data on the categoria step page and click the next button  ${data}
    Give the picture for the program and click the next button  ${data}
    Give the place data on the palce step page and click next button  ${data}
    Give the tickets data and click the next button  ${data}
    Give the events in the step page and click next button  ${data}
    Give the ticketes assigne data for events and click the next button  ${data}
    po_alt.Click the save button
    Wait the succes message and click

Waiting the programs page loaded
    [Documentation]  Megvárja amíg a programok oldal betöltődik.
    po_alt.Waiting the page loaded finish
    wait the search input visiable in the programs page


Waiting the create new page loaded
    [Documentation]  Megvárja amíg az új program létrehozása oldal betöltődik.
    wait until the program name input field visiable

Waiting the tickets step page loaded
    [Documentation]  Megvárja amíg a tickets step page oldal betöltődik.
    wait the ticket group input filed visiable in the programs page

Give the picture for the program
    [Documentation]  Feltölti a képeket
    [Arguments]  ${data}
    Wait the gallery step page loaded
    Upload the picture for the program  ${data}

Give the picture for the program and click the next button
    [Documentation]  Feltölti a képeket és megnyomja a tovább gombot.
    [Arguments]  ${data}
    Give the picture for the program  ${data}
    Click the next button

Upload the picture for the program
    [Documentation]  Feltölt képeket
    [Arguments]  ${data}
    ${picture} =  szotarban van e  ${data}  picture
    run keyword if  ${picture}==${TRUE}  upload picture if dictionary incluade picture  ${data}[picture]

upload picture if dictionary incluade picture
    [Documentation]  kepfeltoltes
    [Arguments]  ${data}
    run keyword if  "${data}[upload]"=="true"  upload pictures for the program  ${data}[pictures]

Give the ticketes assigne data for events
    [Arguments]  ${data}
    Waiting the ticket assignment page loaded
    Assign the tickets for the events  ${data}[ticketassigns]

Give the ticketes assigne data for events and click the next button
    [Arguments]  ${data}
    Give the ticketes assigne data for events  ${data}
    sleep  2s
    po_alt.Click the next button

Assign the tickets for the events
    [Documentation]  A jegyeket hozzárendeli az eseményekez
    [Arguments]  ${ticketassign}
    :FOR  ${ticket}  IN  @{ticketassign}
    \  log  ${ticket}
    \  log  ${ticket}[tickets]
    \  Open the events panel in the tickets assigne  ${ticket}[id]
    \  Click the all ticket or others ticket  ${ticket}
    \  Close the events panel in the tickets assigne  ${ticket}[id]
    \  sleep  1s

Open the events panel in the tickets assigne
    [Documentation]  Kinyitja az események panelját.
    [Arguments]  ${index}
    Click the events by index in the tickets assigne  ${index}  open
    sleep  1s

Close the events panel in the tickets assigne
    [Documentation]  Bezárja az események panelját.
    [Arguments]  ${index}
    Click the events by index in the tickets assigne  ${index}  close

Click the events by index in the tickets assigne
    [Documentation]  A megadott indexű eseményre kattint
    [Arguments]  ${index}  ${open_close}
    @{elem} =  Get events from the tickets assigne steppage
    ${ujindex} =  Evaluate  ${index}-1
    ${egye_elem} =  get from list  ${elem}  ${ujindex}
    click element  ${egye_elem}
    run keyword if  "${open_close}"=="open"  Wait until the events subpanel visiable  ${index}
    ...  ELSE  wait until element is not visible  Wait until the events subpanel not visiable  ${index}

Click the all ticket or others ticket
    [Documentation]  Bekapcsolja az eseménynél az összes jegyet, vagy csak a megadottakat.
    ...  Ha az összeset bekapcsoljuk, akkor a többi jegyet azt ki fogja venni.
    [Arguments]  ${ticketassign}
    run keyword if  "${ticketassign}[all]"=="true"  Click the all ticket  ${ticketassign}[id]
    Click the given tickets  ${ticketassign}
    #...  ELSE  Click the given tickets  ${ticketassign}

Click the given tickets
    [Documentation]  Bekapcsolja csak a megadott jegyeket.
    [Arguments]  ${ticketassign}
    ${szot} =  Get checkbox ticket list  ${ticketassign}[id]
    Click the tickets checkbox  ${ticketassign}[id]  ${szot}   ${ticketassign}[tickets]


Give the events in the step page and click next button
    [Documentation]  Megadja az eseményeket az aktuális lépésben.
    [Arguments]  ${data}
    Waiting the date step page loaded
    Give the events data  ${data}[events]
    Wait until the next button is active and click

Give the events data
    [Arguments]  ${eventslists}
    ${i} =  set variable  0
    :FOR  ${event}  IN  @{eventslists}
    \  ${i} =  Evaluate  ${i} + 1
    \  Give the event data on the step page  ${event}
    \  Waiting the create datetime button is visiable and click
    \  Wait until page contains count events  ${i}

Give the event data on the step page
    [Documentation]  Megadja az esemény adatokat
    [Arguments]  ${eventdata}
    Give the start date on the program create  ${eventdata}[startdate]
    Give the program time  ${eventdata}[lenght]
    Give the max capacity on the program create  $${eventdata}[maxcapacity]
    Give the event ticket data  ${eventdata}


Give the event ticket data
    [Documentation]  A program létrehozása során az esemény adatok megadásásná
                ...  a jegyadatokat adja meg. Ha free paraméter true,
                ...  akkor több adatot nem ad meg.
    [Arguments]  ${data}
    run keyword if  "${data}[free]"=="true"  Click the free event ticket on the date step page
    ...  ELSE  Give the ticket data if not free event  ${data}

Give the ticket data if not free event
    [Arguments]  ${data}
    ${programtax} =  szotarban van e  ${data}  program_tax
    run keyword if  ${programtax}==${TRUE}  Give the vat class by by index or name  ${data}[program_tax]
    ${default_ticket_type} =  szotarban van e  ${data}  default_ticket_type
    run keyword if  ${programtax}==${TRUE}  Give the ticket default type be name or index  ${data}[default_ticket_type]
    ${ives_ticket_template} =  szotarban van e  ${data}  ives_ticket_template
    run keyword if  ${ives_ticket_template}==${TRUE}  Give the ives ticket template by index or name  ${data}[ives_ticket_template]
    ${db_ticket_template} =  szotarban van e  ${data}  db_ticket_template
    run keyword if  ${db_ticket_template}==${TRUE}  Give the db tickets template by index or name   ${data}[db_ticket_template]
    ${electronic_ticket_template} =  szotarban van e  ${data}  electronic_ticket_template
    run keyword if  ${db_ticket_template}==${TRUE}  Give the electronic ticket template be name or index   ${data}[electronic_ticket_template]

Give the tickets data and click the next button
    [Documentation]  Megadja a jegyadatokat és megnyomja a tovább gombot.
    [Arguments]  ${data}
    Waiting the tickets step page loaded
    Give the tickets on the tickets step page  ${data}[tickets]
    Wait until the next button is active and click


Give ticket data on the tickets step page
    [Documentation]  Megadja egy jegy létrehozásához szüksége adatoka.
    [Arguments]  ${ticketdata}
    Give the ticket type name on the program create  ${ticketdata}[ticketname]
    Give the ticket price on the program create  ${ticketdata}[ticketprice]
    Give the max capacity on the program create  ${ticketdata}[ticketmaxcapacity]
    Give the group on the program create  ${ticketdata}[ticketgroup]

Give the tickets on the tickets step page
    [Documentation]  Megadja a jegyeket a program létrehozása során.
                ...  Egy listát kell kapnia amiben a jegyadatok vannak.
    [Arguments]  ${ticketsdata}
    ${i} =  set variable  0
    :FOR  ${ticketdata}  IN  @{ticketsdata}
    \  ${i} =  Evaluate  ${i} + 1
    \  Give ticket data on the tickets step page  ${ticketdata}
    \  Click the create ticket button on the create program
    \  Wait until page contains count tickets  ${i}

Give the place data on the palce step page
    [Documentation]  Program létrehozása során megadja place adatokat.
    [Arguments]  ${data}
    Wait the palce step page loaded
    Give the venues name in the program create step page  ${data}[venuename]
    sleep  4s
    Click the select button on place step page
    Wait the venues data loaded on the place page
    Give the auditorium on the program create by name or index  ${data}[auditorium]
    click raido button by name or index  ${data}[auditorium]

Give the place data on the palce step page and click next button
    [Documentation]  Program létrehozása során megadja place adatokat.
                ...  Majd megnyomja a tovább gombot.
    [Arguments]  ${data}
    Give the place data on the palce step page  ${data}
    Wait until the next button is active and click

Give the auditorium on the program create by name or index
    [Documentation]  Megadja a nézőtéret név vagy index alapján.
    [Arguments]  ${data}
    click raido button by name or index  ${data}

Give the category data on the categoria step page
    [Documentation]  A program létrehozása során megadja a kategória adatokat.
    [Arguments]  ${data}
    Waiting the category step page loaded
    Give the main category by name or index  ${data}[maincategory]
    Waiting the subcategory visiable
    Click checkboxs from list by index or name  ${data}[subcategory]

Give the category data on the categoria step page and click the next button
    [Documentation]  A program létrehozása során megadja a kategória adatokat.
                ...  Majd megnyomja a tovább gombot.
    [Arguments]  ${data}
    Give the category data on the categoria step page  ${data}
    Wait until the next button is active and click

Give the data on the program description step page and click next button
    [Documentation]  Megadja az adatokat program létrehozása során
                ...  a program leírás aloldalon, majd megnyomja a tovább gombot.
    [Arguments]  ${data}
    Give the data on the program description step page  ${data}
    Wait until the next button is active and click

Give the data on the program description step page
    [Documentation]  Megadja az adatokat program létrehozása során
                ...  a program leírás lépésben.
    [Arguments]  ${data}
    Waiting the create new page loaded
    Give the program name  ${data}[program_name]
    Give the program short description  ${data}[program_description]
    Give the long description  ${data}[program_long_description]
    Give the vat class by by index or name  ${data}[program_tax]
    Give the ticket default type be name or index  ${data}[default_ticket_type]
    Give the ives ticket template by index or name  ${data}[ives_ticket_template]
    Give the db tickets template by index or name   ${data}[db_ticket_template]
    Give the electronic ticket template be name or index  ${data}[electronic_ticket_template]

Click the tickets checkbox
    [Documentation]  Bekapcsolja a megadott jegyeket.
    [Arguments]  ${index}  ${szot}  ${ticketslist}
    log  ${szot}
    log  ${ticketslist}
    :FOR  ${ticket}  IN  @{ticketslist}
    \  log  ${ticket}
    \  Click the ticket checkbox  ${index}  ${szot}  ${ticket}
    \  sleep  1s