*** Settings ***
Resource  PO/po_menu.robot
Resource  PO/po_auditoriums.robot
Resource  PO/po_venues.robot
Resource  PO/po_programok.robot
Resource  programok_resource.robot

*** Keywords ***
Go to the auditoriums page
    [Documentation]  Elmegy az auditoriums oldalra.
    #Click the Venues menu
    Click the events menu
    #Wait until the venues submenu visible
    Wait until the events submenu visible
    Click the auditoriums submenu
    Wait the auditoriums page loaded

Go to the venues page
    [Documentation]  Elmegy a venues oldalra
    #Click the Venues menu
    Click the events menu
    Wait until the events submenu visible
    #Wait until the venues submenu visible
    click the venues submenu
    po_venues.Wait until the venues page loaded

Go to the programs page
    [Documentation]  Elmegy a programok oldalráa
    Click the events menu
    Wait until the events submenu visible
    Click the programs submenu
    programok_resource.Waiting the programs page loaded