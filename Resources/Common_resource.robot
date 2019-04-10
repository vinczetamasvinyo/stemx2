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

Check the error message appear and the error text value
    [Documentation]  Megnézzük, hogy megjelenik-e a hibaüzenet,
                ...  illetve az error hibaüzenet megfelelőe.
    [Arguments]  ${veznev}  ${hibaszoveg}
    ${van3}  ${van4} =  check the elem contain in parent2  ${veznev}  .//app-show-errors/ul/li
    should be true  ${van3}
    ${hibaszoveg2} =  get text  ${van4}
    log  ${hibaszoveg2}
    should be true  "${hibaszoveg}" == "${hibaszoveg2}"