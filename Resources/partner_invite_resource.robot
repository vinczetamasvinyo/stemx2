*** Settings ***
Library  SeleniumLibrary
Resource  PO/po_partners.robot

*** Variables ***


*** Keywords ***
Check the partner meghivasa gomb text
    [Documentation]  Megnézi, hogy a paraméterben megadott szöveggel
                     ...  egyezik-e a partner meghívása gomb.
    [Arguments]  ${szoveg}
    ${button_szoveg} =  Get the text of invite partner button
    Log  ${button_szoveg}
    should be true  '${button_szoveg}'=='${szoveg}'

Click the partner invite button
    Click invite button

Check the firstname error message is not visiable
    [Documentation]  Megnézzük, hogy hibaüzenet megjelenik-e az oldalon.
    Check the Error message not visiable


Give the input date for the firstname azt other field
    [Documentation]  Megadjuk a kívánt adatot a firstname-be és egy másik mezőbe
    [Arguments]  ${firstname}  ${lastname}
    po_partners.Give the firstname  ${firstname}
    po_partners.Give the lastname  ${lastname}

Check the error message text and is visiable
    [Documentation]  Megnézzük, hogy a paraméterként megadott error message megjelenik-e.
    [Arguments]  ${error_message}
    po_partners.Wait the error message is visible
    #wait until element is visible  xpath=//app-show-errors/ul/li
    po_partners.Check the error message visiable
    # element should be visible  xpath=//app-show-errors/ul/li
    ${valami3} =  po_partners.Get the error message text
    # ${valami3} =  get text  xpath=//app-show-errors/ul/li
    should be equal as strings  ${valami3}  ${error_message}

Waite the partner invite page loaded
    Check the first name field visiable on the page
    #wait until element is visible  xpath=//input[@formcontrolname="firstName"]