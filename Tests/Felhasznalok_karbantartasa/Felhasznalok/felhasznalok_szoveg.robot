*** Settings ***
Resource  ../../../Resources/felhasznalok_resource.robot


*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}  language=${LAN}
${LAN}=  Hun

*** Test Cases ***
Test1
    Open browser and login to stemx or stemxcity  ${oldal_url}  ${bogeszo}  ${LOGIN_DATA}
    sleep  2s
    #click element  id=user_management_menu
    Click the felhasznalok karbantartasa
	Wait the felhasznalaok karbantartasa submenu visiable
	Click the users menu
    #click element  xpath=//a[contains(text(),'Felhasználók karbantartása') or contains(text(),'User Management')]
    #${sumenu} =  get element attribute  xpath=//a[contains(text(),'Felhasználók karbantartása') or contains(text(),'User Management')]/../../..  aria-controls
    #log to console  ${sumenu}
    #wait until element is visible  xpath=//*[@id="${sumenu}"]
    sleep  3s
    input text  //*[@formcontrolname="createdDateTime"]  2019. 04. 26. ~ 2019. 04. 26.
    click element  //search-button
    sleep  3s
