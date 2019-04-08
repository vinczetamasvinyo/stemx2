*** Settings ***
Resource  partner_invite_common_resource.robot


*** Keywords ***
Login and go to the new partner page
    [Arguments]  ${oldal}  ${bong}  ${email}  ${jelszo}
    Login and go to the partners page  ${oldal}  ${bong}  ${email}  ${jelszo}
    Click the new partner
    Waiting the new partner page loaded

Login and go to the new paratner page and change language to english
    [Arguments]  ${oldal}  ${bong}  ${email}  ${jelszo}
    Login and go to the partners page  ${oldal}  ${bong}  ${email}  ${jelszo}
    Click the new partner
    Waiting the new partner page loaded
    Change the language to English via mymenu