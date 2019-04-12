*** Settings ***
Resource  ../../../Resources/partner_letre_folyamat_resource.robot


*** Variables ***
${PARTNER_INVITE_FOLYAMAT_TEMP_URL} =  https://temp-mail.org/
${PARTNER_INVITE_FOLYAMATA_SUBJECT_ID} =  Meghívás elfogadása
${PARTNER_INVITE_FOLYAMATA_MAIL_TIMEOUT} =  120
${PARTNER_INVITE_FOLYAMATA_SUBJECT_LINK_ID} =  link=Meghívás elfogadása
${PARTNER_INVITE_FOLYAMATA_JO_PASSWORD} =  Vinyo123456

*** Test Cases ***
Test1
    ${email} =  po_tempmail.Get the email address from the tempmail  ${bogeszo}
    go to  ${OLDAL_URL}
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    Go to the partners page via menu
	Click the new partner
    Waiting the new partner page loaded
    give the firstname  Tamás
    give the lastname  Vincze
    give the email of partner  ${email}
    #po_partners.Give the name of company  cegnevvalami
    #TOdo: ide a központit kell írni
    input text  //*[@formgroupname="company"]//*[@formcontrolname="name"]  Valami cégnév
    Give the copany long name  Vinyó cégéne hosszú név
    Give the registration number  12121212121212
    Give the country2  Németország
    Give the zipcode  1139
    Give the city  Budapest
    Give the county  Pest
    Give the street  Váci út
    Give the housenumber  99
    Give the door  11
    Give the floor  10
    Give the billing name  Vinyó cégének számlázási neve
    Give the billing taxnumber  1212121223222
    Give the billing bankname  OTP
    Give the billing banknumber  117112211-11223311
    Give the billing iban number  72811882211
    Give the billing swift number  2728112277
    Give the billing country2  Magyarország
    Give the billing zipcode  1144
    Give the billing city  Budapest
    Give the billing county  Pest
    Give the billing street  Füredi utca
    Give the billing housenumber  11/D
    Give the billing door  41
    Give the billing floor  10
    Give the contact phone  +36209602628
    input text  //*[@formarrayname="contacts"]//input[@formcontrolname="firstName"]  Tamás
    input text  //*[@formarrayname="contacts"]//input[@formcontrolname="lastName"]  Vincze
    input text  xpath=//*[@formarrayname="contacts" ]//input[@formcontrolname="email"]   ${email}
    click element  //button[@class="button success"]
    Wait the succes message and click
    sleep  1s
    give the email for the search input  ${email}
    po_partners.Click the search button
    sleep  2s
    Check the active icon is appear
    Click the Mymenu
    Click the logout submenu
    go to  ${PARTNER_INVITE_FOLYAMAT_TEMP_URL}
    # wait until element is visible  Új bejelentés érkezett  120
    po_tempmail.Waiting and click the mail in themp page  ${PARTNER_INVITE_FOLYAMATA_SUBJECT_ID}  ${PARTNER_INVITE_FOLYAMATA_MAIL_TIMEOUT}  ${PARTNER_INVITE_FOLYAMATA_SUBJECT_LINK_ID}
    #TODO: megnézni, hogy a partial link miért nem működik.
    Scroll and click the link in the email  link=Regisztáció befejezése  100
    close window
    select window  MAIN
    Wait the token page is loaded
    PO_login.Give the password  ${PARTNER_INVITE_FOLYAMATA_JO_PASSWORD}
    PO_login.Give the same password  ${PARTNER_INVITE_FOLYAMATA_JO_PASSWORD}
    po_login.Push the regisztracio megerositese button
    Wait the succes message and click
    po_login.Waiting the login pager loaded
    Give regeistration data and click the login button  ${email}  ${PARTNER_INVITE_FOLYAMATA_JO_PASSWORD}
    Check the login succes or not


*** Keywords ***
