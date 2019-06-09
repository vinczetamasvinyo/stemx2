*** Settings ***
Documentation  A test suite-ban megnézzük magyarul megfelelő szöveg jelennek-e meg.

Resource  ../../../../Resources/events_resource.robot
Suite Setup  Open browser and login and go to the events page  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
#Test Template  Check the text on the events page


*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}  language=${LAN}
${Lan} =  Hun
${TEXT_ID} =  text
${LIST_ID} =  listboxtext

*** Test Cases ***
Test1
    @{elem} =  SeleniumLibrary.Get WebElements  //label
    ${date} =  get from list  ${elem}  3
    ${szoveg1} =  get text  ${date}
    ${szoveg} =  cut string  ${szoveg1}  \n  0

#Events page title text           ${TEXT_ID}   ${EVENTS_PAGE_TITLE.${Lan}}   0    ${PO_ALT_PAGE_HEADER_TITTLE_ID}
#Events input field text          ${TEXT_ID}   ${EVENTS_PAGE_INPUT_EVENTS_TEXT.${Lan}}  0  ${PO_ALT_LABEL_ID}
#Place input field text          ${TEXT_ID}   ${EVENTS_PAGE_INPUT_PLACE_TEXT.${Lan}}  1  ${PO_ALT_LABEL_ID}
#Comment input field text  ${TEXT_ID}   ${EVENTS_PAGE_INPUT_COMMENT_TEXT.${Lan}}  2  ${PO_ALT_LABEL_ID}
#Date range          ${TEXT_ID}   ${EVENTS_PAGE_INPUT_DATA_RANDE_TEXT.${Lan}}  3  ${PO_ALT_LABEL_ID}




*** Keywords ***
Check the text on the events page
    [Arguments]  ${type}  ${text}  ${index}  ${path}  ${normaltext}=${EMPTY}
    Check text on the page  ${type}  ${text}  ${index}  ${path}  ${normaltext}