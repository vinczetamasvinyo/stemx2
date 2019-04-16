*** Settings ***
Documentation  A partner meghívása folyamat során a jelszó megadásának folyamatait teszteli.

#Todo: írd le, hogy mik bannak benne.
Library  SeleniumLibrary
Resource  ../../Resources/partner_invite_give_wrong_resource.robot

Suite Setup  Egyeb url
Suite Teardown  common.End web test

*** Variables ***
${PARTNER_INVITE_GIVE_GOOD_PASSWORD} =  Vinyo123456
${PARTNER_INVITE_WRONG_TOKEN_ERROR_TEXT} =  Érvénytelen token
${PARTNER_INVITE_WRONG_PASSWORD_ERROR_TEXT} =  A jelszó nem egyezik meg a megerősítéssel
${PARTNER_INVITE_WRONG_PASSWORD1} =  Vinyo123456
${PARTNER_INVITE_WRONG_PASSWORD2} =  Vinyo12345678
${PARTNER_INVITE_WRONG_SHORT_PASSWORD} =  Vinyo
${PARTNER_INVITE_WRONG_WEEK_PASSWORD} =  A jelszó nem elég erős
${PARTNER_INVITE_WRONG_ONLY_NUMBER_PASSWORD} =  12345678
${PARTNER_INVITE_WRONG_ONLY_ALPHA_PASSWORD} =  asdfghjkl
${PARTNER_INVITE_WRONG_ONLY_CA_PASSWORD} =  ASDFGHJKL
${PARTNER_INVITE_WRONG_NC_PASSWORD} =  12345678v
${PARTNER_INVITE_WRONG_NBC_PASSWORD} =  12345678V
${PARTNER_INVITE_WRONG_BALA_PASSWORD} =  Vinyooooooo
${PARTNER_INVITE_WRONG_GOOD_PASSWORD_SPECIAL} =  Vinyo1@-_$€?!#

*** Test Cases ***
Test when the token is not good
    [Documentation]  A teszt során azt nézzük meg, hogy token-t átírjuk,
                ...  majd így próbálunk meg regisztrálni.
    [Tags]  smoke
    reload page
    Wait the token page is loaded
    po_login.Delete one karakter in the token input field
    sleep  1s
    Give the password  ${PARTNER_INVITE_GIVE_GOOD_PASSWORD}
    Give the same password  ${PARTNER_INVITE_GIVE_GOOD_PASSWORD}
    Push the regisztracio megerositese button
    Check the error message in the token page  ${PARTNER_INVITE_WRONG_TOKEN_ERROR_TEXT}

Test when give not same password
    [Documentation]  A teszt során azt nézzük meg, hogy a partner meghívása során
                ...  nem ugyan azt a két passwordot adjuk meg és a hibaüzenet
                ...  az megjelenik-e.
    [Tags]  smoke
    reload page
    Wait the token page is loaded
    give the password  ${PARTNER_INVITE_WRONG_PASSWORD1}
    Give the same password  ${PARTNER_INVITE_WRONG_PASSWORD2}
    Push the regisztracio megerositese button
    Check the error message when give not same password  ${PARTNER_INVITE_WRONG_PASSWORD_ERROR_TEXT}

Test the givE the wrong short password.
    [Documentation]  A teszt során azt nézzük meg, hogy a partner meghívása során
                ...  rövid passwordot adunk meg és, hogy megjelenik-e a hibaüzenet
    [Tags]  smoke
    reload page
    Wait the token page is loaded
    give the password  ${PARTNER_INVITE_WRONG_SHORT_PASSWORD}
    Give the same password  ${PARTNER_INVITE_WRONG_SHORT_PASSWORD}
    Push the regisztracio megerositese button
    Check the error message in password input field  ${PARTNER_INVITE_WRONG_WEEK_PASSWORD}

Test the give the wrong password-only number
    [Documentation]  A teszt során azt nézzük meg, hogy a partner meghívása során
                ...  rossz passwordot adunk meg és megjelenik-e a hibaüzenet.
                ...  A jelszó csak számokból áll.
    reload page
    Wait the token page is loaded
    give the password  ${PARTNER_INVITE_WRONG_ONLY_NUMBER_PASSWORD}
    Give the same password  ${PARTNER_INVITE_WRONG_ONLY_NUMBER_PASSWORD}
    Push the regisztracio megerositese button
    Check the error message in password input field  ${PARTNER_INVITE_WRONG_WEEK_PASSWORD}

