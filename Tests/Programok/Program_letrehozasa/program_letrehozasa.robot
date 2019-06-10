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
              ...  "ticketassigns":[{"id":"1", "all":"true", "tickets":["jegy1"]},
                               ...  {"id":"2", "all":"false", "tickets":["jegy2"]}]
                ...  }


*** Test Cases ***
Test1
    ${PROGRAM_DATA4} =   evaluate  json.loads('''${PROGRAM_DATA2}''')    json
    ${ido} =  get time in string
    ${name} =  set variable  Igazság bajnoka${ido}
    ${PROGRAM_DATA4} =  update in dictionary  ${PROGRAM_DATA4}  program_name  ${name}
    Create program  ${PROGRAM_DATA4}

Test2
    repeat keyword  10 times  Program ismetlese

*** Keywords ***
Program ismetlese
    ${PROGRAM_DATA4} =   evaluate  json.loads('''${PROGRAM_DATA2}''')    json
    ${ido} =  get time in string
    ${name} =  set variable  Igazság bajnoka${ido}
    ${PROGRAM_DATA4} =  update in dictionary  ${PROGRAM_DATA4}  program_name  ${name}
    Create program  ${PROGRAM_DATA4}




