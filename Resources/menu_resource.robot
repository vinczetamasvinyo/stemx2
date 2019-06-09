*** Settings ***
Resource  PO/po_menu.robot
Resource  PO/po_auditoriums.robot
Resource  PO/po_venues.robot
Resource  PO/po_programok.robot
Resource  programok_resource.robot
Resource  PO/po_events.robot
Resource  events_resource.robot

*** Keywords ***
Click the events menu and wait the submenu visiable
    [Documentation]  Belekettint események menüpontba és megvárja,
                ...  hogy az almenu kinyíljon.
    Click the events menu
    Wait until the events submenu visible

Go to the auditoriums page
    [Documentation]  Elmegy az auditoriums oldalra.
    Click the events menu and wait the submenu visiable
    #Click the events menu
    #Wait until the events submenu visible
    Click the auditoriums submenu
    Wait the auditoriums page loaded

Go to the venues page
    [Documentation]  Elmegy a venues oldalra
    Click the events menu and wait the submenu visiable
    #Click the events menu
    #Wait until the events submenu visible
    click the venues submenu
    po_venues.Wait until the venues page loaded

Go to the programs page
    [Documentation]  Elmegy a programok oldalráa
    #Click the events menu
    #Wait until the events submenu visible
    Click the events menu and wait the submenu visiable
    Click the programs submenu
    programok_resource.Waiting the programs page loaded

Go to the events page
    [Documentation]  Elmegye az események oldalra.
    Click the events menu and wait the submenu visiable
    Click the events submenu
    Waiting the events page loaded
    #sleep  2s