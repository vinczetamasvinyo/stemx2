*** Settings ***
Resource  ../../../Resources/programok_resource.robot

Suite Setup  Open browser and login and after go to the programs page  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
#Suite Teardown  Common.End web test

*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}  language=${LAN}
${LAN}=  Hun
@{subcategorylist}  Néptánc előadás  Balett előadás
${PROGRAM_DATA3} =  {'program_name':'Csillagok zuhanása'}


&{PROGRAM_DATA}  program_name=Csillagok zuhanása
     ...  program_description=Vinyó programának rövid elírása
     ...  program_long_description=részletes leírás
     ...  program_tax=&{ADATOK}
     ...  default_ticket_type=&{ADATOK2}
     ...  ives_ticket_template=&{ADATOK3}
     ...  db_ticket_template=&{ADATOK3}
     ...  electronic_ticket_template=&{ADATOK3}
     ...  venuename=Előadóhely neve
     ...  maincategory=${maincategory}
     ...  subcategory=${subcategory}
     ...  auditorium=${auditoirum}
     ...  tickets=${TICKETS}
     ...  events=${EVENTS}
     ...  ticketassigns=@{ticketassigns}

&{ADATOK}  type=name
      ...  text=B - 25%

&{ADATOK2}  type=index
      ...  text=1
&{ADATOK3}  type=index
      ...  text=1
&{ADATOK4}  type=name
      ...  text=Bryghus
&{ADATOK5}  type=index
      ...  text=1
&{maincategory}  type=index
            ...  text=1
@{subcategory_list1}  Alkategória 1  Alkategória 2
@{subcategory_list2}  1  2
&{subcategory}  type=name
           ...  list=${subcategory_list1}

&{auditoirum}  type=name
          ...  text=Teszt stadion 333333 (100 000 fő)

#TICKET ADATOK ITT TALÁLHATÓAK
@{TICKETS}  ${ticket1}   ${ticket2}  ${ticket3}
&{ticket1}  ticketname=jegy1
       ...  ticketprice=1000
       ...  ticketmaxcapacity=1000
       ...  ticketgroup=ticketcsoport

&{ticket2}  ticketname=jegy2
       ...  ticketprice=1000
       ...  ticketmaxcapacity=10002
       ...  ticketgroup=ticketcsoport2

&{ticket3}  ticketname=jegy3
       ...  ticketprice=1000
       ...  ticketmaxcapacity=10002
       ...  ticketgroup=ticketcsoport2


&{events_vat}  type=index
          ...  text=1
&{event_default_ticket}  type=index
                    ...  text=2
&{event_ives_tickets_template}  type=index
                           ...  text=2
&{event_db_tickets_template}  type=index
                           ...  text=6
&{event_electronic_tickets_template}  type=index
                                ...  text=5

@{EVENTS}  &{event1}  &{event2}
&{event1}  startdate=2019-06-11 16:00:00
     ...   lenght=30
     ...   free=false
     ...   maxcapacity=30
     ...   program_tax=${events_vat}
     ...   default_ticket_type=${event_default_ticket}
     ...   ives_ticket_template=${event_ives_tickets_template}
     ...   db_ticket_template=${event_db_tickets_template}
     ...   electronic_ticket_template=${event_electronic_tickets_template}

&{event2}  startdate=2019-06-20 16:00:00
     ...   lenght=30
     ...   free=false
     ...   maxcapacity=30
     ...   program_tax=${events_vat}
     ...   default_ticket_type=${event_default_ticket}
     ...   ives_ticket_template=${event_ives_tickets_template}
     ...   db_ticket_template=${event_db_tickets_template}
     ...   electronic_ticket_template=${event_electronic_tickets_template}

@{ticketassigns} =  ${ticketassign1}  ${ticketassign2}

@{ticketsass1} =  jegy1  jegy2
&{ticketassign1}  id=1
            ...   tickets=@{ticketsass1}

