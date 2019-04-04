*** Settings ***
Library  SeleniumLibrary
Resource  PO/po_partners.robot

*** Keywords ***
Check the title of partner page
    [Arguments]  ${szoveg2}
    ${szoveg} =  Get the title of partner page
    log  ${szoveg}
    should be true  "${szoveg}" == "${szoveg2}"

Check the partner neve text in partner page
    [Arguments]  ${szoveg2}
    ${szoveg} =  Get the partner neve text
    log  ${szoveg}
    should be true  "${szoveg}" == "${szoveg2}"

Check the email cim text in partner page
    [Arguments]  ${szoveg2}
    ${szoveg} =  Get the email cim text
    log  ${szoveg}
    should be true  "${szoveg}" == "${szoveg2}"

Check the allapot text in partner page
    [Arguments]  ${szoveg2}
    ${szoveg} =  Get the allapot text
    log  ${szoveg}
    should be true  "${szoveg}" == "${szoveg2}"

Check the visszaallit button text in partner page
    [Arguments]  ${szoveg2}
    ${szoveg} =  Get the visszaallit button text
    log  ${szoveg}
    should be true  "${szoveg}" == "${szoveg2}"

Check the kereses button text in partner page
    [Arguments]  ${szoveg2}
    ${szoveg} =  Get the kereses button text
    log  ${szoveg}
    should be true  "${szoveg}" == "${szoveg2}"

Check the partner neve text in the table header
    [Documentation]  Megnézi, hogy a partner táblázat címsorában
                ...  a partner neve szöveg a paraméterben megadott
                ...  szövegként jelenik-e meg.
    [Arguments]  ${szoveg2}
    ${szoveg} =  Get the partner neve text form the table header
    log  ${szoveg}
    should be true  "${szoveg}" == "${szoveg2}"

Check the email text in the table header
    [Documentation]  Megnézi, hogy a partner táblázat címsorában
                ...  a email cím szöveg a paraméterben megadott
                ...  szövegként jelenik-e meg.
    [Arguments]  ${szoveg2}
    ${szoveg} =  Get the email text form the table header
    log  ${szoveg}
    should be true  "${szoveg}" == "${szoveg2}"

Check the cim text in the table header
    [Documentation]  Megnézi, hogy a partner táblázat címsorában
                ...  a cím szöveg a paraméterben megadott
                ...  szövegként jelenik-e meg.
    [Arguments]  ${szoveg2}
    ${szoveg} =  Get the cim text form the table header
    log  ${szoveg}
    should be true  "${szoveg}" == "${szoveg2}"

Check the allapot text in the table header
    [Documentation]  Megnézi, hogy a partner táblázat címsorában
                ...  az állapot szöveg a paraméterben megadott
                ...  szövegként jelenik-e meg.
    [Arguments]  ${szoveg2}
    ${szoveg} =  Get the allapot text form the table header
    log  ${szoveg}
    should be true  "${szoveg}" == "${szoveg2}"

Check the lehetosegek text in the table header
    [Documentation]  Megnézi, hogy a partner táblázat címsorában
                ...  a lehetőségek szöveg a paraméterben megadott
                ...  szövegként jelenik-e meg.
    [Arguments]  ${szoveg2}
    ${szoveg} =  Get the lehetosegek text form the table header
    log  ${szoveg}
    should be true  "${szoveg}" == "${szoveg2}"

Check the uj letrehozasa button text
    [Documentation]  Megnézi, hogy a partner létrehozása gomb szovege
                ...  a paraméterben megadottként jelenik-e meg.
    [Arguments]  ${szoveg2}
    ${szoveg} =  Get the uj letrehozasa button text
    log  ${szoveg}
    should be true  "${szoveg}" == "${szoveg2}"

Checkt the allapot valaszto elso elem szovege
    [Documentation]  Ellenőrzni, hogy az állapot választóban lévő első elem szövegét
    [Arguments]  ${szoveg2}
    ${szoveg} =  Get the allapotvalaszto elso eleme text
    log  ${szoveg}
    should be true  "${szoveg}" == "${szoveg2}"

Checkt the allapot valaszto masodik elem szovege
    [Documentation]  Ellenőrzni, hogy az állapot választóban lévő masodik elem szövegét
    [Arguments]  ${szoveg2}
    ${szoveg} =  Get the allapotvalaszto masodik eleme text
    log  ${szoveg}
    should be true  "${szoveg}" == "${szoveg2}"

Check the allapot valaszto harmadik elem szovege
    [Documentation]  Ellenőrzni, hogy az állapot választóban lévő harmadik elem szövegét
    [Arguments]  ${szoveg2}
    ${szoveg} =  Get the allapotvalaszto harmadik eleme text
    log  ${szoveg}
    should be true  "${szoveg}" == "${szoveg2}"

Check the allapot valaszto negyedik elem szovege
    [Documentation]  Ellenőrzni, hogy az állapot választóban lévő negyedik elem szövegét
    [Arguments]  ${szoveg2}
    ${szoveg} =  Get the allapotvalaszto negyedik eleme text
    log  ${szoveg}
    should be true  "${szoveg}" == "${szoveg2}"

Check the allapot valaszto otodik elem szovege
    [Documentation]  Ellenőrzni, hogy az állapot választóban lévő ötödik elem szövegét
    [Arguments]  ${szoveg2}
    ${szoveg} =  Get the allapotvalaszto otodik eleme text
    log  ${szoveg}
    should be true  "${szoveg}" == "${szoveg2}"

Check the allapot valaszto hatodik elem szovege
    [Documentation]  Ellenőrzni, hogy az állapot választóban lévő hatodik elem szövegét
    [Arguments]  ${szoveg2}
    ${szoveg} =  Get the allapotvalaszto hatodik eleme text
    log  ${szoveg}
    should be true  "${szoveg}" == "${szoveg2}"

Check the allapot valaszto elemszama
    [Documentation]  Ellenőrzni, hogy az állapot választónak az elemszámát.
    [Arguments]  ${szoveg2}
    ${szoveg} =  Get the count item of allapotvalaszto
    log  ${szoveg}
    should be true  "${szoveg}" == "${szoveg2}"