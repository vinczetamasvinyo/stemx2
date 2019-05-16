*** Settings ***
Documentation  A suite a partner létrehozása folyamathoz kapcsolódó
          ...  teszteseteket tartalmazza.
          ...  Például partner létrehozása teljes partneradattal,
          ...  és minimum adatokkal.

Resource  ../../../../Resources/partner_letre_folyamat_resource.robot

*** Variables ***
#&{LOGIN_DATA}  email=${box_office1_email_ok1}  password=${box_office1_password_ok1}  partner=${VARIABLES_PARTNER}
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}  language=${LAN}
${LAN}=  Hun
&{valami}  a=valami1  b=valami2

*** Test Cases ***
Test create new partner with full data
    [Tags]  most
    ${email} =  po_tempmail.Get the email address from the tempmail  ${bogeszo}
    ${Partner_data.Email} =  set variable  ${email}
    ${szoveg} =  get time in string
    ${Partner_data.Companyname} =  Catenate  ${Partner_data.Companyname}  ${szoveg}
    log to console  ${Partner_data.Companyname}
    go to  ${OLDAL_URL}
	Login and go the new partner page  ${LOGIN_DATA}
	Create new partner  ${Partner_data}
    Check the partner status  ${email}  Active
    Full logout
    #Logout
    #Logout on the csharp page
    #go to  https://dev.api.stx.interticket.com/Account/logout
    #Wait the Yes button apper after the logout in clogin page
    #Push the Yes after the logout
    #Wait the logout finish on the cloggin page
    Go tempmail and wait the reg email az open  ${Tempmail}
    #TODO: megnézni, hogy a partial link miért nem működik.
    close window
    select window  MAIN
    Finish the registration the stemx or stemc page   ${password_ok2}
    #Finish the registration the stemx or stemc page
    #Give the password on the clogin page  ${password_ok2}
    #Give the password again on the clogin page  password_ok2
    #Push the reset password button on the clogin page
    #Finish the registration in the token page  ${PARTNER_INVITE_FOLYAMATA_JO_PASSWORD}
    ${logindatap} =  create dictionary
    set to dictionary  ${logindatap}  email  ${email}
    set to dictionary  ${logindatap}  password  Vinyo123456_
    set to dictionary  ${logindatap}  partner  ${Partner_data.Companyname}
    Login to stemx or stemxcity  ${logindatap}
    #Give login date and login  ${email}  ${PARTNER_INVITE_FOLYAMATA_JO_PASSWORD}

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
