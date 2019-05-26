*** Settings ***
Resource  PO/po_programok.robot
Resource  Common_resource.robot

*** Keywords ***
Waiting the programs page loaded
    [Documentation]  Megvárja amíg a programok oldal betöltődik.
    po_alt.Waiting the page loaded finish
    wait the search input visiable in the programs page


Waiting the create new page loaded
    [Documentation]  Megvárja amíg az új program létrehozása oldal betöltődik.
    wait until the program name input field visiable
