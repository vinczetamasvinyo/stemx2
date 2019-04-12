*** Settings ***
Library  SeleniumLibrary
Resource  partner_invite_resource.robot
Resource  Common_resource.robot

*** Variables ***


*** Keywords ***
Login and go the new partner page and push the mentes
    [Arguments]  ${oldal}  ${bong}  ${email}  ${jelszo}
    Login and go to the new partner page  ${oldal}  ${bong}  ${email}  ${jelszo}
    element should not be visible  xpath=//app-show-errors/ul/li
    click element  xpath=//button[@class="button success"]
    wait until element is visible  xpath=//app-show-errors/ul/li

Login go new partner page and change englis and push the mentes
    [Arguments]  ${oldal}  ${bong}  ${email}  ${jelszo}
    Login and go to the new partner page  ${oldal}  ${bong}  ${email}  ${jelszo}
    element should not be visible  xpath=//app-show-errors/ul/li
    Change the language to English via mymenu
    click element  xpath=//button[@class="button success"]
    wait until element is visible  xpath=//app-show-errors/ul/li
    sleep  3s


