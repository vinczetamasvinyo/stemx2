*** Settings ***
Resource  ../../../../Resources/eloadohelyek_resource.robot
#proba
Suite Setup  Open browser and login and after go to the venues page  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
#Suite Teardown  Common.End web test

*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}  language=${LAN}
${LAN}=  Hun

*** Test Cases ***
Test0
    [Tags]  most
    ${v} =  Get the items firs count
    ${v2} =  Get the items last count

test 1
    [Tags]  most4
    Click the navigation last
    sleep  3s

Test the scrool page of the 25
    [Tags]  most2
    #Set the row number add check the row visiable  25
    ${ertek} =  get text  xpath=//mat-select//span
    ${ertek2} =  get text  ${PO_PAGE_NAVIGATE_LISTBOX}//span
    ${maxszam} =  Get the items max count
    ${osztas} =  evaluate  ${maxszam}//${ertek}
    #click element  Xpath=//*[contains(@class,'mat-paginator-navigation-next')]
    #wait until element is visible  //*[@class="mat-paginator-navigation-next mat-icon-button"]
    #click element  //*[@class="mat-paginator-navigation-next mat-icon-button"]
    :FOR  ${db}  IN RANGE  ${osztas}
    #\  scroll to element  //*[@class="copyright"]  10
    \  wait until element is visible  xpath=//*[contains(@class,'mat-paginator-navigation-next')]  10
    \  click element  Xpath=//*[contains(@class,'mat-paginator-navigation-next')]
    \  Waiting the page loaded finish
    \  sleep  1s

Test the scrool page of the 50
    [Tags]  most3
    Set the row number add check the row visiable  50

Test the scrool page of the 100
    Set the row number add check the row visiable  100

Test the scrool page of the 10
    Set the row number add check the row visiable  10