@{ticketsass2} =  jegy2
&{ticketassign2}  id=2
            ...   tickets=@{ticketsass2}

@{ticketsass3} =  jegy3
&{ticketassign3}  id=3
            ...   tickets=@{ticketsass3}

${PROGRAM_DATA2} =  {"program_name": "Csillagok zuhanása1",
               ...  "program_description": "részletes leírás",
               ...  "program_long_description": "részletes leírás",
               ...  "program_tax": {"type":"name", "text":"B - 25%"},
               ...  "default_ticket_type": {"type":"index", "text":"1"},
               ...  "ives_ticket_template": {"type":"index", "text":"1"},
               ...  "db_ticket_template": {"type":"index", "text":"1"},
               ...  "electronic_ticket_template": {"type":"index", "text":"1"},
               ...  "picture": {"upload":"true", "pictures":["C:/tesztkepek_programokhoz/kep1.jpg","C:/tesztkepek_programokhoz/kep2.jpg"]},
               ...  "venuename": "Előadóhely neve",
               ...  "maincategory": {"type":"index", "text":"1"},
               ...  "subcategory": {"type":"name", "list":["Alkategória 1", "Alkategória 2"]},
               ...  "auditorium": {"type": "name", "text": "Teszt stadion 333333 (100 000 fő)"},
               ...  "tickets":[{"ticketname": "jegy1", "ticketprice":"1000","ticketmaxcapacity":"1000","ticketgroup":"ticketcsoport"},
                          ...  {"ticketname": "jegy2", "ticketprice":"1002","ticketmaxcapacity":"1002","ticketgroup":"ticketcsoport2"},
                          ...  {"ticketname": "jegy3", "ticketprice":"1003","ticketmaxcapacity":"1003","ticketgroup":"ticketcsoport3"}],
               ...   "events":[{"startdate":"2019-06-11 16:00:00","lenght":"30","free":"false","maxcapacity":"30",
                                    ...  "program_tax":{"type":"index", "text":"1"},
                                    ...  "default_ticket_type":{"type":"index", "text":"1"},
                                    ...  "ives_ticket_template":{"type":"index", "text":"1"},
                                    ...  "db_ticket_template":{"type":"index", "text":"1"},
                                    ...  "electronic_ticket_template":{"type":"index", "text":"1"}},
                         ...  {"startdate":"2019-06-11 16:00:00","lenght":"30","free":"false","maxcapacity":"30",
                                    ...  "program_tax":{"type":"index", "text":"1"},
                                    ...  "default_ticket_type":{"type":"index", "text":"1"},
                                    ...  "ives_ticket_template":{"type":"index", "text":"1"},
                                    ...  "db_ticket_template":{"type":"index", "text":"1"},
                                    ...  "electronic_ticket_template":{"type":"index", "text":"1"}}],
              ...  "ticketassigns":[{"id":"1", "all":"false", "tickets":["jegy1"]},
                               ...  {"id":"2", "all":"false", "tickets":["jegy2"]}]
                ...  }


*** Test Cases ***
Test1
    ${PROGRAM_DATA4} =   evaluate  json.loads('''${PROGRAM_DATA2}''')    json
    ${ido} =  get time in string
    ${name} =  set variable  Hihetetlen támadás${ido}
    log  valami
    po_alt.Click the new button
    Give the data on the program description step page and click next button  ${PROGRAM_DATA4}
    Give the category data on the categoria step page and click the next button  ${PROGRAM_DATA4}
    Give the picture for the program and click the next button  ${PROGRAM_DATA4}
    Give the place data on the palce step page and click next button  ${PROGRAM_DATA4}
    Give the tickets data and click the next button  ${PROGRAM_DATA4}
    Give the events in the step page and click next button  ${PROGRAM_DATA4}
    Give the ticketes assigne data for events and click the next button  ${PROGRAM_DATA4}
    po_alt.Click the save button
    Wait the succes message and click

*** Keywords ***


