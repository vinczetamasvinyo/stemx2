*** Settings ***
Library  SeleniumLibrary
Suite Teardown  Common.End web test
Resource  ../Resources/Common_resource.robot
#robot -d results -i most Tests/fel.robot

*** Variables ***
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

