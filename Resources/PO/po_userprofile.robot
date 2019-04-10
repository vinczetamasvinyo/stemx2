*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  ../../ExternalResources/mylibrary.py
Resource  ../Common.robot

*** Variables ***
${PO_USERPROFILE_PHONE_ID} =  xpath=//input[@formcontrolname="phone"]
${PO_USERPROFILE_BIRTHDAY_ID} =  xpath=//input[@formcontrolname="birthday"]
${PO_USERPROFILE_BIRTPLACE_ID} =  xpath=//input[@formcontrolname="birthPlace"]
${PO_USERPROFILE_MOTHERNAME_ID} =  xpath=//input[@formcontrolname="motherName"]
${PO_USERPROFILE_BIRTNAME_ID} =  xpath=//input[@formcontrolname="birthName"]
${PO_USERPROFILE_RADIO_MAN_ID} =  id=mat-radio-3
${PO_USERPROFILE_RADIO_WOMAN_ID} =  mat-radio-2
${PO_USERPROFILE_SAVE_BUTTON_ID} =  xpath=//button[@class="button success"]
${ID} =  xpath=//mat-select[@formcontrolname="country"]
${ID2} =  //app-billing-information//mat-select[@formcontrolname="country"]
*** Keywords ***
Waiting the myprofil page loaded
    [Documentation]  Megvárja még a fiókom oldal betöltődik.
    wait until element is visible  ${PO_USERPROFILE_PHONE_ID}

Give the phone number
    [Documentation]  A fiókom oldalon megadja a telefonszámot a partner regisztráció során.
    [Arguments]  ${szoveg}
    input text  ${PO_USERPROFILE_PHONE_ID}  ${szoveg}

Give the birthday
    [Documentation]  A fiókom oldalon megadja a születési időt a partner regisztráció során.
    [Arguments]  ${szoveg}
    input text  ${PO_USERPROFILE_BIRTHDAY_ID}  ${szoveg}

Give the birthplace
    [Documentation]  A fiókom oldalon megadja a születési helyet a partner regisztráció során
    [Arguments]  ${szoveg}
    input text  ${PO_USERPROFILE_BIRTPLACE_ID}  ${szoveg}

Give the mothename
    [Documentation]  A fiókom oldalon megadja az anyja nevét
    [Arguments]  ${szoveg}
    input text  ${PO_USERPROFILE_MOTHERNAME_ID}  ${szoveg}

Give the birthname
    [Documentation]  A fiókom oldalon megadja a születési nevet
    [Arguments]  ${szoveg}
    input text  ${PO_USERPROFILE_BIRTNAME_ID}  ${szoveg}

Click the man
    [Documentation]  A fiókom oldalon beklikkeli a férfi radiobutton.
    click element  ${PO_USERPROFILE_RADIO_MAN_ID}

Click the women
    [Documentation]  A fiókom oldalon beklikkeli a nő radiobutton.
    click element  ${PO_USERPROFILE_RADIO_WOMAN_ID}

Give the company name
    [Documentation]  A profil oldalon a cégnévhez beírja a megadott szöveget.
    [Arguments]  ${szoveg}
    @{elem} =  SeleniumLibrary.Get WebElements  xpath=//input[@formcontrolname="name"]
    ${cegnev} =  Get From List  ${elem}  0
    input text  ${cegnev}  ${szoveg}

Give the copany long name
    [Documentation]  A profil oldalon megadja a cég hosszú nevét
    [Arguments]  ${szoveg}
    input text  xpath=//input[@formcontrolname="longName"]  ${szoveg}

Give the registration number
    [Documentation]  A profil oldalon megadja a cég cégjegyzékszámát
    [Arguments]  ${szoveg}
    input text  xpath=//input[@formcontrolname="registrationNumber"]  ${szoveg}

