*** Settings ***
Resource  ../../../../Resources/auditoriums_resource.robot

#Suite Setup  csinal  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
#Suite Teardown  Common.End web test


*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}

*** Test Cases ***
test1
    ${va} =  set variable  ${CURDIR}
    #${szoveg} =  read from file  C:/development/robot-scripts/varoskartya/DATA/proba.txt
    ${szoveg} =  read csv file   C:/development/robot-scripts/varoskartya/DATA/proba.csv
    log  ${szoveg}

*** Keywords ***
csinal
    [Arguments]  ${old}  ${bon}  ${log}
    Open browser and login and after go to the venues page  ${old}  ${bon}  ${log}
    ${ido} =  get time in string
    #log  ${VENUEAUDITORIUMS.Audits[0].Auditoriumcity}
    #${VENUEAUDITORIUMS.Audits[0].Auditoriumcity} =   set variable  ${VENUEAUDITORIUMS.Audits[0].Auditoriumcity}${ido}
    #${VENUEAUDITORIUMS.Audits[0].Auditoriumzipcode} =  set variable  ir${ido}
    #${VENUEAUDITORIUMS.Audits[0].Auditoriumstreet} =  set variable  ${VENUEAUDITORIUMS.Audits[0].Auditoriumstreet}${ido}
    #${VENUEAUDITORIUMS.Audits[0].Auditoriumhousenumber} =  set variable  ${VENUEAUDITORIUMS.Audits[0].Auditoriumhousenumber}${ido}
    #Create new venue and audits start the venues page  ${VENUEAUDITORIUMS}
    Click the auditoriums submenu
    wait the auditoriums page loaded