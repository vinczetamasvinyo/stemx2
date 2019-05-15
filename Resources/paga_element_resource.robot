*** Settings ***
Resource  PO/po_alt.robot

*** Keywords ***
Check the all eyes appear in the page
    [Documentation]  Megnézi, hogy az összes szem megjelenik-e az oldalon.
    ${elem} =  Get the eyes count
    ${sor} =  Get the row count
    should be true  "${elem}" == "${sor}"

Check the all edit icon appear in the page
    [Documentation]  Megnézi, hogy az összes szerkesztés ikon megjelenik-e az oldalon.
    ${elem} =  Get the edit count
    ${sor} =  Get the active row count
    should be true  "${elem}" == "${sor}"

Check the all delete icon appear in the page
    [Documentation]  Megnézi, hogy az összes törlés ikon megjelenik-e az oldalon.
    ${elem} =  Get the Delete count
    ${sor} =  Get the active row count
    should be true  "${elem}" == "${sor}"

Check the delete icon not appear in tha page
    [Documentation]  Megnézi, hogy az összes törlés ikon megjelenik-e az oldalon.
    ${elem} =  Get the Delete count
    ${db} =  convert to integer  0
    should be equal  ${elem}  ${db}

Chcek the all allapot icon appear in the page
    ${sorok} =  Get the row count
    ${db_new} =  Get the draft icon
    ${db_aktiv} =  Get the active icon
    ${db_waite} =  Get the waiting icon
    ${osszes} =  Evaluate   ${db_new}+${db_aktiv}+${db_waite}
    should be equal  ${sorok}  ${osszes}