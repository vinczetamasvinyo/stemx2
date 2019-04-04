*** Settings ***
Resource  login_resource.robot
Resource  Common.robot
Library  ../ExternalResources/mylibrary.py
Resource  variables.robot
Variables  variable.py
Resource  PO/po_event_list.robot
Resource  PO/po_menu.robot
Library  robot.libraries.DateTime

*** Keywords ***
Check the "Esemény" text in the esemenyek page
    [Documentation]  Az események oldalon megnézi, hogy az Esemény szöveg megtalálható-e
    [Arguments]  ${text}
    #Esemenyek text appear in the page  ${text}
    Esemenyek text appear above the table  ${text}

Check the "Dátum" text in the esemenyek page
    [Documentation]  Az események oldalon megnézi, hogy a Dátum szöveg megjelenik-e.
    [Arguments]  ${text}
    # Datum text appear in the page  ${text}
    # get css attribute value  //div[@class='columns large-3 medium-3']  text-transform
    Datum text appear above the table  ${text}

Check the "Jegyek" text in the esemenyek page
    [Documentation]  Az események oldalon megnézi, hogy a dátum szöveg megjelenik-e.
    [Arguments]  ${text}
    Jegyek text appear above the table  ${text}


Go to the eladas page via menu
    po_menu.Click the jegypenzter menu and wait for the submenu
    po_menu.Click the "eladas" submenu
    # click element  link=Eladás
    #click element  css=a[href*='boxoffice/sales']
    po_event_list.wait the event list page will load
    # wait until element is visible  class=auditorium

Check the program name appear on the event list page
    [Documentation]  Megnézzük, hogy a venue nev megjelenik az oldalon, illetve a hossza az hosszabb-e mint 0.
    ${log_venue_nev} =  Get the program name from the event list page
    Log the program nev  ${log_venue_nev}
    ${venue_hossz} =  Get lenght of program name  ${log_venue_nev}
    Log the length of program name  ${venue_hossz}
    Check the length of program name larger than number  ${venue_hossz}

Check the audit name appear on the event list page
    [Documentation]  Megnézzük, hogy az audit név megjelenik-e és hossza megfelelő-e.
    ${audit_element} =  get audit elemet
    ${audit_name} =  Get audit name from element object  ${audit_element}
    Check the audit element is visiable  ${audit_element}
    Log the audit name  ${audit_name}
    ${hossz} =  Get lenght of audit name  ${audit_name}
    Check the length of audit name larger than number  ${hossz}

Check the date time appear on the event list page
    [Documentation]  Megnézzük, hogy a datum megjelenik a eseménylistában és visszaadjuk a datum stringet
    ${date_element} =  get date element
    ${date_time_string} =  Get date time from element object  ${date_element}
    check the date time is visiable  ${date_element}
    Log the date time string  ${date_time_string}
    [Return]  ${date_time_string}

Check the hun date format is correct
    [Documentation]  Ellenőrzi, hogy a talált datum formátum megfelelő-e
    [Arguments]  ${date_string}
    # A return text szétvágja a kapott stringet és magyarul újból összerakja és ezt adja vissza.
    ${text} =  return date text  ${date_string}
    Check the original and new text date is equal  ${text}  ${date_string}

Get CSS Attribute Value
    [Arguments]    ${locator}    ${attribute}
    # Get element using Xpath in JavaScript.
    # Note there are other options like getElementById/Class/Tag
    ${element}=    Set Variable    document.evaluate("${locator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
    # Get css attribute value using getComputedStyle()
    ${attribute_value}=    Execute Javascript    return window.getComputedStyle(${element},null).getPropertyValue('${attribute}');
    Log   ${attribute_value}
