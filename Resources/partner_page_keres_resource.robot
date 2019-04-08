*** Settings ***
Library  SeleniumLibrary
Resource  partner_invite_common_resource.robot
Resource  PO/po_alt.robot

*** Keywords ***
Get the all default value
    ${default_paartner_allapot} =  Get the valu of allapotvalaszto
    ${defautl_partner_neve} =  Get the value of partner name
    ${default_partner_email} =  Get the value of email adress
    ${default_row} =  get the row count
    @{lista} =  create list
    append to list  ${lista}  ${default_paartner_allapot}
    append to list  ${lista}  ${defautl_partner_neve}
    append to list  ${lista}  ${default_partner_email}
    append to list  ${lista}  ${default_row}
    [Return]  ${lista}

Check the search is working
    [Documentation]  Megnézi, hogy a kerés működik-e.
    [Arguments]  ${default}
    ${search_row} =  get the row count
    should not be equal  ${default}  ${search_row}
    log  ${search_row}
    #log  ${partner_neve2}

Check the result after push the reset button
    [Arguments]  ${lista}
    ${last_paartner_allapot} =  Get the valu of allapotvalaszto
    ${last_partner_neve} =  Get the value of partner name
    ${last_partner_email} =  Get the value of email adress
    ${last_row} =  get the row count
    should be equal  ${lista}[0]  ${last_paartner_allapot}
    should be equal  ${lista}[1]  ${last_partner_neve}
    should be equal  ${lista}[2]  ${last_partner_email}
    should be equal  ${lista}[3]  ${last_row}

Push the reset button and waiting
    [Documentation]  Megnyomja a resut button és várakozik a megadott ideig.
    [Arguments]  ${waiting}
    click element  xpath=//reset-button
    sleep  ${waiting}

Click the search button and waiting
    [Documentation]  Megnyomja a keresés gombot és varakozik. A várkozási időt paraméterben kapja meg.
    [Arguments]  ${time}
    Click the search button
    sleep  ${time}
