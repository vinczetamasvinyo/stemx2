*** Settings ***
Library  SeleniumLibrary
Resource  partner_invite_resource.robot
Resource  Common_resource.robot
Resource  PO/po_common.robot

*** Variables ***


*** Keywords ***
Check input error message and click save and wait the errors
    [Documentation]  A keyword három dolgot hajt végre:
                ...  1.  Megnézi, hogy error message nem látható az oldalon.
                ...  2.  Megnyomja a mentés gombot.
                ...  3.  Megvárja amíg a hibaüzenet megjelenik.
    po_common.Check the input error not visible on the page
    po_common.Click the save button on the page
    po_common.Wait until input error visible

Login and go the new partner page and push the mentes
    [Arguments]  ${oldal}  ${bong}  ${login_data}
    Login and go to the new partner page  ${oldal}  ${bong}  ${login_data}
    Check input error message and click save and wait the errors
    #element should not be visible  xpath=//app-show-errors/ul/li
    #click element  xpath=//button[@class="button success"]
    #wait until element is visible  xpath=//app-show-errors/ul/li

Login go new partner page and change englis and push the mentes
    [Arguments]  ${oldal}  ${bong}  ${login_data}
    Login and go to the new partner page  ${oldal}  ${bong}  ${login_data}
    #Login and go to the new partner page  ${oldal}  ${bong}  ${email}  ${jelszo}
    #element should not be visible  xpath=//app-show-errors/ul/li
    Change the language to English via mymenu
    Check input error message and click save and wait the errors
    #click element  xpath=//button[@class="button success"]
    #wait until element is visible  xpath=//app-show-errors/ul/li
    #sleep  3s


