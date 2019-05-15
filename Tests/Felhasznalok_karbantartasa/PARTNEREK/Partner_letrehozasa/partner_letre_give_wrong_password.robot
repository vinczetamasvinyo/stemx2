*** Settings ***
Documentation  A test suite a partner létrehozása során azokat a teszteseteket
          ...  tartalmazza amikor a meghívott partnernek jelszót kell megadnia.

Resource  ../../../../Resources/partner_letre_give_wrong_password_resource.robot

Suite Setup  Egyeb url  ${Partner_data}  ${Tempmail}  ${LOGIN_DATA}  ${bogeszo}
Suite Teardown  common.End web test

*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}  language=${Lan}
${Lan} =  Hun
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

&{LOGIN}  email=${box_office1_email_ok}
     ...  password=${box_office1_password_ok}

*** Test Cases ***
Test when the token is not good
    [Documentation]  A teszt során azt nézzük meg, hogy token-t átírjuk,
                ...  majd így próbálunk meg jelszót megadni.
    [Tags]  smoke  Medium
    reload the token page
    po_login.Delete one karakter in the token input field
    sleep  1s
    Give the passwords on the token page and push save button  ${PARTNER_INVITE_GIVE_GOOD_PASSWORD}  ${PARTNER_INVITE_GIVE_GOOD_PASSWORD}
    Check the error message in the token page  ${WRONG_TOKEN.${Lan}}

Test when give not same password
    [Documentation]  A teszt során azt nézzük meg, hogy a partner meghívása során
                ...  nem ugyan azt a két passwordot adjuk meg és a hibaüzenet
                ...  az megjelenik-e.
    [Tags]  smoke  Medium
    Reload page give pass and push save button  ${PARTNER_INVITE_WRONG_PASSWORD1}  ${PARTNER_INVITE_WRONG_PASSWORD2}
    Check the error message when give not same password  ${NOT_SAME_PASSOWRD.${Lan}}

Test the give the wrong short password
    [Documentation]  A teszt során azt nézzük meg, hogy a partner meghívása
                ...  során rövid passwordot adunk meg és, hogy megjelenik-e
                ...  a hibaüzenet
    [Tags]  smoke  Medium
    Reload page give pass and push save button  ${PARTNER_INVITE_WRONG_SHORT_PASSWORD}  ${PARTNER_INVITE_WRONG_SHORT_PASSWORD}
    Check the error message in password input field  ${WEEK_PASSWORD.${Lan}}

Test the give the wrong password-only number
    [Documentation]  A teszt során azt nézzük meg, hogy a partner meghívása
                ...  során nem jó passwordot adunk meg és, hogy megjelenik-e
                ...  a hibaüzenet. A jelszó csak számokból áll.
    [Tags]  smoke  Medium
    Reload page give pass and push save button  ${PARTNER_INVITE_WRONG_ONLY_NUMBER_PASSWORD}  ${PARTNER_INVITE_WRONG_ONLY_NUMBER_PASSWORD}
    Check the error message in password input field  ${WEEK_PASSWORD.${Lan}}

Test the give the wrong password-kisbetu
    [Documentation]  A teszt során azt nézzük meg, hogy a partner meghívása
                ...  során rossz passwordot adunk meg és megjelenik-e
                ...  a hibaüzenet. A jelszó csak kisbetűből áll.
    [Tags]  smoke  Medium
    Reload page give pass and push save button  ${PARTNER_INVITE_WRONG_ONLY_ALPHA_PASSWORD}  ${PARTNER_INVITE_WRONG_ONLY_ALPHA_PASSWORD}
    Check the error message in password input field  ${WEEK_PASSWORD.${Lan}}

Test the give the wrong password-Nagybetu
    [Documentation]  A teszt során azt nézzük meg, hogy a partner meghívása
                ...  során rossz passwordot adunk meg és megjelenik-e a hibaüzenet.
                ...  A jelszó csak Naggybetűből áll.
    [Tags]  smoke  Medium
    Reload page give pass and push save button  ${PARTNER_INVITE_WRONG_ONLY_CA_PASSWORD}  ${PARTNER_INVITE_WRONG_ONLY_CA_PASSWORD}
    Check the error message in password input field  ${WEEK_PASSWORD.${Lan}}

Test the give the wrong password-szamok, kisbetu
    [Documentation]  A teszt során azt nézzük meg, hogy a partner meghívása
                ...  során rossz passwordot adunk meg és megjelenik-e a hibaüzenet.
                ...  A jelszó csak szambol és kisbetuből áll.
    [Tags]  smoke  Medium
    Reload page give pass and push save button  ${PARTNER_INVITE_WRONG_NC_PASSWORD}  ${PARTNER_INVITE_WRONG_NC_PASSWORD}
    Check the error message in password input field  ${WEEK_PASSWORD.${Lan}}

Test the give the wrong password-szamok, nagybetu
    [Documentation]  A teszt során azt nézzük meg, hogy a partner meghívása
                ...  során rossz passwordot adunk meg és megjelenik-e a hibaüzenet.
                ...  A jelszó csak számból és naggybetűből áll.
    [Tags]  smoke  Medium
    Reload page give pass and push save button  ${PARTNER_INVITE_WRONG_NBC_PASSWORD}  ${PARTNER_INVITE_WRONG_NBC_PASSWORD}
    Check the error message in password input field  ${WEEK_PASSWORD.${Lan}}

Test the give the wrong password-kisbetu, nagybetu
    [Documentation]  A teszt során azt nézzük meg, hogy a partner meghívása
                ...  során rossz passwordot adunk meg és megjelenik-e a hibaüzenet.
                ...  A jelszó csak kisbetubol és naggybetűből áll.
    [Tags]  smoke  Medium
    Reload page give pass and push save button  ${PARTNER_INVITE_WRONG_BALA_PASSWORD}  ${PARTNER_INVITE_WRONG_BALA_PASSWORD}
    Check the error message in password input field  ${WEEK_PASSWORD.${Lan}}

Test the give the good password specialis karakter
    [Documentation]  A teszt során azt nézzük meg, hogy a partner meghívása során
                ...  jó passwordot adunk meg és nem jelenik meg hibaüzenet.
                ...  A jelszó megfelelő és speciális karaktareket tartalmaz.
    [Tags]  smoke  Medium
    reload the token page
    Give the passwords on the token page  ${PARTNER_INVITE_WRONG_GOOD_PASSWORD_SPECIAL}  ${PARTNER_INVITE_WRONG_GOOD_PASSWORD_SPECIAL}
    po_givepassword.Check the error message not visiable above the password1