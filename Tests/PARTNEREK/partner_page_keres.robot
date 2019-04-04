*** Settings ***
Resource  ../../Resources/partner_invite_common_resource.robot
Suite Setup  Login and go to partners page

*** Keywords ***

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

