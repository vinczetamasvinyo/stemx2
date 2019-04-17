*** Settings ***
Library  SeleniumLibrary
Resource  partner_invite_give_wrong_resource.robot
Resource  partner_letre_folyamat_resource.robot
Resource  variables/token_password_variable.robot

*** Keywords ***
reload the token page
    [Documentation]  A token-t tartalmazó oldalt újratölti.
    reload page
    Wait the token page is loaded

Give the passwords on the token page
    [Documentation]  A token page-en megadja a jelszavakat.
                ...  A két jelszót paraméterben kapja meg.
    [Arguments]  ${password1}  ${Password2}
    give the password  ${password1}
    Give the same password  ${Password2}

Give the passwords on the token page and push save button
    [Documentation]  A token pagen megadja a jelszavakat és megnyomja a mentés gomobt.
    [Arguments]  ${password1}  ${Password2}
    Give the passwords on the token page  ${password1}  ${Password2}
    Push the regisztracio megerositese button

Reload page give pass and push save button
    [Documentation]  Újratölti az oldalt, majd megadja a jelszavakat
                ...  és megnyomja mentés gombot.
    [Arguments]   ${password1}  ${Password2}
    reload the token page
    Give the passwords on the token page  ${password1}  ${Password2}
    Push the regisztracio megerositese button

Egyeb url
    [Arguments]  ${data}  ${tempmail}  ${login}  ${bong}
    Start partner creation and go to the token page  ${data}  ${tempmail}  ${login}  ${bong}
    ${url} =  get location
    log  ${url}
    ${token_url} =  set variable  ${url}
    set suite variable  ${token_url}