*** Settings ***
Resource  Common_resource.robot
Resource  paga_element_resource.robot

*** Variables ***
&{AUDITORIUMS_TITTLE_TEXT}  Hun=Nézőterek  En=Auditoriums
&{AUDITORIUMS_SEARCH_INPUT_TEXT}  Hun=Keresés  En=Search
&{AUDITORIUMS_SEARCH_INPUT_PLACEHOLDER_TEXT}  Hun=Keresés  En=Search
&{AUDITORIUMS_CHECKBOX_TEXT}  Hun=Törölt nézőterek is  En=Include deleted auditoriums
&{AUDITORIUMS_NEW_BUTTON_TEXT}  Hun=Új létrehozása  En=Create new
&{AUDITORIUMS_RESET_BUTTON_TEXT}  Hun=Visszaállítás  En=Reset
&{AUDITORIUMS_SEARCH_BUTTON_TEXT}  Hun=Keresés  En=Search
&{AUDITORIUMS_TABLE_HEADER_AUDIT_NAME_TEXT}  Hun=Nézőtér neve  En=Auditorium name
&{AUDITORIUMS_TABLE_HEADER_ADDRESS_NAME_TEXT}  Hun=Helyszín neve  En=Place name
&{AUDITORIUMS_TABLE_HEADER_CAPACITY_TEXT}  Hun=Nézőtér férőhelye  En=Auditorium capacity
&{AUDITORIUMS_TABLE_HEADER_Feature_TEXT}  Hun=Lehetőségek  En=Features

*** Keywords ***
Check the text on the auditoriums page
    [Arguments]  ${type}  ${text}  ${index}  ${path}
    Check text on the page  ${type}  ${text}  ${index}  ${path}

Check the all audits name appear and length
    @{lista} =  Get all audits name from the audits page
    log  ${lista}
    Check the length is bigger in the list  ${lista}  0

Check the all audits address appear and length is correct
    @{lista} =  Get all audits address from the audits page
    log  ${lista}
    Check the length is bigger in the list  ${lista}  0

Check the all palce name appear and length is correct
    @{lista} =  Get all audits place name from the audits page
    log  ${lista}
    Check the length is bigger in the list  ${lista}  0

Check the all palce address appear and length is correct
    @{lista} =  Get all audits place address from the audits page
    log  ${lista}
    Check the length is bigger in the list  ${lista}  0

Check the default odder on the audits page
    [Documentation]  Megnézi, hogy az oldalon alapból név szerint van-e a rendezés.
    @{lista} =  Get all audits name from the audits page
    log  ${lista}
    @{rendezett} =  copy list  ${lista}
    log   ${rendezett}
    lists should be equal  ${lista}   ${rendezett}