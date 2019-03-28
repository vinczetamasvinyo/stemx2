*** Settings ***
Documentation  A partner meghívásának a tesztelése
# robot -d Results tests/Partnerek/partner_invite.robot

Resource  ../../Resources/partner_invite_resource.robot
Resource  ../../Resources/login_resource.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/PO/po_menu.robot
Library  ../../ExternalResources/mylibrary.py
Resource  ../../Resources/variables.robot
Variables  ../../Resources/variable.py
Library  SeleniumLibrary
Library  Collections
Library  robot.libraries.String  WITH NAME  SR

Test Setup  login_resource.Open Vk login page  ${OLDAL_URL}  ${bogeszo}
Test Teardown  common.End web test

*** Variables ***
${PARTNER_INVITE_PARTNER_INVITE_GOMB_HUN_SZOVEG} =  Partner meghívása
${PARTNER_INVITE_LONG_128_TEXT} =  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaak
${PARTNER_INVITE_MAX_LONG_KARAKTER} =  asddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
${PARTNER_INVITE_ERROR_MESSAGE_LONG_HUN} =  Kérem legfeljebb 127 karaktert adjon meg
${PARTNER_INVITE_ERROR_MESSAGE_WRONG_CARACTER} =  Ez a mező csak betűt, \'.\' és \'-\' karaktert tartalmazhat.
${PARTNER_INVITE_MINIMUM_CHARACTER} =  K
${PARTNER_INVITE_BETU} =  eekeee
${PARTNER_INVITE_BETU_KOTEJEL} =  eekeee-
${PARTNER_INVITE_BETU_KOTEJEL_PONT} =  eekeee-.
${PARTNER_INVITE_BETU_SPACE}=  eekeee DDD
${PARTNER_INVITE_WRONG_INPUT_NUMBER} =  Valami3
${PARTNER_INVITE_LABEL_CIM_HUN} =  Partner meghívása
${PARTNER_INVITE_LABEL_PARTNER_ADATAI_HUN} =  PARTNER ADATAI
${PARTNER_INVITE_LABEL_VEZETEKNEV_HUN} =  Vezetéknév
${PARTNER_INVITE_LABEL_KERESZTNEV_HUN} =  Keresztnév
${PARTNER_INVITE_LABEL_CEGNEV_HUN} =  Cégnév
${PARTNER_INVITE_LABEL_EMAIL_HUN} =  E-mail cím
${PARTNER_INVITE_LABEL_MENTES_GOMB_HUN} =  Mentés

*** Test Cases ***
Test 1
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Log  valami
    Go to the partners page via menu
    sleep  3s
    ${button_szoveg} =  get text  id=invite_partner
    Log  ${button_szoveg}
    click element  id=invite_partner
    # go to  https://dev.varoskartya.com/#/admin/user-management/partners/invite
    sleep  3s
    # click element  Mentés
    click element  xpath=//button[@type="submit"]
    #click button  Mentés
    sleep  3s
    element should be visible  xpath=//*[contains(@class,'input-error-message')]
    #elem keresese  ul.input-error-message.ng-trigger.ng-trigger-showError.ng-star-inserted

Test the partner meghivasa gomb szovege hun
    [Documentation]  Megnézzük, hogy a partner meghívása gomb szövege megfelelő-e.
    [Tags]  szoveg
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Go to the partners page via menu
    sleep  1s
    Check the partner meghivasa gomb text  ${PARTNER_INVITE_PARTNER_INVITE_GOMB_HUN_SZOVEG}

Test the partner meghivasa cim szoveg megfelelo-e hun
    [Documentation]  A teszt során azt nézzük meg, hogy a partner oldalon
                ...  a Partner meghívása cím szöveg megjelenik-e.
    [Tags]  szoveg
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Go to the partners page via menu
    sleep  1s
    Click the partner invite button
    Waite the partner invite page loaded
    check the partner meghivasa text is oke  ${PARTNER_INVITE_LABEL_CIM_HUN}

Test the Partner Adatai text megfelelo-e hun
    [Tags]  szoveg
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Go to the partners page via menu
    sleep  1s
    Click the partner invite button
    Waite the partner invite page loaded
    Check text apper above the i icon  ${PARTNER_INVITE_LABEL_PARTNER_ADATAI_HUN}

