*** Settings ***
Resource  login_resource.robot
Resource  variables.robot
Resource  PO/po_menu.robot
Variables  variable.py
Resource  PO/po_programs.robot
Resource  PO/po_program.robot

*** Keywords ***
Go to the Programok page via menu
    [Documentation]  Elmegyünk a Programok menüpontban.
    Click the Esemenyek menu and wait for the submenu
    #click element  xpath=//a[contains(text(),'Események')]
    #wait until element is visible  cdk-accordion-child-2
    Click the Programok submenu
    #wait until element is visible  link=Programok
    #click element  link=Programok

Click the megtekintes icon an waite the page of program load
    Click the program megtekintese
    Wait the program page load
   