*** Settings ***
Documentation  A loginhoz kapcsolódó funkcionális teszteket tartalmazza.

Resource  ../../Resources/login_resource.robot
Resource  ../../Resources/Common.robot
Library  Collections
Library  ../../ExternalResources/mylibrary.py
Resource  ../../Resources/variables.robot
Variables  ../../Resources/variable.py

Test Setup  Open Vk login page  ${OLDAL_URL}  ${bogeszo}
Test Teardown  common.End web test

*** Variables ***
${bogeszo} =  chrome
${EMAIL_SUCCES} =  ${EM_SUC}
${EMAIL_IS_NOT_EXIST} =  valami@valami.hu
${EMAIL_IS_NOT_EXIST_PASSWORD} =  123456
${EMAIL_SUCCES_PASSWORD} =  ${PASSWORD_OK}
${ERROR_TEXT_HU_GIVE_WRONG_PASSWORD} =  Kedves felhasználó\nA megadott email cím vagy jelszó helytelen. Kérjük próbálja újra.\nclose
${EMAIL_PLACEHOLDER_TEXT} =  somebody@example.com
${SHORT_PASSWORD} =  1111

# Teszt sikeres login
# sikertelen login jelszó
# Sikertelen login rossz login + jelszó
# Placeholder checkolása
# jelszó mutatása funkció tesztelése

*** Test Cases ***
Sikeres bejelentkezes jo loginnal es jelszoval
    [Documentation]  A teszt során sikeres bejelentkezést teszteljük.
                ...  Jó email címet és jó jelszót adunk meg.
    [Tags]  smoke  login
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not

Sikertelen bejelentkezes rossz jeleszo
    [Documentation]  A teszt során a sikertelen bejelentkezést teszteljük rossz jelszóval.
                ...  Illetve ellenőrizzük hogy ilyenkor megfelelő hibaüzenet jelenik-e meg.
    [Tags]  login
    Give regeistration data and click the login button  ${EMAIL_SUCCES}  ${EMAIL_IS_NOT_EXIST_PASSWORD}
    Check the login status if gave a worng password  ${ERROR_TEXT_HU_GIVE_WRONG_PASSWORD}

Sikertelen bejelentkezes nemletezo login es jelszoval
    [Documentation]  A teszt során azt nézzük, hogy nem létező loginnal
                ...  nem sikerülhet a bejelentezés. Hibaüzenetnek kell megjelennie
    [Tags]  login
    Give regeistration data and click the login button  ${EMAIL_IS_NOT_EXIST}  ${EMAIL_SUCCES_PASSWORD}
    Check the login status if gave a worng password  ${ERROR_TEXT_HU_GIVE_WRONG_PASSWORD}

Test the language setting in the login page
    [Documentation]  A teszt során azt nézzük meg, hogy a nyelvválasztó működik-e
                ...  a bejelentkezés oldalon.
    [Tags]  smoke
    Chechked the language is Hungarian in the login page
    Changed the language in the login page
    Chechked the language is English in the login page

Test the email placeholder
    [Documentation]  A teszt során azt nézzük meg, hogy az email mezőhoz
                ...  tartozó placeholder példa email megjelenik-e.
    [Tags]  smoke
    ${placeholder} =  Get and log the placeholder email of username
    Check the email text of placeholder  ${placeholder}  ${EMAIL_PLACEHOLDER_TEXT}

Test the checkbox of password is not select
    [Documentation]  A teszt során azt nézzük meg, hogy a jelszó
                ...  mutatása checkbox nincs bekapcsolva.
    [Tags]  smoke
    Check the "password show" checkbox status

Test the password show
    [Documentation]  A teszt soránt az nézzük meg, hogyha beírunk egy jelszót majd
                ...  bekapcsoljuk a jelszó mutatását, akkor azt látszik-e.
    [Tags]  smoke
    Give the password in th CK login page  ${SHORT_PASSWORD}
    Click the show password checkbox in the login page
    Check that we see the password and logs

*** Keywords ***
