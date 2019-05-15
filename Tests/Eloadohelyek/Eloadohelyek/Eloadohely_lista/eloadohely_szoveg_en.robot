*** Settings ***
Documentation  A test suite-ban megnézzük angolul megfelelő szöveg jelennek-e meg.
Resource  ../../../../Resources/eloadohelyek_resource.robot

Suite Setup  Open browser and login and after go to the venues page and get listbox  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
Suite Teardown  Common.End web test
Test Template  Check the text on the venue page


*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}
${Lan} =  En
${TEXT_ID} =  text
${LIST_ID} =  listboxtext

*** Test Cases ***
Test the tittle                 ${TEXT_ID}      ${VENUES_TITTLE.${Lan}}                                 0       ${PO_ALT_PAGE_HEADER_TITTLE_ID}
    [Documentation]  Teszt során az oldal címét nézzük meg.
Search text                     ${TEXT_ID}      ${VENUES_SEARCH_TEXT.${Lan}}                            0       ${PO_ALT_LABEL_ID}
New button text                 ${TEXT_ID}      ${VENUES_NEW_BUTTON_TEXT.${Lan}}                        0       ${PO_NEW_BUTTON_TEXT_ID}
Reset button                    ${TEXT_ID}      ${VENUES_RESET_BUTTON_TEXT.${Lan}}                      0       ${PO_ALT_RESET_BUTTON_TEXT_ID}
Search button                   ${TEXT_ID}      ${VENUES_SEARCH_BUTTON_TEXT.${Lan}}                     0       ${PO_ALT_SEARCH_BUTTON_TEXT_ID}
Venue name in table header      ${TEXT_ID}      ${VENUES_TABLE_HEADER_VENUE_NAME_TEXT.${Lan}}           0       ${PO_ALT_TABLE_HEADER_BUTTON_TEXT_ID}
Venue address in table header   ${TEXT_ID}      ${VENUES_TABLE_HEADER_VENUE_ADDRESS_TEXT.${Lan}}        1       ${PO_ALT_TABLE_HEADER_TEXT_ID}
Features in table header        ${TEXT_ID}      ${VENUES_TABLE_HEADER_FEATURES_TEXT.${Lan}}             2       ${PO_ALT_TABLE_HEADER_TEXT_ID}
list firt item                  ${LIST_ID}      ${VENUES_LISTBOX_ITEM1.${Lan}}                         ${EMPTY}  ${EMPTY}  ${lista_elemek_alja}[1]
list second item                ${LIST_ID}      ${VENUES_LISTBOX_ITEM2.${Lan}}                         ${EMPTY}  ${EMPTY}  ${lista_elemek_alja}[2]
list third item                 ${LIST_ID}      ${VENUES_LISTBOX_ITEM3.${Lan}}                         ${EMPTY}  ${EMPTY}  ${lista_elemek_alja}[3]
list fourth item                ${LIST_ID}      ${VENUES_LISTBOX_ITEM4.${Lan}}                         ${EMPTY}  ${EMPTY}  ${lista_elemek_alja}[4]

*** Keywords ***
Check the text on the venue page
    [Arguments]  ${type}  ${text}  ${index}  ${path}  ${normaltext}=${EMPTY}
    Check text on the page  ${type}  ${text}  ${index}  ${path}  ${normaltext}