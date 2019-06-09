*** Settings ***
Library  SeleniumLibrary
Library  robot.libraries.DateTime
Suite Teardown  Common.End web test
Resource  ../Resources/Common_resource.robot
#robot -d results -i most Tests/fel.robot

*** Variables ***
${MY_DATA_TABLE_VALUES_TEMP}  {"foo": "this is foo",
                          ...  "bar": "this is bar",
                          ...  "valami": {"a": "eredmeny"}}

${PROGRAM_DATA2} =  {"program_name": "Csillagok zuhanása",
               ...  "program_description": "részletes leírás",
               ...  "program_long_description": "részletes leírás",
               ...  "program_tax": {"type":"name", "text":"B - 25%"},
               ...  "default_ticket_type": {"type":"index", "text":"1"},
               ...  "ives_ticket_template": {"type":"index", "text":"1"},
               ...  "db_ticket_template": {"type":"index", "text":"1"},
               ...  "electronic_ticket_template": {"type":"index", "text":"1"},
               ...  "venuename": "Előadóhely neve",
               ...  "maincategory": {"type":"index", "text":"1"},
               ...  "subcategory": {"type":"name", "list":["Alkategória 1", "Alkategória 2"]},
               ...  "auditorium": {"type": "name", "text": "Teszt stadion 333333 (100 000 fő)"},
               ...  "tickets":[{"ticketname": "jegy1", "ticketprice":"1000","ticketmaxcapacity":"1000","ticketgroup":"ticketcsoport"},
                          ...  {"ticketname": "jegy2", "ticketprice":"1002","ticketmaxcapacity":"1002","ticketgroup":"ticketcsoport2"}],
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
              ...  "ticketassigns":[{"id":"1", "tickets":["jegy1","jegy2"]},
                               ...  {"id":"2", "tickets":["jegy2"]}]
                ...  }

&{USER}  Firstname=Vincze
    ...  Lastname=Tamás
    ...  Email=${EMPTY}
    ...  Phone=+36209602628
    ...  Birthday=1984.02.24
    ...  Birthplace=Ózd
    ...  Mothername=Anyja neve
    ...  Birthname=Szuletési név
    ...  Gender=0
    ...  Role=system admin
    #...  Picture=C:/Vinyo/hibakepek/2019.02.27/teszt_kep.jpg

#&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}  language=${LAN}
${LAN}=  Hun

*** Test Cases ***
test0
    ${MY_DATA_TABLE_VALUES} =   evaluate  json.loads('''${PROGRAM_DATA2}''')    json
    log  ${MY_DATA_TABLE_VALUES}[program_description]
    log  ${PROGRAM_DATA2}


    ${alap} =  set variable  2019-06-11 16:00:00
    ${data} =  Convert Date  ${alap}  result_format=%d.%b.%Y %H:%M


test1
    [Tags]  most
    ${email} =  po_tempmail.Get the email address from the tempmail  ${bogeszo}
    ${USER.Email} =  set variable  ${email}
    go to  ${OLDAL_URL}
    Login to stemx or stemxcity  ${LOGIN_DATA}
    #Give login date and login  ${box_office1_email_ok}  ${box_office1_password_ok }
    Go to the new user page
    Give the user data  ${USER}
    #choose file  id=profile-picture-upload   C:/Vinyo/hibakepek/2019.02.27/teszt_kep.jpg
    #Ezt kell kivenni
    #input text  id=profile-picture-upload  C:/Vinyo/hibakepek/2019.02.27/teszt_kep.jpg
    po_alt.Click the save button
    Wait the succes message and click
    Click the Mymenu
    Click the logout submenu
    go to  ${PARTNER_INVITE_FOLYAMAT_TEMP_URL}
    po_tempmail.Waiting and click the mail in themp page  ${PARTNER_INVITE_FOLYAMATA_SUBJECT_ID}  ${PARTNER_INVITE_FOLYAMATA_MAIL_TIMEOUT}  ${PARTNER_INVITE_FOLYAMATA_SUBJECT_LINK_ID}
    #Scroll and click the link in the email  link=Regisztáció befejezése  100
    Scroll and click the link in the email  xpath=//a[@rel="external"]  100
    close window
    select window  MAIN
    Wait the token page is loaded
    PO_login.Give the password  Vinyo123456
    PO_login.Give the same password  Vinyo123456
    po_login.Push the regisztracio megerositese button
    Wait the succes message and click
    po_login.Waiting the login pager loaded
    Give regeistration data and click the login button  ${email}  Vinyo123456
    Check the login succes or not
    Sleep  3s

*** Keywords ***

