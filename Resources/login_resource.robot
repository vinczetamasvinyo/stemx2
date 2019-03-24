*** Settings ***
Library  SeleniumLibrary
Resource  PO/po_login.robot
Resource  Common.robot

*** Variables ***
${LANGUAGE_MAGYAR_TEXT} =  Hungarian
${LANGUAGE_ENGLISH_TEXT} =  English
${LOGIn_RESOURCE_JELENTKEZ_BE_TEXT_HU} =  Jelentkezzen be a regisztrált fiókjával!
${LOGIN_RESOURCE_JELENTKEZ_BE_TEXT_EN} =  Sign in with your registered account!

*** Keywords ***
Open Vk login page
    [Arguments]  ${oldal}   ${bongeszo}
    common.Begin web test  ${oldal}  ${bongeszo}
    sleep  3s
    Waiting for login page will load

Waiting for login page will load
    po_login.Waiting page load an apper the element

Give regeistration data and click the login button
    [Arguments]  ${e_mail}  ${password}
    Give the email in the login page  ${e_mail}
    #input text  xpath=//*[@formcontrolname="username"]  tamas.vincze@interticket.hu
    Give the password in the login page  ${password}
    #input text  xpath=//*[@formcontrolname="password"]  Vinyo123456
    Click the login button in the login page
    #click button  Bejelentkezés

Check the login succes or not
    #sleep  3s
    Wait for the icon after the login
    Check the text visiable after the login
    sleep  3s

Check the login status if gave a worng password
    [Documentation]  A keyword azt nézi meg, hogyha rossz jelszót adunk meg,
                ...  akkor minden jól jelenik meg az oldalon
    [Arguments]  ${error_text}
    Waiting the error message
    Check the error message  ${error_text}

Get and log the placeholder email of username
    ${place} =  Get username placeholder
    Log  ${place}
    [Return]  ${place}

Check the email text of placeholder
    [Arguments]  ${place}  ${text}
    should be equal as strings  ${place}    ${text}

Check the "password show" checkbox status
    See the checkbox is not selected

Give the password in th CK login page
    [Arguments]  ${password}
    po_login.give the password in the login page  ${password}

Click the show password checkbox in the login page
    click password show checkbox

Check that we see the password and logs
    po_login.Get the password appears or not
    ${type} =  po_login.Get the password appears or not
    log  ${type}

Chechked the language is Hungarian in the login page
    [Documentation]  Megnézzük, hogy a nyelvválasztó magyar-e.
                ...  Megnézünk egy elemet, hogy magyarul van-e beírva
    sleep  1s
    check the language in login page  ${LANGUAGE_MAGYAR_TEXT}
    check the "jelentkezz be" text in the login page  ${LOGIn_RESOURCE_JELENTKEZ_BE_TEXT_HU}


Changed the language in the login page
    click the language
    chose the english
    waiting for login page will load

Chechked the language is English in the login page
    sleep  1s
    check the language in login page  ${LANGUAGE_ENGLISH_TEXT}
    check the "jelentkezz be" text in the login page  ${LOGIN_RESOURCE_JELENTKEZ_BE_TEXT_EN}

