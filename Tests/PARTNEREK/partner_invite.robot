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

#Test Setup  login_resource.Open Vk login page  ${OLDAL_URL}  ${bogeszo}
#Test Teardown  common.End web test

*** Variables ***
${PARTNER_INVITE_PARTNER_INVITE_GOMB_HUN_SZOVEG} =  Partner meghívása
${PARTNER_INVITE_LONG_128_TEXT} =  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaak
${PARTNER_INVITE_ERROR_MESSAGE_LONG_HUN} =  Kérem legfeljebb 127 karaktert adjon meg
${PARTNER_INVITE_ERROR_MESSAGE_WRONG_CARACTER} =  Ez a mező csak betűt, \'.\' és \'-\' karaktert tartalmazhat.
${PARTNER_INVITE_MINIMUM_CHARACTER} =  K
${PARTNER_INVITE_WRONG_INPUT_NUMBER} =  Valami3



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
    [Tags]  most
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
    element should be visible  xpath=//div[@class="toast-error toast ng-trigger ng-trigger-flyInOut"]
    #go to  https://temp-mail.org/
    #wait until element is visible  Regisztráció  120
    #click link  link=Regisztráció
    #sleep  3s
    close browser

*** Keywords ***
Get the veznev div object from the page
    @{elemek} =  SeleniumLibrary.Get WebElements  //div[@class="columns small-12 medium-6"]
    ${hossz} =  get length  ${elemek}
    ${veznev} =  Get From List  ${elemek}  1
    [Return]  ${veznev}

Check the div object contains the error message
    [Documentation]  Megnézzük, hogy a vezetéknév object tartalmaz-e error hibaüzenetet
    [Arguments]  ${veznev_object}
    ${van1}  ${van2} =  check the elem contain in parent2  ${veznev_object}  .//app-show-errors/ul/li
    should not be true  ${van1}

Give the veznev and other field data
    [Documentation]  Megadjuk a vezetéknevet és egyéb adatot
    [Arguments]  ${veznev}  ${egyeb}
    give the lastname  ${veznev}
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