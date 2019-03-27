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

Test Setup  login_resource.Open Vk login page  ${OLDAL_URL}  ${bogeszo}
Test Teardown  common.End web test

*** Variables ***
${PARTNER_INVITE_PARTNER_INVITE_GOMB_HUN_SZOVEG} =  Partner meghívása
${PARTNER_INVITE_LONG_128_TEXT} =  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaak
${PARTNER_INVITE_ERROR_MESSAGE_LONG_HUN} =  Kérem legfeljebb 127 karaktert adjon meg
${PARTNER_INVITE_ERROR_MESSAGE_WRONG_CARACTER} =  Ez a mező csak betűt, \'.\' és \'-\' karaktert tartalmazhat.
${PARTNER_INVITE_MINIMUM_CHARACTER} =  K
${PARTNER_INVITE_BETU} =  eekeee
${PARTNER_INVITE_BETU_KOTEJEL} =  eekeee-
${PARTNER_INVITE_BETU_KOTEJEL_PONT}
${PARTNER_INVITE_BETU_SPACE}=  eekeee DDD
${PARTNER_INVITE_WRONG_INPUT_NUMBER} =  Valami3
${PARTNER_INVITE_LABEL_CIM_HUN} =  Partner meghívása


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
    [Tags]  Smoke
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

test3
    [Tags]  most3
    Begin web test  https://temp-mail.org/  chrome
    wait until element is visible  id=mail  20
    ${email} =  get value  id=mail
    log  ${email}
    go to  ${OLDAL_URL}
    #sleep  3s
    #go to  https://temp-mail.org/
    #${email2} =  get value  id=mail
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Go to the partners page via menu
    sleep  1s
    Click the partner invite button
    Waite the partner invite page loaded
    input text  //input[@formcontrolname="email"]  ${email}
    input text  //input[@formcontrolname="companyName"]  cegnevvalami
    give the lastname  last
    give the firstname  valami
    click element  //button[@class="button success"]
    sleep  5s
    #element should be visible  xpath=//div[@class="toast-error toast ng-trigger ng-trigger-flyInOut"]
    wait until element is visible  //button[@class="button hollow"]  30
    sleep  8s
    click element  //*[@class="user-profile"]
    sleep  2s
    click element  //*[@id="menu_loguout"]
    sleep  2s
    go to  https://temp-mail.org/
    sleep  5s
    # wait until element is visible  Új bejelentés érkezett  120
    wait until page contains  Meghívás elfogadása   120
    click link  link=Meghívás elfogadása
    sleep  3s
    #TODO: megnézni, hogy a partial link miért nem működik.
    scroll to element  link=Regisztáció befejezése  100
    click link  link=Regisztáció befejezése
    sleep  2s
    close window
    select window  MAIN
    wait until page contains element  xpath=//input[@formcontrolname="token"]  60
    sleep  2s
    input text  xpath=//input[@formcontrolname="password"]  Vinyo123456
    input text  xpath=//input[@formcontrolname="passwordConfirm"]  Vinyo123456
    # Rákattintunk a REgisztráció megerősítése gombra
    click element  xpath=//*[@type="submit"]
    wait until page contains element  id=mat-checkbox-1  10
    sleep  2s
    close browser

*** Keywords ***

Get the veznev div object from the page
    @{elemek} =  SeleniumLibrary.Get WebElements  //div[@class="columns small-12 medium-6"]
    ${hossz} =  get length  ${elemek}
    ${veznev} =  Get From List  ${elemek}  1
    [Return]  ${veznev}



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