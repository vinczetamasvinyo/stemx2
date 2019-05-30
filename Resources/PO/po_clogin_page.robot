*** Settings ***
Library  SeleniumLibrary
Resource  ../variables.robot

*** Variables ***
${PO_CLOGIN_PAGE_LOGIN_BUTTON_ID} =  xpath=//button[@value="login"]
${PO_CLOGIN_PAGE_LOGIN_INPUT_ID} =  id=Username
${PO_CLOGIN_PAGE_PASSWORD_INPUT_ID} =  id=Password
${PO_CLOGIN_PAGE_PASSWORD__AGAIN_INPUT_ID} =  id=PasswordAgain
${PO_CLOGIN_PAGE_RESET_PASSWORD_BUTTON_ID} =  xpath=//button[@value="reset"]
${PO_CLOGIN_PAGE_YES_BUTTON_ID} =  xpath=//*[@class="btn btn-primary"]
${PO_CLOGIN_PAGE_LOGOUT_URL_ID} =  ${stemxoldalak_logout.${ENV}}

*** Keywords ***

Waiting clogin page loaded
    [Documentation]  Megvárja amíg a clogin page betöltődik.
    wait until element is visible  ${PO_CLOGIN_PAGE_LOGIN_BUTTON_ID}

Give the login data on the clogin page
    [Documentation]  A Clgoin page-en megadja a login nevet és a jelszót.
    [Arguments]  ${login}  ${password}
    Give the username on the clogin page  ${login}
    Give the password on the clogin page  ${password}

Give the username on the clogin page
    [Documentation]  Megadja a login nevet a clogin paga-en.
    [Arguments]  ${login}
    input text  ${PO_CLOGIN_PAGE_LOGIN_INPUT_ID}  ${login}

Give the password on the clogin page
    [Documentation]  Megadja a login jelszót a clgoin page oldalon.
    [Arguments]  ${password}
    input text  ${PO_CLOGIN_PAGE_PASSWORD_INPUT_ID}  ${password}

Give the password again on the clogin page
    [Documentation]  Megadja a login jelszót a clgoin page oldalon.
    [Arguments]  ${password}
    input text  ${PO_CLOGIN_PAGE_PASSWORD__AGAIN_INPUT_ID}  ${password}

Push the login button on the clogin page
    [Documentation]  Megnyomja a login gombot a clogin page-en
    click element  ${PO_CLOGIN_PAGE_LOGIN_BUTTON_ID}

Push the reset password button on the clogin page
    [Documentation]  Megnyomja a reset password gombot a clogin page-en.
    click element  ${PO_CLOGIN_PAGE_RESET_PASSWORD_BUTTON_ID}

Push the Yes after the logout
    [Documentation]  Logout után megnyomja a Yes button-t.
    click element  ${PO_CLOGIN_PAGE_YES_BUTTON_ID}

Wait the Yes button apper after the logout in clogin page
    [Documentation]  Logout után megvárja amíg a yes button megjeleni az oldalon.
    wait until element is visible  ${PO_CLOGIN_PAGE_YES_BUTTON_ID}

Wait the logout finish on the cloggin page
    [Documentation]  Megvárja amíg a logout befejeződik a csharp login oldalon.
    wait until page contains  You are now logged out

Start logout on the csharp login page
    [Documentation]  Elindítja a logout-t a csharp page-en.
    go to  ${PO_CLOGIN_PAGE_LOGOUT_URL_ID}

Logout on the csharp page
    [Documentation]  Elvégzi a logout a csharp oldalon
    Start logout on the csharp login page
    #Wait the Yes button apper after the logout in clogin page
    #Push the Yes after the logout
    Wait the logout finish on the cloggin page

Give tha password and push the reset button on the csharp login page
    [Documentation]  A charp oldalon megadja a jelszavakat egymsá után,
                ...  majd megnyomja a reset gombot.
    [Arguments]  ${password}
    Give the password on the clogin page  ${password}
    Give the password again on the clogin page  ${password}
    Push the reset password button on the clogin page