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


*** Test Cases ***
Test1
    log  valami
    po_alt.Click the new button
    Waiting the create new page loaded
    Give the program name  Vinyó programja
    Give the program short description  Vinyó programának rövid elírása
    input text  //*[@role="textbox"]  részletes leírás
    Give the vat class  B - 25%
    Click the ives
    Give the ives jegy sablon   Sheet ticket template
    give the darabos jegy sablon  Piece ticket template
    give the electronic jegy sablon  Electronic ticket template
    sleep  3s
    click element  //next-button
    sleep  3s
    Check element is enable  //next-button
    ${szoveg1} =  get text  //*[@class="mat-radio-label-content"]//span
    log  ${szoveg1}
    ${szoveg2} =  get text  //*[@class="mat-radio-label-content"]
    log  ${szoveg2}
    Click radio button  Táncos előadások
    sleep  3s
    #click element  //*[@class="mat-radio-label-content"]
    sleep  3s
    Click checkbox  Balett előadás
    po_alt.Click the next button
    Wait the gallery step page loaded
    Click the next button
    Wait the palce step page loaded
    Give the venues name in the program create step page  201905_teszt
    sleep  2s
    Click the select button ont place step page
    Wait the venues data loaded on the place page
    #Click radio button  Teszt0524
    Click radio button by index  1
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
    Give the start date on the program create  2019-06-30 16:00:00
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
Get checkbox list
    [Documentation]  Visszaadja a listbox-ban lévő elemek index-ét,
                ...  illetve nevét egy szótárban.
                ...  A szótár kulcsa a sorszám a möggött lévő elem pedig az érték.
    [Arguments]  ${xpath}
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

Click radio button
    [Arguments]  ${text}
    ${szotar} =  Get checkbox list  //*[@class="mat-radio-label-content"]
    log  ${szotar}[${text}]
    @{lista} =  SeleniumLibrary.Get WebElements  //*[@class="mat-radio-label-content"]
    ${egye_elem} =  get from list  ${lista}  ${szotar}[${text}]
    click element  ${egye_elem}

Click radio button by index
    [Arguments]  ${index}
    @{lista} =  SeleniumLibrary.Get WebElements  //*[@class="mat-radio-label-content"]
    ${index2} =  evaluate  ${index}-1
    ${egye_elem} =  get from list  ${lista}  ${index2}
    click element  ${egye_elem}

Click checkbox
    [Documentation]  A megadott rádióbutton-ra kattint.
    [Arguments]  ${text}
    ${szotar} =  Get checkbox list  //*[@class="mat-checkbox-label"]
    log  ${szotar}[${text}]
    @{lista} =  SeleniumLibrary.Get WebElements  //*[@class="mat-checkbox-label"]
    ${egye_elem} =  get from list  ${lista}  ${szotar}[${text}]
    click element  ${egye_elem}

Give the subcategory
    [Documentation]
    [Arguments]  ${lista}
    :FOR  ${elem} in  @{lista}
    \  Click checkbox  Balett előadás
