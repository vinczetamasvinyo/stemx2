*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Common.robot

*** Variables ***
${PO_TEMPMAIL_URL} =  https://temp-mail.org/
${PO_TEMPMAIL_EMAIL_ID} =  id=mail
${PO_TEMPMAIL_WAITING} =  20

*** Keywords ***
Get the email address from the tempmail
    [Documentation]  Megnyitja a böngészőt és temp-emil helyről visszaadja a megjelenő email címet.
    [Arguments]  ${bongeszo}
    Begin web test  ${PO_TEMPMAIL_URL}  ${bongeszo}
    wait until element is visible  ${PO_TEMPMAIL_EMAIL_ID}  ${PO_TEMPMAIL_WAITING}
    ${email} =  get value  ${PO_TEMPMAIL_EMAIL_ID}
    log  ${email}
    [Return]  ${email}

Waiting and click the mail in themp page
    [Documentation]  A temp mail oldalon megvárja amíg az email megérkezik,
                ...  majd rákattint a linkre, hogy megnyissa az emailt
    [Arguments]  ${subject}  ${timeout}  ${email_id}
    wait until page contains  ${subject}  ${timeout}
    click link  ${email_id}
    sleep  1s

Scroll and click the link in the email
    [Documentation]  A megnyitott email-ben legörget a linkig, majd rákattint a megadott linkre.
    [Arguments]  ${link_id}  ${scroll_space}
    sleep  1s
    wait until element is visible  ${link_id}
    scroll to element  ${link_id}  ${scroll_space}
    click link  ${link_id}
    sleep  1s