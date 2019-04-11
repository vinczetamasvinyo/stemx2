*** Settings ***
# robot -d results tests/login/login_hu.robot
Resource  ../../Resources/variables.robot
Resource  ../../Resources/login_resource.robot
Resource  ../../Resources/login_language_resource.robot

Suite Setup  Open Vk login page and changed english  ${OLDAL_URL}  ${bogeszo}
Suite Teardown  common.End web test

*** Variables ***
${Nyelv} =  En


*** Test Cases ***
Test "jelentkez be.. " szoveg magyar tesztelese a login oldalon
    [Documentation]  Teszt során megnézzük, hogy a jelentkezz be.. szöveg magyarul
                ...  megfelelően jelenik-e meg.
    [Tags]  smoke  magyar
    check the "jelentkezz" be text in the login page  ${LOGIN_TO.${Nyelv}}

Test "E-mail" szoveg magyar tesztelese login oldalon
    [Documentation]  Teszt során megnézzük, hogy az E-mail szöveg magyarul jól jelenik-e meg.
    [Tags]  smoke  magyar
    Check the "E-mail" text in the login page  ${EMAIL.${Nyelv}}

Test "Jelszo" szoveg magyar tesztelese a login oldalon
    [Documentation]  Teszt során megnézzük, hogy a jelszó szövege
                ...  magyar jól nelenik-e meg.
    [Tags]  smoke  magyar
    Check the "jelszo" text in the login page  ${PASSWORD.${Nyelv}}

"Jelszo mutatasa" szoveg magyar tesztelese a login oldalon
    [Documentation]  Teszt során megnézzük, hogy a jelszó mutatása szöveg
                ...  magyarul jól jelenik-e meg.
    [Tags]  smoke  magyar
    Check the "jelszo mutatasa" text in the login page  ${SHOW_PASSWORD.${Nyelv}}

"Bejelentkezes" gomb szoveg magyar tesztelese
    [Documentation]  Teszt során azt nézzük meg, hogy a Bejelentkezés gomb
                ...  szövege magyarul jól jelenik-e meg.
    [Tags]  smoke  magyar
    check the "Bejelentkezes" text in the login page  ${BEJELENTKEZES.${Nyelv}}

Elfelejtette jelszo szoveg magyar tesztelese
    [Documentation]  Teszt során azt nézzük meg, hogy a bejelentkezési oldalon
                ...  az elfelejtett jelszó szövege megfelelő-e.
    [Tags]  smoke  magyar
    #TODO: megcsinálni a po fájlba való mozgatást
    check "elfelejtett jelszo" text in the login page  ${FORGOT_PASSWORD.${Nyelv}}



*** Keywords ***