Test the vezetekev szoveg megjelenik-e a partner meghivasa oldalon hun
    [Tags]  szoveg
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Go to the partners page via menu
    sleep  1s
    Click the partner invite button
    Waite the partner invite page loaded
    Check the veznev text in the veznev div object  ${PARTNER_INVITE_LABEL_VEZETEKNEV_HUN}

Test the keresztnev szoveg megjelenik-e a partner meghivasa oldalon hun
    [Documentation]  Azt nézzük meg, hogy a keresztnév hun labelje megfelelően megjelenik-e a partnerek oldalon.
    [Tags]  szoveg
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Go to the partners page via menu
    sleep  1s
    Click the partner invite button
    Waite the partner invite page loaded
    Check the keresztnev text in the keresztnev div object  ${PARTNER_INVITE_LABEL_KERESZTNEV_HUN}

Test the cegnev szoveg megjelenik-e a partner meghivasa oldalon hun
    [Documentation]  Azt nézzük meg, hogy a cégnév hun labelje megfelelően megjelenik-e a partnerek oldalon.
    [Tags]  szoveg
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Go to the partners page via menu
    sleep  1s
    Click the partner invite button
    Waite the partner invite page loaded
    Check the cegnev text in the cegnev div object  ${PARTNER_INVITE_LABEL_CEGNEV_HUN}

Test the email szoveg megjelenik-e a parnter meghivasa oldalon hun
    [Documentation]  Azt nézzük meg, hogy az email hun labelje megfelelően megjelenik-e a partnerek oldalon.
    [Tags]  szoveg
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Go to the partners page via menu
    sleep  1s
    Click the partner invite button
    Waite the partner invite page loaded
    Check the email text in the cegnev div object  ${PARTNER_INVITE_LABEL_EMAIL_HUN}

Test the mentes gomb szovege a partner meghivasa oldalon hun
    [Documentation]  Azt nézzük meg, hogy az a partner meghivasa oldalon a Mentés gomb szövege megfelelő-e
    [Tags]  szoveg
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Go to the partners page via menu
    sleep  1s
    Click the partner invite button
    Waite the partner invite page loaded
    Check the text of mentes button on the partners page  ${PARTNER_INVITE_LABEL_MENTES_GOMB_HUN}


Test the partner meghivasa keresztnev hosszabb 128 karakter
    [Documentation]  Azt nézzük meg, hogy a teszt 128 karakternél hosszabb nevet adunk meg
    [Tags]  smoke
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Go to the partners page via menu
    sleep  1s
    Click the partner invite button
    Waite the partner invite page loaded
    Check the firstname error message is not visiable
    Give the input date for the firstname azt other field  ${PARTNER_INVITE_LONG_128_TEXT}  vala
    Check the error message text and is visiable  ${PARTNER_INVITE_ERROR_MESSAGE_LONG_HUN}

Test the partner meghivasa vezeteknev hosszabb 128 karakter
    [Documentation]  A teszt során azt nézzük meg, hogy a vezetéknévbe 128-nál hosszabb
                ...  karaktert írunk, akkor megjelenik-e a megfelelő hibüzenet.
    [Tags]  test
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Go to the partners page via menu
    sleep  1s
    Click the partner invite button
    Waite the partner invite page loaded
    ${veznev} =  Get the veznev div object from the page
    Check the div object contains the error message  ${veznev}
    Give the veznev and other field data  ${PARTNER_INVITE_LONG_128_TEXT}  egyéb
    Check the error message appear and the error text value  ${veznev}  ${PARTNER_INVITE_ERROR_MESSAGE_LONG_HUN}

Test the partner meghivasa vezeteknev max hossza
    [Documentation]  A teszt során azt nézzük meg, hogy a vezetéknévbe max karaktert írunk,
                ...  és a hibaüzenet nem jelenik meg.
    [Tags]  veznev
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Go to the partners page via menu
    sleep  1s
    Click the partner invite button
    Waite the partner invite page loaded
    ${veznev} =  Get the veznev div object from the page
    Check the div object contains the error message  ${veznev}
    Give the veznev and other field data  ${PARTNER_INVITE_MAX_LONG_KARAKTER}  egyéb
    Check the div object contains the error message  ${veznev}

