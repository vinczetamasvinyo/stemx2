*** Settings ***
Resource  ../../../../Resources/eloadohelyek_resource.robot
#proba
Suite Setup  Open browser and login and after go to the venues page  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
Suite Teardown  Common.End web test

*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}  language=${LAN}
${LAN}=  Hun

*** Test Cases ***
Test the scrool page of the 25
    [Tags]  most2
    Set the row number add check the row visiable  25

Test the scrool page of the 50
    [Tags]  most3
    Set the row number add check the row visiable  50

Test the scrool page of the 100
    Set the row number add check the row visiable  100

Test the scrool page of the 10
    Set the row number add check the row visiable  10


