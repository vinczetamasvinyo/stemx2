*** Settings ***
Resource  ../../../../Resources/felhasznalo_meghivasa_folyamat_resource.robot

Suite Setup  Open browser and login to stemx or stemxcity and go to invite partner page  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
Test Template  Check text on the page


*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}  language=${LAN}

${LAN} =  Hun

*** Test Cases ***
Tittle on the invite page       text    ${PARTNER_INVITE_PAGE_TITTLE_TEXT.${LAN}}            0    ${PO_INVITE_USER_TITLE_TEXT_ID}
Icon user information           icon    ${PARTNER_INVITE_PAGE_ICON_TEXT.${LAN}}             0    ${EMPTY}
Firstname                       text    ${PARTNER_INVITE_PAGE_FIRSTNAME_TEXT.${LAN}}             0    ${PO_INVITE_USER_Label_ID}
Lastname                        text    ${PARTNER_INVITE_PAGE_LASTNAME_TEXT.${LAN}}                 1    ${PO_INVITE_USER_Label_ID}
Email address                   text    ${PARTNER_INVITE_PAGE_EMAIL_TEXT.${LAN}}                2    ${PO_INVITE_USER_Label_ID}
Back button                     text    ${PARTNER_INVITE_PAGE_BACK_BUTTON_TEXT.${LAN}}         0    ${PO_INVITE_USER_BACK_BUTTON_TEXT_ID}
Save button                     text    ${PARTNER_INVITE_PAGE_SAVE_BUTTON_TEXT.${LAN}}                    0    ${PO_INVITE_USER_SAVE_BUTTON_TEXT_ID}

*** Keywords ***
