*** Settings ***
Library  SeleniumLibrary
Resource  ../../../../Resources/felhasznalo_meghivasa_folyamat_resource.robot
Resource  ../../../../Resources/menu_resource.robot

Suite Setup  Open browser and login and after go to the auditoriums page  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
#Suite Teardown  Common.End web test
*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}  language=${LAN}
${lidta_id} =  xpath=//mat-cell[1]
${LAN}=  Hun

*** Test Cases ***
test1
    #Open browser and login to stemx or stemxcity  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
    #Go to the auditoriums page
    #click element  id=mat-expansion-panel-header-4
    #wait until element is visible  id=cdk-accordion-child-4
    #click element  xpath=//a[contains(text(),'Nézőterek')]
    #sleep  3s
    #@{lista} =  Get list from items  ${lidta_id}  \n
    @{lista} =  Get list from items2  ${True}  ${lidta_id}  \n  0
    #@{elemek} =  SeleniumLibrary.Get WebElements  xpath=//mat-cell[1]
    #@{lista} =  create list
    #:FOR  ${elem}  IN   @{elemek}
    #\  ${szoveg} =  get text  ${elem}
    #\  ${vagott_szoveg} =  mylibrary.Split The Text  ${szoveg}  \n
    #\  append to list  ${lista}  ${vagott_szoveg}[0]
    #log  ${lista}
    @{rendezett} =  copy list  ${lista}
    log   ${rendezett}
    lists should be equal  ${lista}   ${rendezett}
    click element  xpath=//*[@aria-label="Change sorting for name"]
    sleep  5s
    @{lista2} =  Get list from items  ${lidta_id}  \n
    log  ${lista2}

*** Keywords ***
Get list from items
    [Documentation]  A megadott xpath elemekből összegyűjti a szöveget.
                ...  Ha szükséges, akkor a megadott karakternél szétvája
                ...  és a megadott indexűt adja vissza.
    [Arguments]  ${xpath}  ${split_text}
    @{elemek} =  SeleniumLibrary.Get WebElements  ${xpath}
    @{lista} =  create list
    :FOR  ${elem}  IN   @{elemek}
    \  ${szoveg} =  get text  ${elem}
    \  ${vagott_szoveg} =  mylibrary.Split The Text  ${szoveg}  ${split_text}
    \  append to list  ${lista}  ${vagott_szoveg}[0]
    log  ${lista}
    [Return]  ${lista}