Assign the tickets for the events
    [Documentation]  A jegyeket hozzárendeli az eseményekez
    [Arguments]  ${ticketassign}
    :FOR  ${ticket}  IN  @{ticketassign}
    \  log  ${ticket}
    \  log  ${ticket}[tickets]
    \  Open the events panel in the tickets assigne  ${ticket}[id]
    \  Click the all ticket or others ticket  ${ticket}
    \  Close the events panel in the tickets assigne  ${ticket}[id]

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
    run keyword if  "${open_close}"=="open"  wait until element is visible  //app-programs-ticket-assign//mat-expansion-panel[${index}]//*[@class="ticket-list-container"]
    ...  ELSE  wait until element is not visible  //app-programs-ticket-assign//mat-expansion-panel[${index}]//*[@class="ticket-list-container"]

Click the all ticket or others ticket
    [Documentation]  Bekapcsolja az eseménynél az összes jegyet, vagy csak a megadottakat.
    [Arguments]  ${ticketassign}
    run keyword if  "${ticketassign}[all]"=="true"  Click the all ticket  ${ticketassign}[id]
    Click the given tickets  ${ticketassign}
    #...  ELSE  Click the given tickets  ${ticketassign}

Click the given tickets
    [Documentation]  Bekapcsolja csak a megadott jegyeket.
    [Arguments]  ${ticketassign}
    ${szot} =  Get checkbox ticket list  ${ticketassign}[id]
    Click the tickets checkbox  ${ticketassign}[id]  ${szot}   ${ticketassign}[tickets]

Click the all ticket
    [Documentation]  Bekapcsolja az összes ticketet a jegyhozzárendelésnél.
    [Arguments]  ${index}
    click element  //app-programs-ticket-assign//mat-expansion-panel[${index}]//*[contains(@class,'tickets-header')]//mat-checkbox



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
    \  Wait until page contains count elements  //app-programs-date-time-item  ${i}

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
    \  Wait until page contains count elements  //app-programs-ticket  ${i}

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


Get checkbox ticket list
    [Documentation]  visszaadja a ticket listát a program létrehozása oldalról
    [Arguments]  ${index}
    ${xpath} =  set variable  //app-programs-ticket-assign//mat-expansion-panel[${index}]//*[@class="ticket-name"]
    @{lista} =  SeleniumLibrary.Get WebElements  ${xpath}
    ${szotar} =  create dictionary
    ${i} =  set variable  -1
    :FOR  ${valt}  IN  @{lista}
    \  ${i} =  Evaluate  ${i} + 1
    \  ${szoveg_eredeti} =  get text  ${valt}
    \  ${a} =  convert to string  ${i}
    \  set to dictionary  ${szotar}  ${szoveg_eredeti}  ${a}
    log  ${szotar}
    [Return]  ${szotar}

Click the tickets checkbox
    [Documentation]  Bekapcsolja a megadott jegyeket.
    [Arguments]  ${index}  ${szot}  ${ticketslist}
    log  ${szot}
    log  ${ticketslist}
    :FOR  ${ticket}  IN  @{ticketslist}
    \  log  ${ticket}
    \  Click the ticket checkbox  ${index}  ${szot}  ${ticket}
    \  sleep  1s

Click the ticket checkbox
    [Documentation]  Bekapcsolja a jegyeket
    [Arguments]  ${index}  ${szotar}  ${text}
    ${xpath} =  set variable  //mat-expansion-panel[${index}]//*[contains(@class,'ticket-container')]//mat-checkbox
    @{lista} =  SeleniumLibrary.Get WebElements  ${xpath}
    log  ${lista}
    ${db} =  get length  ${lista}
    log  ${db}
    log  ${szotar}[${text}]
    ${egye_elem} =  get from list  ${lista}  ${szotar}[${text}]
    click element  ${egye_elem}

Give the subcategory
    [Documentation]
    [Arguments]  ${lista}
    :FOR  ${elem} in  @{lista}
    \  Click checkbox  Balett előadás
