*** Settings ***
#Resource  ../../Resources/partner_invite_common_resource.robot
#Resource  ../../Resources/PO/po_alt.robot
Resource  ../../Resources/partner_page_keres_resource.robot

Suite Setup  Login and go to partners page
Suite Teardown  Common.End web test

*** Variables ***
${PPK_VALAMI_NEV} =  Valami
${PPK_VALAMI_EMAIL} =  EMAILCIM
${PPK_WATING_TIME1} =  3
${PPK_WATING_TIME2} =  6

*** Test Cases ***
Test1
    log  van
    sleep  2s
    # itt valunkt at 100-as megjelenitesre
    click element  xpath=//mat-form-field
    sleep  2s
    click element  xpath=//mat-option[4]
    sleep  3s
    @{lista} =  SeleniumLibrary.Get WebElements  xpath=//mat-cell[2]
    ${elemszam} =  get length  ${lista}
    log  ${elemszam}
    @{email_cimek} =  create list
    :FOR  ${val}  IN  @{lista}
    \  ${szoveg} =  get text  ${val}
    \  log  ${szoveg}
    \  append to list  ${email_cimek}  ${szoveg}
    log  ${email_cimek}
    ${random} =  Evaluate  random.randint(0, ${elemszam}-1)  modules=random
    log  ${random}
    ${kivlasztott_email} =  get from list  ${email_cimek}  ${random}
    log  ${kivlasztott_email}
    give the email for the search input  ${kivlasztott_email}
    po_partners.Click the search button
    sleep  3s
    ${eredmeny_email} =  get text  xpath=//mat-cell[2]
    ${eredmeny_db} =  SeleniumLibrary.Get WebElements  xpath=//mat-cell[2]
    ${er} =  Get Element Count  xpath=//mat-cell[2]
    should be true  "${er}" == "1"
    should be true  "${eredmeny_email}" == "${kivlasztott_email}"

Test the visszaallit gomb
    [Documentation]  A teszt soránt azt nézzük meg, hogy a visszaállít gomb megfelelően működik-e.
    [Tags]  High  most
    reload page
    sleep  3s
    @{lis} =  Get the all default value
    log  ${lis}
    Give the valeu of the partner name input field  ${PPK_VALAMI_NEV}
    Give the value of the partner email input field  ${PPK_VALAMI_EMAIL}
    Click the search button and waiting  ${PPK_WATING_TIME1}
    Check the search is working  ${lis}[3]
    Push the reset button and waiting  ${PPK_WATING_TIME2}
    Check the result after push the reset button  ${lis}

*** Keywords ***
