*** Settings ***
Library  SeleniumLibrary
Resource  ../Common_resource.robot

*** Variables ***
${PO_PROGRAMOK_SEARCH_INPUT_ID} =  xpath=//*[@formcontrolname="programName"]
${PO_PROGRAMOK_PROGRAM_NAME_INPUT_ID} =  xpath=//*[@formcontrolname="name"]
${PO_PROGRAMOK__INPUT_ID} =  xpath=//*[@formcontrolname="name"]
${PO_PROGRAMOK_SHORT_DESCRIPTION_ID} =  xpath=//*[@formcontrolname="shortDescription"]
${PO_PROGRAMOK_LISTBOX_IVES_ID} =  //*[@formcontrolname="sheet"]
${PO_PROGRAMOK_LISTBOX_DB_ID} =  //*[@formcontrolname="pieces"]
${PO_PROGRAMOK_LISTBOX_ELECTRONIC_ID} =  //*[@formcontrolname="electronic"]

*** Keywords ***
wait the search input visiable in the programs page
    [Documentation]  Megvárja amíg a programok oldalon megjelenik a kereső
    wait until element is visible  ${PO_PROGRAMOK_SEARCH_INPUT_ID}

wait until the program name input field visiable
    [Documentation]  Megvárja amíg a program neve mező megjelenik
    wait until element is visible  ${PO_PROGRAMOK_PROGRAM_NAME_INPUT_ID}

Give the program name
    [Documentation]  Megadja a program létrehozása oldalon a program nevét
    [Arguments]  ${text}
    input text  ${PO_PROGRAMOK_PROGRAM_NAME_INPUT_ID}  ${text}

Give the program short description
    [Documentation]  Megadja a program létrehozása oldalon a program leírását
    [Arguments]  ${text}
    input text  ${PO_PROGRAMOK_SHORT_DESCRIPTION_ID}  ${text}

Give the vat class
    [Documentation]  Megadja az áfaosztályt
    [Arguments]  ${elem}
    Choose item from listbox  ${elem}  //*[@formcontrolname="taxId"]

Give the ives jegy sablon
    [Documentation]  Megadja az íves jegy sablon típusát
    [Arguments]  ${elem}
    Choose item from listbox  ${elem}  ${PO_PROGRAMOK_LISTBOX_IVES_ID}

Give the darabos jegy sablon
    [Documentation]  Megadja az darabos jegy sablon típusát
    [Arguments]  ${elem}
    Choose item from listbox  ${elem}  ${PO_PROGRAMOK_LISTBOX_DB_ID}

Give the electronic jegy sablon
    [Documentation]  Megadja az electroni jegy sablon típusát
    [Arguments]  ${elem}
    Choose item from listbox  ${elem}  ${PO_PROGRAMOK_LISTBOX_ELECTRONIC_ID}


Click the ives
    click element  xpath=//*[@class="mat-radio-label"]