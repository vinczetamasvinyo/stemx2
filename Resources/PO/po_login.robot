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

*** Keywords ***
Waiting page load an apper the element
    # wait until page contains  ${PO_LOGIN_CHECK_TEXT_FOR_LOADED}
    wait until element is visible  css=div[class=profile]  10

Give the email in the login page
    [Arguments]  ${email}
    input text  ${PO_LOGIN_INPUT_EMAIL_ID}  ${email}

Give the password in the login page
    [Arguments]  ${passowrd}
    input text  ${PO_LOGIN_INPUT_PASSWORD_ID}  ${passowrd}

Click the login button in the login page
    click button  ${PO_LOGIN_BUTTON_ID}

Wait for the icon after the login
    wait until element is visible  ${PO_LOGIN_ICON_ID}

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