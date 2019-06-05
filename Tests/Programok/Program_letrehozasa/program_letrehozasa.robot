*** Settings ***
Resource  ../../../Resources/programok_resource.robot

Suite Setup  Open browser and login and after go to the programs page  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
#Suite Teardown  Common.End web test

*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}  language=${LAN}
${LAN}=  Hun
@{subcategorylist}  Néptánc előadás  Balett előadás
&{PROGRAM_DATA}  program_name=Vinyó programja
     ...  program_description=Vinyó programának rövid elírása
     ...  program_long_description=részletes leírás
     ...  program_tax=B - 25%
     ...  subcategory=${subcategorylist}
&{ADATOK}  type=name
      ...  text=B - 25%

&{ADATOK2}  type=index
      ...  text=1
&{ADATOK3}  type=index
      ...  text=1
&{ADATOK4}  type=name
      ...  text=Bryghus

*** Test Cases ***
Test1
    ${ido} =  get time in string
    ${name} =  set variable  Vinyó program automata${ido}
    log  valami
    po_alt.Click the new button
    Waiting the create new page loaded
    Give the program name  ${name}
    Give the program short description  ${PROGRAM_DATA}[program_description]
    Give the long description  részletes leírás
    sleep  3s
    Give the vat class by by index or name  ${ADATOK}
    Give the ticket default type be name or index  ${ADATOK2}
    Give the ives ticket template by index or name  ${ADATOK3}
    Give the db tickets template by index or name   ${ADATOK3}
    Give the electronic ticket template be name or index  ${ADATOK3}
    #give the electronic jegy sablon  Billetkontor spisning Brøndby vandret
    sleep  3s
    click element  //next-button
    sleep  3s
    Check element is enable  //next-button
    ${szoveg1} =  get text  //*[@class="mat-radio-label-content"]//span
    log  ${szoveg1}
    ${szoveg2} =  get text  //*[@class="mat-radio-label-content"]
    log  ${szoveg2}
    @{alaplista} =  create list  Balett előadás  Latin est
    Click radio button by name  Táncos előadások
    sleep  3s
    Click checkboxs by name  ${alaplista}
    #click element  //*[@class="mat-radio-label-content"]
    sleep  3s
    #@{lista} =  SeleniumLibrary.Get WebElements  //*[@class="row ng-star-inserted"]
    #${egye_elem} =  get from list  ${lista}  0
    #Click checkbox  Balett előadás
    #Click checkbox  Balett előadás
    po_alt.Click the next button
    Wait the gallery step page loaded
    Click the next button
    Wait the palce step page loaded
    Give the venues name in the program create step page  Próba előadóhely by vinyó0604180402
    sleep  4s
    Click the select button ont place step page
    Wait the venues data loaded on the place page
    #Click radio button  Teszt0524
    Click radio button by index  6
    Click the next button
    Waiting the tickets step page loaded
    Give the ticket type name on the program create  valami
    Give the ticket price on the program create  1000
    Give the max capacity on the program create  100
    Give the group on the program create  családi
    Click the create ticket button on the create program
    po_alt.Click the next button
    sleep  3s
    #Events data
    Give the start date on the program create  2019-11-30 16:00:00
    Give the program time  60
    Give the max capacity on the program create  100
    Click the create datetime
    po_alt.Click the next button
    #Ticket assignment
    sleep  3s
    Waiting the ticket assignment page loaded
    click element  //app-programs-ticket-assign//mat-expansion-panel[1]
    sleep  2s
    ${szot} =  Get checkbox ticket list  1
    Click the ticket checkbox  1  ${szot}  valami
    sleep  1s
    #click element  //*[@class="mat-checkbox-inner-container"]
    po_alt.Click the next button
    po_alt.Click the save button
    Wait the succes message and click

*** Keywords ***


Get checkbox ticket list
    [Documentation]  visszaadja a ticket listát a program létrehozása oldalról
    [Arguments]  ${index}
    ${xpath} =  set variable  //app-programs-ticket-assign//mat-expansion-panel[${index}]//*[@class="ticket-name"]
    @{lista} =  SeleniumLibrary.Get WebElements  ${xpath}
    ${szotar} =  create dictionary
    ${i} =  set variable  -1
    :FOR  ${valt}  IN  @{lista}
    \  ${i} =  Evaluate  ${i} + 1
    \  ${szoveg_eredeti} =  get text  ${valt}
    \  ${a} =  convert to string  ${i}
    \  set to dictionary  ${szotar}  ${szoveg_eredeti}  ${a}
    log  ${szotar}
    [Return]  ${szotar}

Click the ticket checkbox
    [Documentation]  Bekapcsolja a jegyeket
    [Arguments]  ${index}  ${szotar}  ${text}
    ${xpath} =  set variable  //mat-expansion-panel[${index}]//*[@class="ticket-container ng-star-inserted"]//*[@class="mat-checkbox-inner-container mat-checkbox-inner-container-no-side-margin"]
    @{lista} =  SeleniumLibrary.Get WebElements  ${xpath}
    ${egye_elem} =  get from list  ${lista}  ${szotar}[${text}]
    click element  ${egye_elem}

Give the subcategory
    [Documentation]
    [Arguments]  ${lista}
    :FOR  ${elem} in  @{lista}
    \  Click checkbox  Balett előadás