Give the zipcode
    [Documentation]  A profil oldalon megadja a cég irányítószámát
    [Arguments]  ${szoveg}
    @{elem} =  SeleniumLibrary.Get WebElements  xpath=//input[@formcontrolname="zipCode"]
    ${companyzipcode} =  Get From List  ${elem}  0
    input text  ${companyzipcode}  ${szoveg}

Give the city
    [Documentation]  A profil oldalon megadja a cég városát
    [Arguments]  ${szoveg}
    @{elem} =  SeleniumLibrary.Get WebElements  xpath=//input[@formcontrolname="city"]
    ${companycity} =  Get From List  ${elem}  0
    input text  ${companycity}  ${szoveg}

Give the county
    [Documentation]  A profil oldalon megadja a cég megye-jét
    [Arguments]  ${szoveg}
    @{elem} =  SeleniumLibrary.Get WebElements  xpath=//input[@formcontrolname="county"]
    ${companycounty} =  Get From List  ${elem}  0
    input text  ${companycounty}  ${szoveg}

Give the street
    [Documentation]  A profil oldalon megadja a cég-hez tartozó utcát.
    [Arguments]  ${szoveg}
    @{elem} =  SeleniumLibrary.Get WebElements  xpath=//input[@formcontrolname="street"]
    ${companystreet} =  Get From List  ${elem}  0
    input text  ${companystreet}  ${szoveg}

Give the housenumber
    [Documentation]  A profil oldalon megadja a cég-hez tartozó házszámot
    [Arguments]  ${szoveg}
    @{elem} =  SeleniumLibrary.Get WebElements  xpath=//input[@formcontrolname="houseNumber"]
    ${companyhousenumber} =  Get From List  ${elem}  0
    input text  ${companyhousenumber}  ${szoveg}

Give the door
    [Documentation]  A profil oldalon megadja a cég-hez tartozó ajtót
    [Arguments]  ${szoveg}
    @{elem} =  SeleniumLibrary.Get WebElements  xpath=//input[@formcontrolname="houseNumber"]
    ${companydoor} =  Get From List  ${elem}  0
    input text  ${companydoor}  ${szoveg}

Give the floor
    [Documentation]  A profil oldalon megadja a cég-hez tartozó ajtót
    [Arguments]  ${szoveg}
    @{elem} =  SeleniumLibrary.Get WebElements  xpath=//input[@formcontrolname="floor"]
    ${companydoor} =  Get From List  ${elem}  0
    input text  ${companydoor}  ${szoveg}

Give the billing name
    [Documentation]  A profil oldalon megadja a cég számlázási nevét
    [Arguments]  ${szoveg}
    @{elem} =  SeleniumLibrary.Get WebElements  xpath=//input[@formcontrolname="name"]
    ${cegbillingname} =  Get From List  ${elem}  1
    input text  ${cegbillingname}  ${szoveg}

Give the billing taxnumber
    [Documentation]  A profil oldalon megadja a céghez tartozó adószámot
    [Arguments]  ${szoveg}
    input text  xpath=//input[@formcontrolname="vatNumber"]  ${szoveg}

Give the billing bankname
    [Documentation]  A profil oldalon megadja a céghez tartozó bank nevét
    [Arguments]  ${szoveg}
    input text  xpath=//input[@formcontrolname="bankName"]  ${szoveg}

Give the billing banknumber
    [Documentation]  A profil oldalon megadja a céghez tartozó bank nevét
    [Arguments]  ${szoveg}
    input text  xpath=//input[@formcontrolname="bankAccountNumber"]  ${szoveg}

Give the billing iban number
    [Documentation]  A profil oldalon megadja a céghez tartozó bank nevét
    [Arguments]  ${szoveg}
    input text  xpath=//input[@formcontrolname="iban"]  ${szoveg}

Give the billing swift number
    [Documentation]  A profil oldalon megadja a céghez tartozó swift numbert
    [Arguments]  ${szoveg}
    input text  xpath=//input[@formcontrolname="swift"]  ${szoveg}


