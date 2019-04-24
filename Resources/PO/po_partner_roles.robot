*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${PO_P_R_SEARCH_INPUT_ROLE_ID} =  xpath=//input[@formcontrolname="name"]

*** Keywords ***
Wait the partner role page loaded
    wait until element is visible  ${PO_P_R_SEARCH_INPUT_ROLE_ID}
