*** Settings ***
Resource  partner_invite_common_resource.robot
Resource  PO/po_partners.robot
Resource  PO/po_alt.robot
Resource  Common.robot

*** Keywords ***
Check the all eyes appear in the page
    [Documentation]  Megnézi, hogy az összes szem megjelenik-e az oldalon.
    ${elem} =  Get the eyes count
    ${sor} =  Get the row count
    should be true  "${elem}" == "${sor}"

Check the all edit icon appear in the page
    [Documentation]  Megnézi, hogy az összes szerkesztés ikon megjelenik-e az oldalon.
    ${elem} =  Get the edit count
    ${sor} =  Get the row count
    should be true  "${elem}" == "${sor}"

Check the all delete icon appear in the page
    [Documentation]  Megnézi, hogy az összes törlés ikon megjelenik-e az oldalon.
    ${elem} =  Get the Delete count
    ${sor} =  Get the row count
    should be true  "${elem}" == "${sor}"

