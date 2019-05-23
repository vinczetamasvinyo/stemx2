*** Settings ***
Resource  PO/po_page_navigator.robot
Resource  paga_element_resource.robot
Resource  PO/po_alt.robot

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

Check the first navigation button not active when first time arrive in the page
    [Documentation]  Itt nézzük meg, hogy az első esetben mikor megérkezünk
                ...  az oldalra, akkor nem lehet aktív az első oldalra vezető
                ...  gomb.
    Check the navigation first not active

Check the previous button not active when first time arrive in the page
    [Documentation]  Itt nézzük meg, hogy az első esetben mikor megérkezünk
                ...  az oldalra, akkor nem lehet aktív az egyel vissza
                ...  vezető nyíl gomb.
    Check the navigation previous not active

Check the forward button active when first time arrive in the page
    [Documentation]  A teszt során azt nézzük meg, hogy tovább gomb
                ...  aktív-e mikor elsőnek megérekezünk az oldalra.
                ...  Ha az oldalon már nincs több elem, akkor ez nem
                ...  lehet aktív
    ${max} =  Get the items max count
    ${last} =  Get the items last count
    run keyword if  ${max} > ${last}  Check the navigation next active
    ...  ELSE  Check the navigation next active

Check the last button active when first time arrive in the page
    [Documentation]  A teszt során azt nézzük meg, hogy tovább gomb
                ...  aktív-e mikor elsőnek megérekezünk az oldalra.
                ...  Ha az oldalon már nincs több elem, akkor ez nem
                ...  lehet aktív
    ${max} =  Get the items max count
    ${last} =  Get the items last count
    run keyword if  ${max} > ${last}  Check the navigation last active
    ...  ELSE  Check the navigation last not active

Click the forward button and check is it work
    ${last} =  Get the items last count
    Click the navigation next
    Waiting the page loaded finish
    ${last2} =  Get the items last count
    should be true  "${last}" != "${last2}"


Click the forward button when first time arrive in the page
    [Documentation]  A teszt során azt nézzük meg, hogyha a tovább
                ...  gombra kattintunk, akkor az megfelelően működik-e.
    Reload the venues page
    ${max} =  Get the items max count
    ${last} =  Get the items last count
    run keyword if  ${max} > ${last}  Click the forward button and check is it work

Click the last button and check is it work
    [Documentation]  Azt nézzük meg, hogy az utolsó gombra kattintás
                ...  az megfelelően működik-e.
    ${last} =  Get the items last count
    Click the navigation last
    Waiting the page loaded finish
    ${last2} =  Get the items last count
    should be true  "${last}" != "${last2}"

Click the last button when first time arrive in the page
    [Documentation]  Azt nézzük meg, hogyha az utolsó
                ...  gombra kattintunk, akkor az megfelelően működik-e.
    Reload the venues page
    ${max} =  Get the items max count
    ${last} =  Get the items last count
    run keyword if  ${max} > ${last}  Click the last button and check is it work

Click the last button and check the last button status
    [Documentation]  Az utolsó oldalra vezető eljárást meghívjuk,
                ...  majd megnézzük, hogy az utolsó oldalra vezető
                ...  gomb státusa aktív-e. Nem szabad, hogy aktív legyen.
    Click the last button when first time arrive in the page
    Check the navigation last not active

Click the last button and check the next button status
    [Documentation]  Az utolsó oldalra vezető eljárást meghívjuk,
                ...  majd megnézzük, hogy a következő oldalra vezető
                ...  gomb státusa aktív-e. Nem szabad, hogy aktív legyen.
    Click the last button when first time arrive in the page
    Check the navigation next not active

Click the last button and check the previous button status
    [Documentation]  Az utolsó oldalra vezető eljárást meghívjuk,
                ...  majd megnézzük, hogy az egyel előre vezető
                ...  gomb státusa aktív-e. Aktív kell hogy legyen.
    Click the last button when first time arrive in the page
    Check the navigation previous active

Click the last button and check the first button status
    [Documentation]  Az utolsó oldalra vezető eljárást meghívjuk,
                ...  majd megnézzük, hogy az első oldalra vezető
                ...  gomb státusa aktív-e. Aktív kell hogy legyen.
    Click the last button when first time arrive in the page
    Check the navigation first active