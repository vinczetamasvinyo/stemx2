*** Settings ***
Resource  ../../../../Resources/auditoriums_resource.robot

Suite Setup  Open browser and login and after go to the auditoriums page  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
Suite Teardown  Common.End web test
Test Template  Check the text on the auditoriums page

*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}
${LAN} =  Hun


# ${type}  ${text}  ${index}  ${path}
*** Test Cases ***
Tittle of the page          text       ${AUDITORIUMS_TITTLE_TEXT.${LAN}}                     0    ${PO_AUDITORIUMS_TITLE_TEXT_ID}
Search input text           text       ${AUDITORIUMS_SEARCH_INPUT_TEXT.${LAN}}               0    ${PO_AUDITORIUMS_LABEL_ID}
Showe delted auditoriusm    text       ${AUDITORIUMS_CHECKBOX_TEXT.${LAN}}                   1    ${PO_AUDITORIUMS_LABEL_ID}
New auditoriums button      text       ${AUDITORIUMS_NEW_BUTTON_TEXT.${LAN}}                 0    ${PO_AUDITORIUMS_NEW_BUTTON_TEXT_ID}
Reset button                text       ${AUDITORIUMS_RESET_BUTTON_TEXT.${LAN}}               0    ${PO_AUDITORIUMS_RESET_BUTTON_TEXT_ID}
Search button               text       ${AUDITORIUMS_SEARCH_BUTTON_TEXT.${LAN}}              0    ${PO_AUDITORIUMS_SEARCH_BUTTON_TEXT_ID}
Table header1               text       ${AUDITORIUMS_TABLE_HEADER_AUDIT_NAME_TEXT.${LAN}}    0    ${PO_AUDITORIUMS_TABLE_HEADER1_TEXT_ID}
Tabel header2               text       ${AUDITORIUMS_TABLE_HEADER_ADDRESS_NAME_TEXT.${LAN}}    0    ${PO_AUDITORIUMS_TABLE_HEADER2_TEXT_ID}
Tabel header3               text       ${AUDITORIUMS_TABLE_HEADER_CAPACITY_TEXT.${LAN}}    0        ${PO_AUDITORIUMS_TABLE_HEADER3_TEXT_ID}
Tabel header4               text       ${AUDITORIUMS_TABLE_HEADER_Feature_TEXT.${LAN}}    0        ${PO_AUDITORIUMS_TABLE_HEADER4_TEXT_ID}
Placeholder                 pholder    ${AUDITORIUMS_SEARCH_INPUT_PLACEHOLDER_TEXT.${LAN}}               0    xpath=//input