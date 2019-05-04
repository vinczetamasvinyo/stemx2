*** Settings ***
Resource  ../../../../Resources/patner_letre_empty_fields_resource.robot

Suite Setup  Login and go to the new partner page   ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
Suite Teardown  Common.End web test
Test Template  Check the default value in the new partner page


*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}


*** Test Cases ***
Lastname        input   0        xpath=//input  ${EMPTY}


*** Keywords ***
Get input value of new partner page common
    [Documentation]  A partner létrehozása oldalon visszaadja a megadott id elem értékét.
    [Arguments]  ${path}  ${index}
    @{elem} =  SeleniumLibrary.Get WebElements  ${path}
    ${egye_elem} =  get from list  ${elem}  ${index}
    ${return_valu} =  get value  ${egye_elem}
    log  ${return_valu}
    [Return]  ${return_valu}

Check the default value in the new partner page
    [Arguments]  ${type}  ${index}  ${path}  ${ertek}
    ${valueertek} =  run keyword if  "${type}" == "input"  Get input value of new partner page common  ${path}  ${index}
    should be equal  ${valueertek}   ${ertek}