Test the veznev mezobe szamot is irunk
    [Documentation]  A teszt során a vezetéknévbe számot írunk és megnézzük,
                ...  hogy a hibaüzenet megfelelő-e.
    [Tags]  szamok
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Go to the partners page via menu
    sleep  1s
    Click the partner invite button
    Waite the partner invite page loaded
    ${veznev} =  Get the veznev div object from the page
    Check the div object contains the error message  ${veznev}
    Give the veznev and other field data  ${PARTNER_INVITE_WRONG_INPUT_NUMBER}  egyéb
    Check the error message appear and the error text value  ${veznev}  ${PARTNER_INVITE_ERROR_MESSAGE_WRONG_CARACTER}

Test the veznev mezobe betut es kotojelet irunk
    [Documentation]  A teszt során a vezetéknévbe betűt és kötőjelet is írunk, és megnézzük
                ...  hogy a hibaüzenet nem jelenik meg.
    [Tags]  veznev
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Go to the partners page via menu
    sleep  1s
    Click the partner invite button
    Waite the partner invite page loaded
    ${veznev} =  Get the veznev div object from the page
    Check the div object contains the error message  ${veznev}
    Give the veznev and other field data  ${PARTNER_INVITE_BETU_KOTEJEL}  egyéb
    Check the div object contains the error message  ${veznev}

Test the veznev mezobe betut es kotojelet pontot irunk
    [Documentation]  A teszt során a vezetéknévbe betűt és kötőjelet, pontot is írunk, és megnézzük
                ...  hogy a hibaüzenet nem jelenik meg.
    [Tags]  most1
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Go to the partners page via menu
    sleep  1s
    Click the partner invite button
    Waite the partner invite page loaded
    ${veznev} =  Get the veznev div object from the page
    Check the div object contains the error message  ${veznev}
    Give the veznev and other field data  ${PARTNER_INVITE_BETU_KOTEJEL_PONT}  egyéb
    Check the div object contains the error message  ${veznev}


Test the veznev mezobe csak betuket írunk
    [Documentation]  A teszt során a vezetéknévbe csak betűket írunk és megnézzük,
                ...  hogy hibaüzenet ilyenkor nem jelenik meg.
    [Tags]  veznev
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Go to the partners page via menu
    sleep  1s
    Click the partner invite button
    Waite the partner invite page loaded
    ${veznev} =  Get the veznev div object from the page
    Check the div object contains the error message  ${veznev}
    Give the veznev and other field data  ${PARTNER_INVITE_BETU}  egyéb
    Check the div object contains the error message  ${veznev}

Test veznevbe minimum karaktert irunk be
    [Documentation]  A teszt során azt nézzük meg, hogy a vezetéknévbe beírjuk
                ...  a minimum karaktert és a hibaüzenet nem jelenik meg.
    [Tags]  veznev
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Go to the partners page via menu
    sleep  1s
    Click the partner invite button
    Waite the partner invite page loaded
    ${veznev} =  Get the veznev div object from the page
    Check the div object contains the error message  ${veznev}
    Give the veznev and other field data  ${PARTNER_INVITE_MINIMUM_CHARACTER}  egyéb
    Check the div object contains the error message  ${veznev}

Test the partner meghivasa cegnev 128 karakter
    [Documentation]  A teszt során azt nézzük meg, hogy a cégnévbe 128 karakter
                ...  hosszú szöveget írunk be, akkor megjelenik-e a megfelelő hibaüzenet.
    [Tags]  error
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Go to the partners page via menu
    sleep  1s
    Click the partner invite button
    Waite the partner invite page loaded
    ${cegnev} =  Get the cegnev div object from the page
    Check the div object contains the error message  ${cegnev}
    Give the company name and other field data  ${PARTNER_INVITE_LONG_128_TEXT}  egyéb
    Check the error message appear and the error text value  ${cegnev}  ${PARTNER_INVITE_ERROR_MESSAGE_LONG_HUN}