Test the give the wrong password-kisbetu
    [Documentation]  A teszt során azt nézzük meg, hogy a partner meghívása során
                ...  rossz passwordot adunk meg és megjelenik-e a hibaüzenet.
                ...  A jelszó csak kisbetűből áll.
    reload page
    Wait the token page is loaded
    give the password  ${PARTNER_INVITE_WRONG_ONLY_ALPHA_PASSWORD}
    Give the same password  ${PARTNER_INVITE_WRONG_ONLY_ALPHA_PASSWORD}
    Push the regisztracio megerositese button
    Check the error message in password input field  ${PARTNER_INVITE_WRONG_WEEK_PASSWORD}

Test the give the wrong password-Nagybetu
    [Documentation]  A teszt során azt nézzük meg, hogy a partner meghívása során
                ...  rossz passwordot adunk meg és megjelenik-e a hibaüzenet.
                ...  A jelszó csak Naggybetűből áll.
    reload page
    Wait the token page is loaded
    give the password  ${PARTNER_INVITE_WRONG_ONLY_CA_PASSWORD}
    Give the same password  ${PARTNER_INVITE_WRONG_ONLY_CA_PASSWORD}
    Push the regisztracio megerositese button
    Check the error message in password input field  ${PARTNER_INVITE_WRONG_WEEK_PASSWORD}

Test the give the wrong password-szamok, kisbetu
    [Documentation]  A teszt során azt nézzük meg, hogy a partner meghívása során
                ...  rossz passwordot adunk meg és megjelenik-e a hibaüzenet.
                ...  A jelszó csak szambol és kisbetuből áll.
    reload page
    Wait the token page is loaded
    give the password  ${PARTNER_INVITE_WRONG_NC_PASSWORD}
    Give the same password  ${PARTNER_INVITE_WRONG_NC_PASSWORD}
    Push the regisztracio megerositese button
    Check the error message in password input field  ${PARTNER_INVITE_WRONG_WEEK_PASSWORD}

Test the give the wrong password-szamok, nagybetu
    [Documentation]  A teszt során azt nézzük meg, hogy a partner meghívása során
                ...  rossz passwordot adunk meg és megjelenik-e a hibaüzenet.
                ...  A jelszó csak szmból és naggybetűből áll.
    reload page
    Wait the token page is loaded
    give the password  ${PARTNER_INVITE_WRONG_NBC_PASSWORD}
    Give the same password  ${PARTNER_INVITE_WRONG_NBC_PASSWORD}
    Push the regisztracio megerositese button
    Check the error message in password input field  ${PARTNER_INVITE_WRONG_WEEK_PASSWORD}

Test the give the wrong password-kisbetu, nagybetu
    [Documentation]  A teszt során azt nézzük meg, hogy a partner meghívása során
                ...  rossz passwordot adunk meg és megjelenik-e a hibaüzenet.
                ...  A jelszó csak kisbetubol és naggybetűből áll.
    reload page
    Wait the token page is loaded
    give the password  ${PARTNER_INVITE_WRONG_BALA_PASSWORD}
    Give the same password  ${PARTNER_INVITE_WRONG_BALA_PASSWORD}
    Push the regisztracio megerositese button
    Check the error message in password input field  ${PARTNER_INVITE_WRONG_WEEK_PASSWORD}

Test the give the good password specialis karakter
    [Documentation]  A teszt során azt nézzük meg, hogy a partner meghívása során
                ...  jó passwordot adunk meg és nem jelenik meg hibaüzenet.
                ...  A jelszó megfelelő és speciális karaktareket tartalmaz.
    reload page
    Wait the token page is loaded
    give the password  ${PARTNER_INVITE_WRONG_GOOD_PASSWORD_SPECIAL}
    Give the same password  ${PARTNER_INVITE_WRONG_GOOD_PASSWORD_SPECIAL}
    po_givepassword.Check the error message not visiable above the password1

*** Keywords ***
Egyeb url
    Start partner invite and go to the password page
    ${url} =  get location
    log  ${url}
    ${token_url} =  set variable  ${url}
    set suite variable  ${token_url}

