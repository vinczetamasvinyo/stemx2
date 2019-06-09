*** Settings ***
Resource  PO/po_events.robot
Resource  PO/po_alt.robot
Resource  Common_resource.robot

*** Variables ***
&{EVENTS_PAGE_TITLE}  Hun=Események  En=Events
&{EVENTS_PAGE_INPUT_EVENTS_TEXT}  Hun=Esemény neve  En=Event name
&{EVENTS_PAGE_INPUT_PLACE_TEXT}  Hun=Helyszín  En=Place
&{EVENTS_PAGE_INPUT_COMMENT_TEXT}  Hun=Megjegyzés  En=Comment
&{EVENTS_PAGE_INPUT_DATA_RANDE_TEXT}  Hun=Időszak  En=Date range

*** Keywords ***
Waiting the events page loaded
    [Documentation]  Megvárja amíg az események oldal betöltődik
    po_alt.Waiting the page loaded finish
    Waiting the event input field visiable