Give the country
    Scroll to element  xpath=//mat-select[@formcontrolname="country"]  100
    click element  xpath=//mat-select[@formcontrolname="country"]
    wait until element is visible  xpath=//*[@id="mat-option-7"]
    sleep  1s
    click element  xpath=//*[@id="mat-option-7"]

Get listbox item xpath
    [Arguments]  ${kivlasztott}  ${xpath}  ${class}
    ${valami} =  get element attribute  ${xpath}  ${class}
    log  ${valami}
    @{elemek} =  mylibrary.split the text  ${valami}  ${SPACE}
    log  ${elemek}[0]
    log  ${elemek}
    ${szotar} =  create dictionary
    :FOR  ${valt}  IN  @{elemek}
    \  ${resz} =  set variable  //*[@id="${valt}"]/span
    \  ${text} =  get text  ${resz}
    \  set to dictionary  ${szotar}  ${text}  ${resz}
    log  ${szotar}
    ${el} =  get from dictionary  ${szotar}  ${kivlasztott}
    [Return]  ${el}

Give the country2
    [Arguments]  ${kivlasztott}
    Scroll to element  xpath=//mat-select[@formcontrolname="country"]  100
    click element  xpath=//mat-select[@formcontrolname="country"]
    wait until element is visible  xpath=//div[@class="cdk-overlay-pane"]
    ${el} =  Get listbox item xpath  ${kivlasztott}  ${ID}  aria-owns
    #${valami} =  get element attribute  xpath=//mat-select[@formcontrolname="country"]  aria-owns
    #log  ${valami}
    #@{elemek} =  mylibrary.split the text  ${valami}  ${SPACE}
    #log  ${elemek}[0]
    #log  ${elemek}
    #${szotar} =  create dictionary
    #:FOR  ${valt}  IN  @{elemek}
     #\  ${resz} =  set variable  //*[@id="${valt}"]/span
     #\  ${text} =  get text  ${resz}
     #\  set to dictionary  ${szotar}  ${text}  ${resz}
     #log  ${szotar}
     #${el} =  get from dictionary  ${szotar}  ${kivlasztott}
    click element   ${el}

Give the billing country2
    [Arguments]  ${kivlasztott}
    Scroll to element  xpath=//app-billing-information//mat-select[@formcontrolname="country"]  100
    click element  xpath=//app-billing-information//mat-select[@formcontrolname="country"]
    wait until element is visible  xpath=//div[@class="cdk-overlay-pane"]
    ${el} =  Get listbox item xpath  ${kivlasztott}  ${ID2}  aria-owns
    click element   ${el}

Give the billing country
    @{elem} =  SeleniumLibrary.Get WebElements  xpath=//mat-select[@formcontrolname="country"]
    ${cegbillingcountry} =  Get From List  ${elem}  1
    Scroll to element  ${cegbillingcountry}  100
    click element  ${cegbillingcountry}
    wait until element is visible  xpath=//*[@id="mat-option-13"]
    sleep  1s
    click element  xpath=//*[@id="mat-option-13"]



Give the billing zipcode
    [Documentation]  A profil oldalon megadja a cég számlázási irányítószámát
    [Arguments]  ${szoveg}
    @{elem} =  SeleniumLibrary.Get WebElements  xpath=//input[@formcontrolname="zipCode"]
    ${cegbillingzipcode} =  Get From List  ${elem}  1
    input text  ${cegbillingzipcode}  ${szoveg}

Give the billing city
    [Documentation]  A profil oldalon megadja a cég számlázási városát
    [Arguments]  ${szoveg}
    @{elem} =  SeleniumLibrary.Get WebElements  xpath=//input[@formcontrolname="city"]
    ${cegbillingcity} =  Get From List  ${elem}  1
    input text  ${cegbillingcity}  ${szoveg}

