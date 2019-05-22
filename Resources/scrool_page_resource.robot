*** Settings ***
Resource  PO/po_page_navigator.robot
Resource  paga_element_resource.robot

*** Keywords ***
Set the row number add check the row visiable
    [Arguments]  ${row_number}
    ${maxszam} =  Get the items max count
    scroll page  ${row_number}
    ${sorok} =  Get the row count
    Check the rownumber  ${row_number}  ${maxszam}  ${sorok}

Check the rownumber
    [Documentation]  Megnézi, hogy a sorok megfelelően jelentek-e meg. Attól függően, hogy
                ...  mennyi elem lett lekérve.
    [Arguments]  ${scrollnumber}  ${max}  ${sorok}
    run keyword if  ${scrollnumber} > ${max}  should be true  ${scrollnumber} > ${sorok}
    ...  ELSE  should be true  ${scrollnumber} == ${sorok}
