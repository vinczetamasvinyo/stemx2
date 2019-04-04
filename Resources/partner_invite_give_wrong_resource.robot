*** Settings ***
Library  SeleniumLibrary
Resource  partner_invite_common_resource.robot
Resource  PO/po_login.robot
Resource  Common.robot

*** Keywords ***
Check the error message in the token page
    [Documentation]  Megnézi, hogy rossz token megadásakor a visszakapott
    ...  error szöveg megfelel annak amit megadtunk.
    [Arguments]  ${szoveg2}
    Wait the error message on the token page
    ${szoveg} =   Get the error message text about the token
    Check the two text is same  ${szoveg}  ${szoveg2}

Check the error message when give not same password
    [Documentation]  Megnézi, hogy a hibaüzenet szövege megfelelőe.
                ...  ha nem ugyan azt a két jelszót adjuk meg.
    [Arguments]  ${szoveg2}
    ${szoveg} =  Get the error message when give not same password
    Check the two text is same  ${szoveg}  ${szoveg2}

Check the error message in password input field
    [Arguments]  ${szoveg2}
    ${szoveg} =  Get the error message from password input
    Check the two text is same  ${szoveg}  ${szoveg2}
