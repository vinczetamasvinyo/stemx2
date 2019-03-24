*** Settings ***
Library  SeleniumLibrary
Resource  PO/po_login.robot

*** Keywords ***
check the "jelentkezz" be text in the login page
    [Arguments]  ${text}
    po_login.check "jelentkezz be"  ${text}

Check the "E-mail" text in the login page
    [Arguments]  ${text}
    po_login.check "email"  ${text}

Check the "jelszo" text in the login page
    [Arguments]  ${text}
    po_login.check "jelszo"  ${text}

Check the "jelszo mutatasa" text in the login page
    [Arguments]  ${text}
    po_login.check "jelszo mutatasa"  ${text}

check the "Bejelentkezes" text in the login page
    [Arguments]  ${text}
    check "Bejelentkezes" text in the login page  ${text}