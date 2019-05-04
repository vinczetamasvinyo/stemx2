*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Common.robot

*** Variables ***
${PO_TEMPMAIL_URL} =  https://temp-mail.org/
${PO_TEMPMAIL_EMAIL_ID} =  id=mail
${PO_TEMPMAIL_WAITING} =  20
&{PO_TEMPMAIL_SUBJECT}  stemx=Regisztráció  stemc=Meghívás elfogadása
${PO_TEMPMAIL_SUBJECT_LINK} =  link=${PO_TEMPMAIL_SUBJECT.${DE}}
${PO_TEMPMAIL_BODY_LINK} =  link=Regisztáció befejezése

&{Tempmail}  url=${PO_TEMPMAIL_URL}
        ...  subject=${PO_TEMPMAIL_SUBJECT.${DE}}
        ...  timeout=${PO_TEMPMAIL_WAITING}
        ...  subjectlink=${PO_TEMPMAIL_SUBJECT_LINK}
        ...  bodylink=${PO_TEMPMAIL_BODY_LINK}

*** Keywords ***
Go tempmail and wait the reg email az open
    [Documentation]  Elnavigál az ideiglenes megvárja amíg az email megérkezik az email
                ...  majd azt megnyitja.
                ...  Paraméterek amiket megkap:
                ...  url: ez az oldal címe ahova az email érkezik.
                ...  timeout: meddig várakozik az email-re a program.
                ...  subjectlink: id-ja ami alapján meg tudja nyitni a meail
                ...  bodylink: body-ban lévő link amit meg kell nyitni.
    [Arguments]  ${adat}
    go to  ${adat.url}
    po_tempmail.Waiting and click the mail in themp page  ${adat.subject}  ${adat.timeout}  ${adat.subjectlink}
    #TODO: megnézni, hogy a partial link miért nem működik.
    Scroll and click the link in the email  ${adat.bodylink}  20

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
    scroll to element  //*[@class="inbox-area"]  10
    wait until page contains  ${subject}  ${timeout}
    scroll to element  ${email_id}  100
    sleep  1s
    click link  ${email_id}
    sleep  1s

Scroll and click the link in the email
    [Documentation]  A megnyitott email-ben legörget a linkig, majd
                ...  rákattint a megadott linkre.
    [Arguments]  ${link_id}  ${scroll_space}
    sleep  1s
    wait until element is visible  ${link_id}
    scroll to element  ${link_id}  ${scroll_space}
    click link  ${link_id}
    sleep  1s