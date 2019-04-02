*** Settings ***
Documentation

Resource  ../../Resources/partner_invite_password_szoveg_resource.robot

Suite Setup  Start partner invite and go to the password page
Suite Teardown  common.End web test

*** Variables ***
${PARTNER_INVITE_FOLYAMAT_TEMP_URL} =  https://temp-mail.org/
${PARTNER_INVITE_FOLYAMATA_SUBJECT_ID} =  Meghívás elfogadása
${PARTNER_INVITE_FOLYAMATA_MAIL_TIMEOUT} =  120
${PARTNER_INVITE_FOLYAMATA_SUBJECT_LINK_ID} =  link=Meghívás elfogadása
${PARTNER_INVITE_PASSWORD_SZOVEG_TITLE_TEXT} =   Regisztráció megerősítése
${PARTNER_INVITE_PASSWORD_SZOVEG_TOKEN_TEXT} =  Token
${PARTNER_INVITE_PASSWORD_SZOVEG_PASSWORD_TEXT} =  Jelszó
${PARTNER_INVITE_PASSWORD_SZOVEG_PASSWORD_AGAIN_TEXT} =  Jelszó ismét
${PARTNER_INVITE_PASSWORD_SZOVEG_REG_SUBMIT_BUTTON_TEXT} =  Regisztráció megerősítése
${PARTNER_INVITE_PASSWORD_SZOVEG_VISSZA_TEXT} =  Vissza a bejelentkezéshez

*** Test Cases ***
Test the title in the page
    [Documentation]  A teszt során azt nézzük meg, hogy parnter meghívása folyamat során,
                ...  mikor az ügyfél eljut a jelszó megadása oldalra,
                ...  akkor ott a "címnek" megfelelő-e a szövege.
    [Tags]  szoveg
    ${szoveg} =  Get the text of title
    Check the two text is same  ${szoveg}  ${PARTNER_INVITE_PASSWORD_SZOVEG_TITLE_TEXT}

Test the text of token in the page
    [Documentation]  A teszt során azt nézzük meg, hogy parnter meghívása folyamat során,
                ...  mikor az ügyfél eljut a jelszó megadása oldalra,
                ...  akkor ott a "Token"-nek megfelelő-e a szövege.
    [Tags]  szöveg
    ${label} =  Get the text of token
    Check the two text is same  ${label}  ${PARTNER_INVITE_PASSWORD_SZOVEG_TOKEN_TEXT}

Test the text of password input field in the page
    [Documentation]  A teszt során azt nézzük meg, hogy parnter meghívása folyamat során,
                ...  mikor az ügyfél eljut a jelszó megadása oldalra,
                ...  akkor ott a "jelszó"-nak megfelelő-e a szövege.
    [Tags]  szöveg
    ${jelszo} =  Get the only password text
    Check the two text is same  ${jelszo}  ${PARTNER_INVITE_PASSWORD_SZOVEG_PASSWORD_TEXT}

Test the text of password again input filed in the page
    [Documentation]  A teszt során azt nézzük meg, hogy parnter meghívása folyamat során,
                ...  mikor az ügyfél eljut a jelszó megadása oldalra,
                ...  akkor ott a "jelszó ismét" mezőnek megfelelő-e a szövege.
    [Tags]  szöveg
    ${label} =  Get the text of password again
    Check the two text is same  ${label}  ${PARTNER_INVITE_PASSWORD_SZOVEG_PASSWORD_AGAIN_TEXT}

Test the text of registration button
    [Documentation]  A teszt során azt nézzük meg, hogy parnter meghívása folyamat során,
                ...  mikor az ügyfél eljut a jelszó megadása oldalra,
                ...  akkor ott a "regisztráció megerősítése" gombnka megfelelő-e a szövege.
    [Tags]  szöveg
    ${label} =  Get the text of registration submit button
    Check the two text is same  ${label}  ${PARTNER_INVITE_PASSWORD_SZOVEG_REG_SUBMIT_BUTTON_TEXT}

Test the text of vissza a bejelentkezeshez link
    [Documentation]  A teszt során azt nézzük meg, hogy parnter meghívása folyamat során,
                ...  mikor az ügyfél eljut a jelszó megadása oldalra,
                ...  akkor ott a vissza a bejelentkezéshez linknek megfelelő-e a szövege.
    ${label} =  Get the text of vissza a bejelentkezeshez
    Check the two text is same  ${label}  ${PARTNER_INVITE_PASSWORD_SZOVEG_VISSZA_TEXT}


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