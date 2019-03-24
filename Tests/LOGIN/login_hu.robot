*** Settings ***
Resource  ../../Resources/variables.robot
Resource  ../../Resources/login_resource.robot
Resource  ../../Resources/login_language_resource.robot

Test Setup  Open Vk login page  ${OLDAL_URL}  chrome
Test Teardown  common.End web test

*** Variables ***
${LOGIN_NYELV_HU_JELENTKEZZ_BE} =  Jelentkezzen be a regisztrált fiókjával!
${LOGIN_NYELV_HU_EMAIL_TEXT} =  E-mail
${LOGIN_NYELV_HU_JELSZO_TEXT} =  Jelszó
${LOGIN_NYELV_HU_JELSZO_MUTATASA_TEXT} =  Jelszó mutatása
${LOGIN_NYELV_HU_BEJELENTKEZES_TEXT} =  Bejelentkezés

*** Test Cases ***
Test "jelentkez be.. " szoveg magyar tesztelese a login oldalon
    [Documentation]  Teszt során megnézzük, hogy a jelentkezz be.. szöveg magyarul
                ...  megfelelően jelenik-e meg.
    [Tags]  smoke  magyar
    sleep  1s
    check the "jelentkezz" be text in the login page  ${LOGIN_NYELV_HU_JELENTKEZZ_BE}

Test "E-mail" szoveg magyar tesztelese login oldalon
    [Documentation]  Teszt során megnézzük, hogy az E-mail szöveg magyarul jól jelenik-e meg.
    [Tags]  smoke  magyar
    sleep  1s
    Check the "E-mail" text in the login page  ${LOGIN_NYELV_HU_EMAIL_TEXT}

Test "Jelszo" szoveg magyar tesztelese a login oldalon
    [Tags]  smoke  magyar
    sleep  1s
    Check the "jelszo" text in the login page  ${LOGIN_NYELV_HU_JELSZO_TEXT}

"Jelszo mutatasa" szoveg magyar tesztelese a login oldalon
    [Tags]  smoke  magyar
    sleep  1s
    Check the "jelszo mutatasa" text in the login page  ${LOGIN_NYELV_HU_JELSZO_MUTATASA_TEXT}

"Bejelentkezes" gomb szoveg magyar tesztelese
    [Tags]  smoke  magyar
    sleep  1s
    check the "Bejelentkezes" text in the login page  ${LOGIN_NYELV_HU_BEJELENTKEZES_TEXT}
    # element text should be  class=button[class*='margin-top-1']  Bejelentkezés

Elfelejtette jeslzo szoveg magyar tesztelese
    [Tags]  most  magyar
    sleep  1s
    element text should be  css=a[href*='forgotten-password']  Elfelejtette a jelszavát?


*** Keywords ***
