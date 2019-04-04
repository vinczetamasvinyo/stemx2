*** Settings ***
Library  SeleniumLibrary
Library  ../../ExternalResources/mylibrary.py

*** Variables ***
${PO_EVENT_LIST_ESEMENY_TEXT_ID} =  xpath=//div[@class='columns large-5 medium-6']
${PO_EVENT_LIST_ESEMENY_LOAD_ID} =  class=auditorium
${PO_EVENT_MIN_VENUE_NAME_LENGTH} =  0
${PO_EVENT_LIST_ITEM} =  //boxoffice-sales-product-list-item
${PO_EVENT_AUDITORIUM_ID} =  //*[@class='auditorium-name']
# ${PO_EVENT_DATUM_TEXT_ID} =  //div[@class='row']/div[@class='columns large-3 medium-3']
${PO_EVENT_DATUM_TEXT_ID} =  //div[@class='columns large-3 medium-3']
${PO_EVENT_JEGYEK_TEXT_ID} =  //div[@class='columns large-2 medium-3 text-right']
${PO_EVENT_DATUM_ID} =  //div[@class='start-date']

*** Keywords ***
Esemenyek text appear in the page
    [Documentation]  Megnézi, hogy a megadott szöveg megtalálható-e az oldalon.
    [Arguments]  ${szoveg}
    page should contain  ${szoveg}

Datum text appear in the page
    [Documentation]  Megnézi, hogy a Datum szöveg megtalálható-e az oldalon.
    [Arguments]  ${szoveg1}
    page should contain  ${szoveg1}

Esemenyek text appear above the table
    [Documentation]  Megnézzi, hogy a esemenyek táblázata felett megtalálható-e
                ...  a megadott szöveg.
    [Arguments]  ${szoveg}
    log  ${szoveg}
    element text should be  ${PO_EVENT_LIST_ESEMENY_TEXT_ID}  ${szoveg}

Datum text appear above the table
    [Documentation]  Megnézzi, hogy as esemenyek táblázata felett megtalálható-e
                ...  a megadott szöveg.
    [Arguments]  ${szoveg}
    element text should be  ${PO_EVENT_DATUM_TEXT_ID}  ${szoveg}

Jegyek text appear above the table
    [Documentation]  Megnézi, hogy az események táblázata felett megtalálható-e
                 ...  a megadott, jegyek szöveg.
    [Arguments]  ${szoveg}
    # TODO:  Le kell cserélni a logikai változót.
    element text should be  ${PO_EVENT_JEGYEK_TEXT_ID}  ${szoveg}

wait the event list page will load
    [Documentation]  Megnézi, hogy az event list page betöltődött-e.
    wait until element is visible  ${PO_EVENT_LIST_ESEMENY_LOAD_ID}

Get the program name from the event list page
    [Documentation]  visszaadja az előadás nevét
    ${name_of_venue} =  venu nev2
    [Return]  ${name_of_venue}

Log the program nev
    [Arguments]  ${text}
    Log  ${text}

Get lenght of program name
    [Arguments]  ${szoveg}
    ${hossz} =  get length  ${szoveg}
    [Return]  ${hossz}

Log the length of program name
    [Arguments]  ${hossz}
    Log  ${hossz}

Check the length of program name larger than number
    [Arguments]  ${hossz}
    should be true  ${hossz} > ${PO_EVENT_MIN_VENUE_NAME_LENGTH}

get audit elemet
    [Documentation]  A visszaadott event listabol(sorok) visszaadja az első elem audit objectumát
    ${audit_element} =  get parent child object  ${PO_EVENT_LIST_ITEM}  ${PO_EVENT_AUDITORIUM_ID}
    [Return]  ${audit_element}

get date element
    [Documentation]  A megadott event listabol(sorok) visszaadja az első eleme datum objectumát
    ${date_element} =  get parent child object  ${PO_EVENT_LIST_ITEM}  ${PO_EVENT_DATUM_ID}
    [Return]  ${date_element}

Get audit name from element object
    [Documentation]  Az audit webelement objectből visszadjuk a nevet
    [Arguments]  ${elem}
    ${Return_text} =  get text  ${elem}
    [Return]  ${Return_text}

Get date time from element object
    [Documentation]  A date webelement objectből visszadjuk a datumot
    [Arguments]  ${elem}
    ${Return_text} =  get text  ${elem}
    [Return]  ${Return_text}

Check the audit element is visiable
    [Arguments]  ${elem}
    element should be visible  ${elem}

Log the audit name
    [Arguments]  ${name}
    log  ${name}

Get lenght of audit name
    [Arguments]  ${name}
    ${return_hossz} =  get length  ${name}
    [Return]  ${return_hossz}

Check the length of audit name larger than number
    [Arguments]  ${hossz}
    should be true  ${hossz} > 0

check the date time is visiable
    [Documentation]  Megnézzük, hogy a date time megjelenik-e az oldalon.
    [Arguments]  ${date_time_ob}
    element should be visible  ${date_time_ob}

Log the date time string
    [Arguments]  ${log}
    log  ${log}

Check the original and new text date is equal
    [Documentation]  Megnézi, hogy az eredetileg talál dátum string, illetve a szétvágásból készített egyezik-e
    [Arguments]  ${text1}  ${text2}
    should be true  '${text1}'=='${text2}'
    should be equal as strings  ${text1}  ${text2}