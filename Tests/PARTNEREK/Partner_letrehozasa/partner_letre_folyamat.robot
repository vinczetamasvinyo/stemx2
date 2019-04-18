*** Settings ***
Documentation  A suite a partner létrehozása folyamathoz kapcsolódó
          ...  teszteseteket tartalmazza.
          ...  Például partner létrehozása teljes partneradattal,
          ...  és minimum adatokkal.

Resource  ../../../Resources/partner_letre_folyamat_resource.robot

*** Variables ***
&{valami}  a=valami1  b=valami2

*** Test Cases ***
Test create new partner with full data
    ${email} =  po_tempmail.Get the email address from the tempmail  ${bogeszo}
    ${Partner_data.Email} =  set variable  ${email}
    go to  ${OLDAL_URL}
	Login and go the new partner page  ${box_office1_email_ok}  ${box_office1_password_ok}
	Create new partner  ${Partner_data}
    Check the partner status  ${email}  Active
    Logout
    Go tempmail and wait the reg email az open  ${Tempmail}
    #go to  ${PARTNER_INVITE_FOLYAMAT_TEMP_URL}
    #po_tempmail.Waiting and click the mail in themp page  ${PARTNER_INVITE_FOLYAMATA_SUBJECT_ID}  ${PARTNER_INVITE_FOLYAMATA_MAIL_TIMEOUT}  ${PARTNER_INVITE_FOLYAMATA_SUBJECT_LINK_ID}
    #TODO: megnézni, hogy a partial link miért nem működik.
    #Scroll and click the link in the email  link=Regisztáció befejezése  100
    close window
    select window  MAIN
    Finish the registration in the token page  ${PARTNER_INVITE_FOLYAMATA_JO_PASSWORD}
    Give login date and login  ${email}  ${PARTNER_INVITE_FOLYAMATA_JO_PASSWORD}

Test2
    ${email} =  po_tempmail.Get the email address from the tempmail  ${bogeszo}
    ${P_DATA_SMALL.Email} =  set variable  ${email}
    go to  ${OLDAL_URL}
	Login and go the new partner page  ${box_office1_email_ok}  ${box_office1_password_ok }
	Create new partner  ${P_DATA_SMALL}
    Check the partner status  ${email}  Active
    Logout
    Go tempmail and wait the reg email az open  ${Tempmail}
    #go to  ${PARTNER_INVITE_FOLYAMAT_TEMP_URL}
    #po_tempmail.Waiting and click the mail in themp page  ${PARTNER_INVITE_FOLYAMATA_SUBJECT_ID}  ${PARTNER_INVITE_FOLYAMATA_MAIL_TIMEOUT}  ${PARTNER_INVITE_FOLYAMATA_SUBJECT_LINK_ID}
    #TODO: megnézni, hogy a partial link miért nem működik.
    #Scroll and click the link in the email  link=Regisztáció befejezése  100
    close window
    select window  MAIN
    Finish the registration in the token page  ${PARTNER_INVITE_FOLYAMATA_JO_PASSWORD}
    Give login date and login  ${email}  ${PARTNER_INVITE_FOLYAMATA_JO_PASSWORD}


*** Keywords ***
