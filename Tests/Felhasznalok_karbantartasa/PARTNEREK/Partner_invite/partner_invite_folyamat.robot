*** Settings ***
# robot -d results -t test3 Tests/partnerek/partner_invite_folyamat.robot

Resource  ../../../../Resources/partner_invite_resource.robot

*** Variables ***
${PARTNER_INVITE_FOLYAMAT_TEMP_URL} =  https://temp-mail.org/
#${PARTNER_INVITE_FOLYAMATA_SUBJECT_ID} =  Meghívás elfogadása
#${PARTNER_INVITE_FOLYAMATA_SUBJECT_ID} =  Regisztráció
${PARTNER_INVITE_FOLYAMATA_SUBJECT_ID} =  Registrering
${PARTNER_INVITE_FOLYAMATA_MAIL_TIMEOUT} =  120
#${PARTNER_INVITE_FOLYAMATA_SUBJECT_LINK_ID} =  link=Meghívás elfogadása
#${PARTNER_INVITE_FOLYAMATA_SUBJECT_LINK_ID} =  link=Regisztráció
${PARTNER_INVITE_FOLYAMATA_SUBJECT_LINK_ID} =  link=Registrering
${PARTNER_INVITE_FOLYAMATA_JO_PASSWORD} =  Vinyo123456
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}  language=${LAN}
${LAN}=  Hun

*** Test Cases ***
test3
    [Tags]  most3
    ${email} =  po_tempmail.Get the email address from the tempmail  ${bogeszo}
    go to  ${OLDAL_URL}
    Login to stemx or stemxcity  ${logindata}
    Go to the partners page via menu
    Click the partner invite button
    Waite the partner invite page loaded
    po_partners.Give the email of partner  ${email}
    ${ido} =  get time in string
    ${nev} =  set variable  Meghivaspartner${ido}
    po_partners.Give the name of company   ${nev}
    po_partners.give the lastname  last
    po_partners.give the firstname  valami
    po_partners.Push the Mentes button on the parner invite page
    Wait the succes message and click
    Full logout
    go to  ${PARTNER_INVITE_FOLYAMAT_TEMP_URL}
    # wait until element is visible  Új bejelentés érkezett  120
    po_tempmail.Waiting and click the mail in themp page  ${PARTNER_INVITE_FOLYAMATA_SUBJECT_ID}  ${PARTNER_INVITE_FOLYAMATA_MAIL_TIMEOUT}  ${PARTNER_INVITE_FOLYAMATA_SUBJECT_LINK_ID}
    #TODO: megnézni, hogy a partial link miért nem működik.
    Scroll and click the link in the email  link=Registrering  100
    close window
    select window  MAIN
    sleep  2s
    #input text  id=Password  Vinyo123456_
    #Give the password on the clogin page  ${password_ok2}
    Finish the registration the stemx or stemc page   ${password_ok2}
    ${logindatap} =  create dictionary
    set to dictionary  ${logindatap}  email  ${email}
    set to dictionary  ${logindatap}  password  ${password_ok2}
    set to dictionary  ${logindatap}  partner   ${nev}
    set to dictionary  ${logindatap}  language  ${LAN}
    Login to stemx or stemxcity  ${logindatap}
    Click the Mymenu
    po_mymenu.click the myprofil
    give the phone number  +36209602628
    Give the birthday  1984.02.24
    Give the birthplace  Ózd
    Give the mothename  Anyja neve
    Give the birthname  Vincze Tamás
    Click the man
    Push the first save button
    Wait the succes message and click
    Give the copany long name  Vinyó cégéne hosszú név
    Give the registration number  12121212121212
    #Give the country
    Give the country2  Dánia
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
    Give the billing country2  Dánia
    #Give the billing country
    Give the billing zipcode  1144
    Give the billing city  Budapest
    Give the billing county  Pest
    Give the billing street  Füredi utca
    Give the billing housenumber  11/D
    Give the billing door  41
    Give the billing floor  10
    #Give the availability phone  +36209602628
    push the second save button
    Wait the succes message and click
    Full logout
    go to  ${OLDAL_URL}
    Login to stemx or stemxcity  ${logindata}
    Go to the partners page via menu
    Give the email for the search input  ${email}
    po_partners.Click the search button
    sleep  2s
    po_partners.Check the waiting for confirmation icon is appear
    Click the Megtekintes icon
    Waiting the details of partner page loaded
    po_partners.Push the jovahagy button
    Waiting the jovahagy popup appear
    Push the igen button on the popup appear
    Wait the succes message and click
    give the email for the search input  ${email}
    po_partners.Click the search button
    sleep  2s
    Check the active icon is appear
    close browser

test6
    [Tags]  valami
    ${email} =  po_tempmail.Get the email address from the tempmail  ${bogeszo}
    go to  ${OLDAL_URL}
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Go to the partners page via menu
    sleep  1s
    Click the partner invite button
    Waite the partner invite page loaded
    po_partners.Give the email of partner  ${email}
    po_partners.Give the name of company  cegnevvalami
    po_partners.give the lastname  last
    po_partners.give the firstname  valami
    po_partners.Push the Mentes button on the parner invite page
    Wait the succes message and click
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
    #wait until page contains element  xpath=//input[@formcontrolname="token"]  60
    PO_login.Give the password  ${PARTNER_INVITE_FOLYAMATA_JO_PASSWORD}
    Give the same password  Vinyo12345678
    click element  xpath=//*[@type="submit"]
    wait until element is visible  xpath=//app-show-errors/ul/li
    ${szoveg} =  get text  xpath=//app-show-errors/ul/li
    should be true  "${szoveg}" == "A jelszó nem egyezik meg a megerősítéssel"

*** Keywords ***
