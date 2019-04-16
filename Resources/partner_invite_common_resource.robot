*** Settings ***
Library  SeleniumLibrary
Library  SeleniumLibrary
Library  String
Resource  variables.robot
Variables  variable.py
Resource  PO/po_tempmail.robot
Resource  PO/po_menu.robot
Resource  PO/po_mymenu.robot
Resource  PO/po_givepassword.robot
Resource  partner_invite_resource.robot
Resource  login_resource.robot

*** Variables ***
${PARTNER_INVITE_FOLYAMAT_TEMP_URL} =  https://temp-mail.org/
${PARTNER_INVITE_FOLYAMATA_SUBJECT_ID} =  Meghívás elfogadása
${PARTNER_INVITE_FOLYAMATA_MAIL_TIMEOUT} =  120
${PARTNER_INVITE_FOLYAMATA_SUBJECT_LINK_ID} =  link=Meghívás elfogadása
${PARTNER_INVITE_PASSWORD_SZOVEG_TITLE_TEXT} =   Regisztráció megerősítése

*** Keywords ***

Start partner invite and go to the password page
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
    go to  https://temp-mail.org/
    # wait until element is visible  Új bejelentés érkezett  120
    po_tempmail.Waiting and click the mail in themp page  ${PARTNER_INVITE_FOLYAMATA_SUBJECT_ID}  ${PARTNER_INVITE_FOLYAMATA_MAIL_TIMEOUT}  ${PARTNER_INVITE_FOLYAMATA_SUBJECT_LINK_ID}
    #TODO: megnézni, hogy a partial link miért nem működik.
    Scroll and click the link in the email  link=Regisztáció befejezése  100
    close window
    select window  MAIN
    Wait the token page is loaded

Login and go to partners page
    login_resource.Open Vk login page  ${OLDAL_URL}  ${bogeszo}
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    Go to the partners page via menu

#Login and go to the partners page
#    [Arguments]  ${oldal}  ${bongeszo}  ${email}  ${jelszo}
#    login_resource.Open Vk login page  ${oldal}  ${bongeszo}
#    Give regeistration data and click the login button  ${email}  ${jelszo}
#    Check the login succes or not
#    Go to the partners page via menu