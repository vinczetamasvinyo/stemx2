*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${PO_LOGIN_CHECK_TEXT_FOR_LOADED} =  Jelentkezzen be a regisztrált fiókjával!
${PO_LOGIN_INPUT_EMAIL_ID} =  css=input[formcontrolname=username]
${PO_LOGIN_INPUT_PASSWORD_ID} =  css=input[formcontrolname=password]
${PO_LOGIN_BUTTON_ID} =   Bejelentkezés
${PO_LOGIN_ICON_ID} =  id=menu
${PO_LOGIN_AFTER_LOGIN_TEXT_ID} =  Kezdőoldal
${PO_LOGIN_PlACEHOLDER_ATTRIB} =  placeholder
${PO_LOGIN_SHOW_PASSWORD_CHECKBOX_ID} =  id=mat-checkbox-1-input
${PO_LOGIN_SHOW_PASSWORD_CLICK_ID} =  class=mat-checkbox-inner-container
${PO_LOGIN_SHOW_PASSWORD_ATTRIB_ID} =  type
${PO_LOGIN_LANGUAGE_TEXT_ID} =  xpath=//*[@id="mat-select-0"]/div/div[1]
${PO_LOGIN_JELENTKEZ_BE_TEXT_ID} =  css=p[_ngcontent-c0]
${PO_LOGIN_LANGUAGE_ID} =  id=mat-select-0
${PO_LOGIN_LANGUAGE_ENGLISH} =  id=mat-option-0
${PO_LOGIN_JELENTKEZZ_BE_TEXT_ID} =  css=div[class=login-languge-container]>p
${PO_LOGIN_EMAIL_TEXT_ID} =  xpath=/html/body/app-root/app-authentication/auth-login/div/div[2]/div/div/form/label[1]
${PO_LOGIN_JELSZO_TEXT_ID} =  css=form[class*='ng-pristine'] > label:nth-child(2)
${PO_LOGIN_JELSZO_MUTATASA_TEXT_ID} =  class=mat-checkbox-label
${PO_LOGIN_BEJELENTKEZES_TEXT_ID} =  class=button[class*='margin-top-1']
${PO_LOGIN_GIVE_PASSWORD_PAGE} =  xpath=//input[@formcontrolname="token"]
${PO_LOGIN_GIVE_PASSWORD_TIMEOUT} =  60
${PO_LOGIN_GIVE_PASSWORD_ID} =  xpath=//input[@formcontrolname="password"]
${PO_LOGIN_GIVE_SAME_PASSWORD_ID} =  xpath=//input[@formcontrolname="passwordConfirm"]
${PO_LOGIN_REGISZTRACIO_MEGEROSITESE_BUTTON_ID} =  xpath=//*[@type="submit"]
${PO_LOGIN_ELFELEJTETT_JELSZO_TEXT_ID} =  css=a[href*='forgotten-password']
${PO_LOGIN_ELFELEJTETT_JELSZO_TEXT_ID} =   xpath=//*[@formcontrolname="token"]
${PO_LOGIN_CHECK_LOAD_TEXT} =  E-mail
${PO_LOGIN_TOKE_INPUT_FIELD_ID} =  xpath=//*[@formcontrolname="token"]
${PO_LOGIN_DELETE_PRESSKEY} =  \\8
${PO_LOGIN_TOKEN_ERROR_ID} =  xpath=//*[@class="toast-error toast ng-trigger ng-trigger-flyInOut"]
${PO_LOGIN_TOKEN_ERROR_TEXT_ID} =  xpath=//*[@role="alertdialog"]

*** Keywords ***

Wait the error message on the token page
    [Documentation]  Partner meghívása során azon az oldalon, ahol a partner
                ...  megadja a jelszavát megvárja míg a token miatt
                ...  a hibaüzenet megjelenjen.
    wait until element is visible  ${PO_LOGIN_TOKEN_ERROR_ID}

Get the error message text about the token
    [Documentation]  Partner meghívása során azon az oldalon, ahol a partner
                ...  megadja a jelszavát visszaadja a rossz token miatt szöveget.
    ${szoveg} =  get text  ${PO_LOGIN_TOKEN_ERROR_TEXT_ID}
    log  ${szoveg}
    [Return]  ${szoveg}

Delete one karakter in the token input field
    [Documentation]  Partner meghívása során azon az oldalon, ahol a partner
                ...  megadja a jelszavát töröl egy karaktert.
    press key  ${PO_LOGIN_TOKE_INPUT_FIELD_ID}    ${PO_LOGIN_DELETE_PRESSKEY}

Waiting page load an apper the element
    [Documentation]  Megnézi, hogy a login page az betöltődött-e.
    # wait until page contains  ${PO_LOGIN_CHECK_TEXT_FOR_LOADED}
    wait until element is visible  css=div[class=profile]  10
    wait until element is visible  ${PO_LOGIN_INPUT_EMAIL_ID}
    wait until page contains  ${PO_LOGIN_CHECK_LOAD_TEXT}

