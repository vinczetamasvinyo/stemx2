*** Settings ***
Resource  partner_invite_resource.robot
Resource  login_resource.robot
Resource  Common.robot
Resource  PO/po_menu.robot
Library   ../ExternalResources/mylibrary.py
Resource  ../Resources/variables.robot
Variables  variable.py
Library  SeleniumLibrary
Library  Collections
Resource  PO/po_userprofile.robot
Resource  PO/po_tempmail.robot
Resource  PO/po_mymenu.robot
Resource  PO/po_partners.robot
Resource  Common_resource.robot
Resource  variables/partner_letre_variable.robot
Library  ../ExternalResources/mylibrary.py

*** Keywords ***
Create new partner
	[Documentation]  Létrehoz egy új partnert. A folyamat a partnerek oldalról indul.
	            ...  1. Megnyomja a új partner.
	            ...  2. Megvárja míg az oldal betöltődik.
	            ...  3. Megadja a partner adatait ami a változóban jönnek.
	            ...  4. Megnyomja a mentés gombot.
	            ...  5. Megvárja amígy a mentés sikeresen megjelenik.
	[Arguments]  ${partner_data}
	Click the new partner
    Waiting the new partner page loaded
    Give the all partner data  ${partner_data}
    po_partners.Push the jovahagy button
    Wait the succes message and click
    sleep  1s

Check the partner status
    [Documentation]  A partner oldalon rákeres a paraméterben megkapott
                ...  email címre és a másik paraméterben megkapott ikont
                ...  leellenőrzi.
    [Arguments]  ${email}  ${ikon}
    give the email for the search input  ${email}
    po_partners.Click the search button
    sleep  2s
    run keyword if  "${ikon}" == "Active"  Check the active icon is appear

Start partner creation and go to the token page
    [Arguments]  ${data}  ${tempmail}  ${login}  ${bong}
    ${email} =  po_tempmail.Get the email address from the tempmail  ${bong}
    ${data.Email} =  set variable  ${email}
    go to  ${OLDAL_URL}
	Login and go the new partner page  ${login.email}  ${login.password}
	Create new partner  ${data}
    Check the partner status  ${email}  Active
    Logout
    Go tempmail and wait the reg email az open  ${tempmail}
    #go to  ${PARTNER_INVITE_FOLYAMAT_TEMP_URL}
    #po_tempmail.Waiting and click the mail in themp page  ${PARTNER_INVITE_FOLYAMATA_SUBJECT_ID}  ${PARTNER_INVITE_FOLYAMATA_MAIL_TIMEOUT}  ${PARTNER_INVITE_FOLYAMATA_SUBJECT_LINK_ID}
    #TODO: megnézni, hogy a partial link miért nem működik.
    #Scroll and click the link in the email  link=Regisztáció befejezése  100
    close window
    select window  MAIN
    Wait the token page is loaded