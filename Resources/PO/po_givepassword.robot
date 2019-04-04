*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${PO_GIVEPASSWORD_TITLE_ID} =  xpath=//div/p[1]
${PO_GIVEPASSWORD_TOKEN_ID} =  xpath=//label[1]
${PO_GIVEPASSWORD_PASSWORD_TEXT_ID} =  xpath=//label[2]
${PO_GIVEPASSWORD_PASSWORDAGAIN_TEXT_ID} =  xpath=//label[3]
${PO_GIVEPASSWORD_REG_BUTTON_ID} =  xpath=//button
${PO_GIVEPASSWORD_VISSZA_ID} =  xpath=//a
${PO_GIVEPASSWORD_ERROR_MESSAGE_NOT_SAME_PASSWORD_ID} =  xpath=//label[3]/app-show-errors/ul/li
${PO_GIVEPASSWORD_ERROR_MESSAGE_PASSWORD_ID} =  xpath=//label[2]/app-show-errors/ul/li


*** Keywords ***

Check the error message not visiable above the password1
    [Documentation]  Megnézi, hogy a password1 input alatt a hibaüzenet nem jelenik meg.
    element should not be visible  ${PO_GIVEPASSWORD_ERROR_MESSAGE_PASSWORD_ID}

Get the error message when give not same password
    wait until element is visible  ${PO_GIVEPASSWORD_ERROR_MESSAGE_NOT_SAME_PASSWORD_ID}
    ${szoveg} =  get text  ${PO_GIVEPASSWORD_ERROR_MESSAGE_NOT_SAME_PASSWORD_ID}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the error message from password input
    [Documentation]  Visszaadja a jelszó field alatt megjelenő hibaüzenetet.
    wait until element is visible  ${PO_GIVEPASSWORD_ERROR_MESSAGE_PASSWORD_ID}
    element should be visible  ${PO_GIVEPASSWORD_ERROR_MESSAGE_PASSWORD_ID}
    ${szoveg} =  get text  ${PO_GIVEPASSWORD_ERROR_MESSAGE_PASSWORD_ID}
    log  ${szoveg}
    [Return]  ${szoveg}

Get the text of title
    [Documentation]  A password meghívása során a jelszó megadása oldalról visszaadja a title szövegét.
    ${label} =  get text  ${PO_GIVEPASSWORD_TITLE_ID}
    log  ${label}
    [Return]  ${label}

Get the text of token
    [Documentation]  A password meghívása során a jelszó megadása oldalról visszaadja a Token szövegét.
    ${label} =  get text  ${PO_GIVEPASSWORD_TOKEN_ID}
    log  ${label}
    [Return]  ${label}

Get the text of password
    [Documentation]  A password meghívása során a jelszó megadása oldalról visszaadja a jelszó szövegét.
                ...  itt mivel nagyobb szöveget ad vissza, így ezt még le kell vágni.
    ${label} =  get text  ${PO_GIVEPASSWORD_PASSWORD_TEXT_ID}
    log  ${label}
    [Return]  ${label}

Get the text of password again
    [Documentation]  A partner meghívása során a jelszó megadása oldalról visszaadja a jelszó ismét szövegét.
    ${label1} =  get text  ${PO_GIVEPASSWORD_PASSWORDAGAIN_TEXT_ID}
    log  ${label1}
    [Return]  ${label1}

Get the text of registration submit button
    [Documentation]  A partner meghívása során a jelszó megadása oldalról visszaadja
                ...  a regisztráció megerősítése button szövegét.
    ${label} =  get text  //button
    log  ${label}
    [Return]  ${label}

Get the text of vissza a bejelentkezeshez
    ${label} =  get text  ${PO_GIVEPASSWORD_VISSZA_ID}
    log  ${label}
    [Return]  ${label}