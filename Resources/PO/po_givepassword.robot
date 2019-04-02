*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${PO_GIVEPASSWORD_TITLE_ID} =  xpath=//div/p[1]
${PO_GIVEPASSWORD_TOKEN_ID} =  xpath=//label[1]
${PO_GIVEPASSWORD_PASSWORD_TEXT_ID} =  xpath=//label[2]
${PO_GIVEPASSWORD_PASSWORDAGAIN_TEXT_ID} =  xpath=//label[3]
${PO_GIVEPASSWORD_REG_BUTTON_ID} =  xpath=//button
${PO_GIVEPASSWORD_VISSZA_ID} =  xpath=//a

*** Keywords ***

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