Test the cegnevbe minimum karaktert irunk
    [Documentation]  A teszt során azt nézzük meg, hogy a partner meghívása oldalon
                ...  a cégnév mezőbe minimum karaktert írunk és a hibaüzenet nem jelenik meg.
    [Tags]  most
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Go to the partners page via menu
    sleep  1s
    Click the partner invite button
    Waite the partner invite page loaded
    ${cegnev} =  Get the cegnev div object from the page
    Check the div object contains the error message  ${cegnev}
    Give the company name and other field data  ${PARTNER_INVITE_MINIMUM_CHARACTER}  egyéb
    Check the div object contains the error message  ${cegnev}

Test the cegnevbe betuket irunk
    [Documentation]  A teszt során azt nézzük meg, hogy a partner meghívása során az oldalon
                ...  a cégnévbe csak betűket írunk és nem jelenik meg hibaüzenet.
    [Tags]  cegnev
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Go to the partners page via menu
    sleep  1s
    Click the partner invite button
    Waite the partner invite page loaded
    ${cegnev} =  Get the cegnev div object from the page
    Check the div object contains the error message  ${cegnev}
    Give the company name and other field data  ${PARTNER_INVITE_BETU}  egyéb
    Check the div object contains the error message  ${cegnev}

Test the cegnevbe betuket es kotojelet irunk
    [Documentation]  A teszt során azt nézzük meg, hogy a partner meghívása során az oldalon
                ...  a cégnévbe csak betűket és kötőjelet írunk és nem jelenik meg hibaüzenet.
    [Tags]  cegnev
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Go to the partners page via menu
    sleep  1s
    Click the partner invite button
    Waite the partner invite page loaded
    ${cegnev} =  Get the cegnev div object from the page
    Check the div object contains the error message  ${cegnev}
    Give the company name and other field data  ${PARTNER_INVITE_BETU_KOTEJEL}  egyéb
    Check the div object contains the error message  ${cegnev}

Test the cegnevbe betuket es pontot irunk
    [Documentation]  A teszt során azt nézzük meg, hogy a partner meghívása során az oldalon
                ...  a cégnévbe csak betűket és pontot írunk és nem jelenik meg hibaüzenet.
    [Tags]  cegnev
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Go to the partners page via menu
    sleep  1s
    Click the partner invite button
    Waite the partner invite page loaded
    ${cegnev} =  Get the cegnev div object from the page
    Check the div object contains the error message  ${cegnev}
    Give the company name and other field data  ${PARTNER_INVITE_BETU_KOTEJEL_PONT}  egyéb
    Check the div object contains the error message  ${cegnev}

Test the cegnevbe betuket es space-t irunk
    [Documentation]  A teszt során azt nézzük meg, hogy a partner meghívása során az oldalon
                ...  a cégnévbe csak betűket és spacet írunk és megjelenik-e a hibaüzenet.
    [Tags]  cegnev
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Go to the partners page via menu
    sleep  1s
    Click the partner invite button
    Waite the partner invite page loaded
    ${cegnev} =  Get the cegnev div object from the page
    Check the div object contains the error message  ${cegnev}
    Give the company name and other field data  ${PARTNER_INVITE_BETU_SPACE}  egyéb
    Check the div object contains the error message  ${cegnev}


*** Keywords ***

Give the veznev and other field data
    [Documentation]  Megadjuk a vezetéknevet és egyéb adatot
    [Arguments]  ${veznev}  ${egyeb}
    give the lastname  ${veznev}
    sleep  1s
    give the firstname  ${egyeb}
    sleep  1s

Give the company name and other field data
    [Documentation]  Megadjuk a cégnevet és egyéb adatot
    [Arguments]  ${cnev}  ${egyeb}
    give the name of company  ${cnev}
    sleep  1s
    give the firstname  ${egyeb}
    sleep  1s

Check the error message appear and the error text value
    [Documentation]  Megnézzük, hogy megjelenik-e a hibaüzenet,
                ...  illetve az error hibaüzenet megfelelőe.
    [Arguments]  ${veznev}  ${hibaszoveg}
    ${van3}  ${van4} =  check the elem contain in parent2  ${veznev}  .//app-show-errors/ul/li
    should be true  ${van3}
    ${hibaszoveg} =  get text  ${van4}
    log  ${hibaszoveg}
    should be true  "${hibaszoveg}" == "${hibaszoveg}"