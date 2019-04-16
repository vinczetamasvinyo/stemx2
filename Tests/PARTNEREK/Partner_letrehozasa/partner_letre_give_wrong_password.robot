*** Settings ***
Documentation  A partner meghívása folyamat során a jelszó megadásának folyamatait teszteli.

#Todo: írd le, hogy mik bannak benne.
#Library  SeleniumLibrary
#Resource  ../../../Resources/partner_invite_give_wrong_resource.robot
#Resource  ../../../Resources/partner_letre_folyamat_resource.robot
Resource  ../../../Resources/partner_letre_give_wrong_password_resource.robot

Suite Setup  Egyeb url  ${Partner_data}  ${Tempmail}  ${LOGIN}  ${bogeszo}
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

&{LOGIN}  email=${box_office1_email_ok}
     ...  password=${box_office1_password_ok}

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

*** Keywords ***
Egyeb url
    [Arguments]  ${data}  ${tempmail}  ${login}  ${bong}
    Start partner creation and go to the token page  ${data}  ${tempmail}  ${login}  ${bong}
    #Start partner invite and go to the password page
    ${url} =  get location
    log  ${url}
    ${token_url} =  set variable  ${url}
    set suite variable  ${token_url}