*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Common.robot
Resource  ../../Resources/Common_resource.robot
Resource  ../../Resources/variables.robot
Resource  ../../Resources/PO/po_userprofile.robot

*** Variables ***
${LISTBOX} =  xpath=//*[@formcontrolname="partnerId"]

*** Test Cases ***
Test1
    common.Begin web test  https://dev.stx.interticket.com/  ${bogeszo}
    Wait the stemx login page loaded
    Choose item from listbox  Interticket  ${LISTBOX}
    #Elem kivalasztasa  Interticket
    Push the login button on the stemx login page
    wait until element is visible  xpath=//button[@value="login"]
    input text  id=Username  Vinyo
    input text  id=Password  Vinyo


*** Keywords ***
Wait the stemx login page loaded
    wait until element is visible  //*[@class="button expanded"]  10

Push the login button on the stemx login page
    click element  xpath=//*[@class="button expanded"]

Elem kivalasztasa
    [Arguments]  ${item}
    scroll to element  ${LISTBOX}  100
    click element  ${LISTBOX}
    wait until element is visible  xpath=//*[@class="cdk-overlay-pane"]
    ${el} =  Get listbox item xpath  ${item}  ${LISTBOX}  aria-owns
    click element  ${el}
