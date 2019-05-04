*** Settings ***
Resource  ../../../Resources/login_resource.robot
Resource  ../../../Resources/variables.robot
Variables  ../../../Resources/variable.py
Resource  ../../../Resources/PO/po_menu.robot
Library  ../../../ExternalResources/mylibrary.py

*** Variables ***
&{LOGIN}  email=${box_office1_email_ok}  password=${box_office1_password_ok}

*** Test Cases ***
test1
    login_resource.Open Vk login page  ${OLDAL_URL}  ${bogeszo}
    Give login date and login  ${login.email}  ${login.password}
    Go to the partner role via menu
    sleep  4s
    ${edit} =  SeleniumLibrary.Get WebElementS  xpath=//*[@class="material-icons edit-primary"]
    ${edit1} =  get from list  ${edit}  5
    click element  ${edit1}
    #click element  xpath=//new-button
    sleep  3s
    # jogok amik nincsenek hozzáadva még.
    ${jogok} =  SeleniumLibrary.Get WebElementS  xpath=//*[@class="mat-card ng-star-inserted"]
    ${szotar} =  create dictionary
    ${i} =  set variable  -1
    :FOR  ${valt}  IN  @{jogok}
    \  ${al} =  create dictionary
    \  ${i} =  Evaluate  ${i} + 1
    \  ${szoveg} =  get text  ${valt}
    \  ${szoveg_lista} =  mylibrary.split the text  ${szoveg}  \n
    #\  ${resz} =  set variable  //*[@id="${valt}"]/span
    \  log  ${szoveg}
    \  ${a} =  convert to string  ${i}
    \  set to dictionary  ${al}  ID  ${EMPTY}
    \  set to dictionary  ${al}  Index  ${a}
    \  set to dictionary  ${al}  Hozzaadva  No
    \  set to dictionary  ${al}  jogok  ${EMPTY}
    \  set to dictionary  ${szotar}  ${szoveg_lista}[0]  ${al}
    log  ${szotar}
    #${index} =  set variable  ${szotar}[Média kezelése][Index]
    #log  ${index}
    #log  ${jogok}[${index}]
    #click element  ${jogok}[${index}]
    #${v1}  ${v2} =  check the elem contain in parent2  ${jogok}[${index}]  .//button
    #click element  ${v2}
    sleep  5s
    #click element  xpath=//*[@class="mat-expansion-panel ng-tns-c5-41 mat-expanded mat-expansion-panel-spacing"]//mat-checkbox
    #click element  xpath=//*[@class="mat-expansion-panel ng-tns-c5-41 mat-expanded mat-expansion-panel-spacing"]//mat-checkbox
    #click element  xpath=//mat-checkbox
    sleep  3s
    #${elemsz} =  get text  xpath=//*[@class="accordion-container"]//mat-expansion-panel-header
    ${elemsz} =  get text  xpath=//*[@class="mat-expansion-panel-header-title"]
    log  ${elemsz}
    ${vagott} =  mylibrary.split the text  ${elemsz}  \n
    # Hozzáadott jogosultságok lekérdezése
    ${szotar1} =  create dictionary
    ${roles} =  SeleniumLibrary.Get WebElementS  xpath=//*[@class="accordion-container"]//mat-expansion-panel-header
    Open roles  ${roles}
    sleep  5s
    :FOR  ${role}  IN  @{roles}
    \  ${szoveg} =  get text  ${role}
    \  ${szoveg_lista} =  mylibrary.split the text  ${szoveg}  \n
    \  log  ${szoveg}
    \  ${id} =  get element attribute   ${role}  id
    \  ${jo1} =  Create jog list  ${id}
    #\  ${jog_lista}
    \  ${al} =  create dictionary
    \  set to dictionary  ${al}  ID  ${id}
    \  set to dictionary  ${al}  Index  ${EMPTY}
    \  set to dictionary  ${al}  Hozzaadva  Yes
    \  set to dictionary  ${al}  jogok  ${jo1}
    \  set to dictionary  ${szotar1}  ${szoveg_lista}[0]  ${al}
    log  ${szotar1}
    click element  //*[@aria-labelledby="${szotar1}[Média kezelése][ID]"]//mat-checkbox/label
    #//*[@aria-labelledby="mat-expansion-panel-header-13"]//mat-checkbox/label
    sleep  3s


*** Keywords ***
Open roles
    [Arguments]  ${roles}
    :FOR  ${role}  IN  @{roles}
    \  ${class} =  get element attribute   ${role}  class
    \  ${nyitvan} =  Evaluate  "mat-expanded" in "${class}"
    \  log  ${nyitvan}
    \  run keyword if  ${nyitvan} == False  click element  ${role}
    \  sleep  3s

Create jog list
    [Arguments]  ${id}
    ${checkboxs_c} =  get element count  xpath=//*[@aria-labelledby="${id}"]//mat-checkbox
    ${checkboxs} =  SeleniumLibrary.Get WebElementS  xpath=//*[@aria-labelledby="${id}"]//mat-checkbox
    ${labels} =  SeleniumLibrary.Get WebElementS  xpath=//*[@aria-labelledby="${id}"]//*[@class="mat-checkbox-label"]
    ${valu_checkboxs} =  SeleniumLibrary.Get WebElementS  xpath=//*[@aria-labelledby="${id}"]//input
    ${i} =  set variable  -1
    ${jog} =  create dictionary
    :FOR  ${check}  IN RANGE  0  ${checkboxs_c}
    #\  ${jog} =  create dictionary
    \  ${i} =  Evaluate  ${i} + 1
    \  ${id1} =  get from list  ${checkboxs}  ${i}
    \  ${id} =  get element attribute  ${id1}  id
    \  log  ${id}
    \  ${label1} =  get from list  ${labels}  ${i}
    \  ${label} =  get text  ${label1}
    \  log  ${label}
    \  ${ck} =  get from list  ${valu_checkboxs}  ${i}
    \  ${ck_status} =  get element attribute  ${ck}  aria-checked
    \  ${ck_id} =  get element attribute  ${ck}  id
    \  ${elemek} =  create dictionary
    \  set to dictionary  ${elemek}  id  ${id}
    \  set to dictionary  ${elemek}  status  ${ck_status}
    # \  set to dictionary  ${elemek}  name  ${label}
    \  set to dictionary  ${elemek}  id2  ${ck_id}
    \  set to dictionary  ${jog}  ${label}  ${elemek}
    \  log  ${jog}
    [Return]  ${jog}