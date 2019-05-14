*** Settings ***
Resource  ../../../../Resources/auditoriums_resource.robot

Suite Setup  Open browser and login go auditoriums page and click the delete  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
Suite Teardown  Common.End web test


*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}

*** Test Cases ***
Test the reset icon appear in the deleted auditoriums row
    [Documentation]  A teszt során azt nézzük meg, hogy a törölt nézőterek
    ...  sorában megjelenik-e a visszaállít ikon.
    @{lista} =  Get all deleted row
    Check the reset icon appear in the deleted auditoriums row   ${lista}

Test the edit icon appear in the deleted auditoriums row
    @{lista} =  Get all deleted row
    Check the edit icon not appear in deleted auditoriums row  ${lista}

test the delete icon not appear in the deleted auditoriums row
    @{lista} =  Get all deleted row
    Check the delete icon not appear in deleted auditoriums row  ${lista}

*** Keywords ***