Waiting the login pager loaded
    [Documentation]  Megnézi, hogy a login page betöltődik-e. Látszik-e az email cím megadására szolgáló mező.
    wait until element is visible  ${PO_LOGIN_INPUT_EMAIL_ID}  20

Give the email in the login page
    [Arguments]  ${email}
    input text  ${PO_LOGIN_INPUT_EMAIL_ID}  ${email}

Give the password in the login page
    [Arguments]  ${passowrd}
    input text  ${PO_LOGIN_INPUT_PASSWORD_ID}  ${passowrd}

Click the login button in the login page
    click button  ${PO_LOGIN_BUTTON_ID}

Wait for the icon after the login
    wait until element is visible  ${PO_LOGIN_ICON_ID}  10

Check the text visiable after the login
    wait until page contains  ${PO_LOGIN_AFTER_LOGIN_TEXT_ID}

Waiting the error message
    # TODO: paramteret változóba kimozgatni.
    wait until element is visible  css=app-callout

Check the error message
    [Arguments]  ${errortext}
    # TODO: paramteret változóba kimozgatni.
    ${szoveg} =  get text  css=app-callout
    Log  ${szoveg}
    element text should be  css=app-callout  ${errortext}

Get username placeholder
    ${elem} =  get element attribute  ${PO_LOGIN_INPUT_EMAIL_ID}  ${PO_LOGIN_PlACEHOLDER_ATTRIB}
    [Return]  ${elem}

See the checkbox is not selected
    checkbox should not be selected  ${PO_LOGIN_SHOW_PASSWORD_CHECKBOX_ID}

click password show checkbox
    click element  ${PO_LOGIN_SHOW_PASSWORD_CLICK_ID}
    sleep  2s

Get the password appears or not
    ${type} =  get element attribute  ${PO_LOGIN_INPUT_PASSWORD_ID}  ${PO_LOGIN_SHOW_PASSWORD_ATTRIB_ID}
    [Return]  ${type}

check the language in login page
    [Arguments]  ${language_text}
    element text should be  ${PO_LOGIN_LANGUAGE_TEXT_ID}  ${language_text}

check the "jelentkezz be" text in the login page
    [Arguments]  ${text}
    element text should be  ${PO_LOGIN_JELENTKEZ_BE_TEXT_ID}  ${text}

Click the language
    click element  ${PO_LOGIN_LANGUAGE_ID}

chose the english
    click element  ${PO_LOGIN_LANGUAGE_ENGLISH}

check "jelentkezz be"
    [Arguments]  ${szoveg}
    element text should be  ${PO_LOGIN_JELENTKEZZ_BE_TEXT_ID}  ${szoveg}

check "email"
    [Arguments]  ${szoveg}
    element text should be  ${PO_LOGIN_EMAIL_TEXT_ID}  ${szoveg}

check "jelszo"
    [Arguments]  ${szoveg}
    element text should be  ${PO_LOGIN_JELSZO_TEXT_ID}  ${szoveg}

check "jelszo mutatasa"
    [Arguments]  ${szoveg}
    element text should be  ${PO_LOGIN_JELSZO_MUTATASA_TEXT_ID}  ${szoveg}

check "Bejelentkezes" text in the login page
    [Arguments]  ${szoveg}
    element text should be  ${PO_LOGIN_BEJELENTKEZES_TEXT_ID}  ${szoveg}

check "elfelejtett jelszo" text in the login page
    [Documentation]  Ellenőrzni a belépési oldalon az elfelejtett jelszó
                ...  szövege egyezik-e azzal amit paraméterként megadnak.
    [Arguments]  ${szoveg}
    element text should be  ${PO_LOGIN_ELFELEJTETT_JELSZO_TEXT_ID}  ${szoveg}

Wait the token page is loaded
    [Documentation]  Megnézi, hogy a partner meghívása során az új jelszó megadása oldal
                ...  az betöltődött-e.
    wait until page contains element  ${PO_LOGIN_GIVE_PASSWORD_PAGE}  ${PO_LOGIN_GIVE_PASSWORD_TIMEOUT}
    wait until page contains  Token

Give the password
    [Documentation]  A partner meghívása során a passwordot megadja a partner,
                ...  és ezzel véglegesíti a regisztrációt
    [Arguments]  ${password}
    input text  ${PO_LOGIN_GIVE_PASSWORD_ID}  ${password}

Give the same password
    [Documentation]  A partner meghívása során a passwordot újból megadja a partner.
    [Arguments]  ${passwordconfirm}
    input text  ${PO_LOGIN_GIVE_SAME_PASSWORD_ID}  ${passwordconfirm}

Push the regisztracio megerositese button
    [Documentation]  A partner meghívása során mikor a partner megadja a jelszavakat,
                ...  akkor megnyomja a regisztráció megerősítése gombot.
    click element  ${PO_LOGIN_REGISZTRACIO_MEGEROSITESE_BUTTON_ID}