Give the billing county
    [Documentation]  A profil oldalon megadja a cég számlázási megyéjét
    [Arguments]  ${szoveg}
    @{elem} =  SeleniumLibrary.Get WebElements  xpath=//input[@formcontrolname="county"]
    ${cegbillingcounty} =  Get From List  ${elem}  1
    input text  ${cegbillingcounty}  ${szoveg}

Give the billing street
    [Documentation]  A profil oldalon megadja a cég számlázási utca adatát
    [Arguments]  ${szoveg}
    @{elem} =  SeleniumLibrary.Get WebElements  xpath=//input[@formcontrolname="street"]
    ${cegbillingstreet} =  Get From List  ${elem}  1
    input text  ${cegbillingstreet}  ${szoveg}

Give the billing housenumber
    [Documentation]  A profil oldalon megadja a cég számlázási házszám adatát
    [Arguments]  ${szoveg}
    @{elem} =  SeleniumLibrary.Get WebElements  xpath=//input[@formcontrolname="houseNumber"]
    ${cegbillinghousenumber} =  Get From List  ${elem}  1
    input text  ${cegbillinghousenumber}   ${szoveg}

Give the billing door
    [Documentation]  A profil oldalon megadja a cég számlázási ajtó adatát
    [Arguments]  ${szoveg}
    @{elem} =  SeleniumLibrary.Get WebElements  xpath=//input[@formcontrolname="door"]
    ${cegbillingdoor} =  Get From List  ${elem}  1
    input text  ${cegbillingdoor}  ${szoveg}

Give the billing floor
    [Documentation]  A profil oldalon megadja a cég számlázási emelet adatát
    [Arguments]  ${szoveg}
    @{elem} =  SeleniumLibrary.Get WebElements  xpath=//input[@formcontrolname="floor"]
    ${cegbillingdoor} =  Get From List  ${elem}  1
    input text  ${cegbillingdoor}  ${szoveg}

Give the availability firstname
    [Documentation]  A profil oldalon megadja a céghez tartoz elérhetőségi keresztnevet
    [Arguments]  ${szoveg}
    @{elem} =  SeleniumLibrary.Get WebElements  xpath=//input[@formcontrolname="firstName"]
    ${chose} =  Get From List  ${elem}  1
    input text  ${chose}  ${szoveg}

Give the availability secondname
    [Documentation]  A profil oldalon megadja a céghez tartoz elérhetőségi vezetéknevet
    [Arguments]  ${szoveg}
    @{elem} =  SeleniumLibrary.Get WebElements  xpath=//input[@formcontrolname="lastName"]
    ${chose} =  Get From List  ${elem}  1
    input text  ${chose}  ${szoveg}

Give the availability phone
    [Documentation]  A profil oldalon megadja a céghez tartoz elérhetőségi telefonszámot
    [Arguments]  ${szoveg}
    @{elem} =  SeleniumLibrary.Get WebElements  xpath=//input[@formcontrolname="phone"]
    ${chose} =  Get From List  ${elem}  1
    input text  ${chose}  ${szoveg}

Give the contact phone
    [Documentation]  A profil oldalon megadja a céghez tartoz elérhetőségi telefonszámot
    [Arguments]  ${szoveg}
    input text  xpath=//input[@formcontrolname="phone"]  ${szoveg}


Give the availability email
    [Documentation]  A profil oldalon megadja a céghez tartoz elérhetőségi adat email címét
    [Arguments]  ${szoveg}
    @{elem} =  SeleniumLibrary.Get WebElements  xpath=//input[@formcontrolname="email"]
    ${chose} =  Get From List  ${elem}  1
    input text  ${chose}  ${szoveg}

Push the first save button
    [Documentation]  A profil oldalon megnyomja az elsp mentés gombot
    click element  ${PO_USERPROFILE_SAVE_BUTTON_ID}

Push the second save button
    [Documentation]  A profil oldalon megnyomja második mentés gombot
    @{elem} =  SeleniumLibrary.Get WebElements  xpath=//button[@class="button success"]
    ${chose} =  Get From List  ${elem}  1
    click element  ${chose}
