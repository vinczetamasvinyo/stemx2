*** Settings ***
Resource  ../../../../Resources/eloadohelyek_resource.robot

Suite Setup  Open browser and login and after go to the venues page  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
Suite Teardown  Common.End web test

*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}  language=${LAN}
${LAN}=  Hun

*** Test Cases ***
Test1
    sleep  3s
    ${maxszam} =  Get the items max count
    scroll page  100
    ${sorok} =  Get the row count
    Check the rownumber  100  ${maxszam}  ${sorok}

*** Keywords ***
Check the rownumber
    [Arguments]  ${scrollnumber}  ${max}  ${sorok}
    run keyword if  ${scrollnumber} > ${max}  should be true  ${scrollnumber} > ${sorok}
    ...  ELSE  should be true  ${scrollnumber} == ${sorok}

