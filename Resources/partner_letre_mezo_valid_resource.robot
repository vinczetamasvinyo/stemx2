*** Settings ***
Library  SeleniumLibrary
Resource  partner_invite_resource.robot
Resource  Common_resource.robot
Resource  variables/new_partner_variables.robot


*** Keywords ***
Give the firstname and lastname
    [Documentation]  Megadja a keresztnevet és egy másik mező értékét.
    [Arguments]  ${long}  ${aaaa}
    give the firstname  ${long}
    give the lastname  ${aaaa}

Give the lastname and firstname
    [Documentation]  Megadja a vezetéknevet és egy másik mező értékét.
    [Arguments]  ${long}  ${aaaa}
    give the lastname  ${long}
    give the firstname  ${aaaa}
