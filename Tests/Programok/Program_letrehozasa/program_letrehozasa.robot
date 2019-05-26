*** Settings ***
Resource  ../../../Resources/programok_resource.robot

Suite Setup  Open browser and login and after go to the programs page  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
#Suite Teardown  Common.End web test

*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}  language=${LAN}
${LAN}=  Hun


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
    give the darabos jegy sablon  Piece 2 ticket template
    give the electronic jegy sablon  Electronic ticket template
    sleep  3s
    click element  //next-button
    sleep  3s
    ${szoveg1} =  get text  //*[@class="mat-radio-label-content"]//span
    log  ${szoveg1}
    ${szoveg2} =  get text  //*[@class="mat-radio-label-content"]
    log  ${szoveg2}
    Click checkbox  Táncos előadások
    sleep  3s
    #click element  //*[@class="mat-radio-label-content"]
    #sleep  3s


*** Keywords ***
Get checkbox list
    [Documentation]  Visszaadja a listbox-ban lévő elemek index-ét,
                ...  illetve nevét egy szótárban.
                ...  A szótár kulcsa a sorszám a möggött lévő elem pedig az érték.
    [Arguments]  ${xpath}
    @{lista} =  SeleniumLibrary.Get WebElements  ${xpath}
    ${szotar} =  create dictionary
    ${i} =  set variable  0
    :FOR  ${valt}  IN  @{lista}
    \  ${i} =  Evaluate  ${i} + 1
    \  ${szoveg_eredeti} =  get text  ${valt}
    \  ${a} =  convert to string  ${i}
    \  set to dictionary  ${szotar}  ${szoveg_eredeti}  ${a}
    log  ${szotar}
    [Return]  ${szotar}

Click checkbox
    [Arguments]  ${text}
    ${szotar} =  Get checkbox list  //*[@class="mat-radio-label-content"]
    log  ${szotar}[${text}]
    @{lista} =  SeleniumLibrary.Get WebElements  //*[@class="mat-radio-label-content"]
    ${egye_elem} =  get from list  ${lista}  ${szotar}[${text}]
    click element  ${egye_elem}
