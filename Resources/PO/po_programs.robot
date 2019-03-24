*** Variables ***
${PO_PROGRAMS_SZEM_ICON} =  xpath=//*[@class='link-icon link-action-icon ng-star-inserted']

*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Click the program megtekintese
    click element  ${PO_PROGRAMS_SZEM_ICON}