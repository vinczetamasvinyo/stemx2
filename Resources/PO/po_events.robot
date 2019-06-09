*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${PO_EVENTS_INPUT_SEARCH_ID} =  //*[@formcontrolname="eventName"]

*** Keywords ***
Waiting the event input field visiable
    [Documentation]  Megvárja amíg az események kereső betöltődik.
    wait until element is visible  ${PO_EVENTS_INPUT_SEARCH_ID}

