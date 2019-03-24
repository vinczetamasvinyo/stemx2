*** Settings ***
Documentation  Az eseménylista megjelenítéséhez kapcsolódó tesztek.

Resource  ../../Resources/event_list_resource.robot
#Resource  ../../Resources/login_resource.robot
#Resource  ../../Resources/Common.robot
#Library  ../../ExternalResources/mylibrary.py
#Resource  ../../Resources/variables.robot
#Variables  ../../Resources/variable.py
Library  robot.libraries.DateTime

Test Setup  login_resource.Open Vk login page  ${OLDAL_URL}  ${bogeszo}
Test Teardown  common.End web test

*** Variables ***
#${bogeszo} =  chrome
${EVENT_LIST_ESEMENY_TEXT} =  Esemény
${EVENT_LIST_DATUM_TEXT_HU} =  DÁTUM
${EVENT_LIST_JEGYEK_TEXT_HU} =  JEGYEK
# ${EVENT_LIST_ESEMENY_TEXT}


*** Test Cases ***
Event lista oldalon az "Események" szoveg megnezese HU
    [Documentation]  A teszteset során azt nézzük meg a program neve  szöveg megjelenik-e.
    [Tags]  smoke
    # Login
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Go to the eladas page via menu
    Check the "Esemény" text in the esemenyek page  ${EVENT_LIST_ESEMENY_TEXT}

Event lista oldalon a program neve megjelenik-e a tablazatban
    [Documentation]  A teszt során azt nézzük meg, hogy a program neve szöveg megjelenik-e az event lista oldalon
    [Tags]  smoke
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Go to the eladas page via menu
    Check the program name appear on the event list page

Event lista oldalon az "audit" nev megjelenik-e
    [Documentation]  A teszt során azt nézzük meg, hogy az audit név megjelenik-e az egyik event listában
    [Tags]  Smoke  most
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok}
    Check the login succes or not
    sleep  1s
    Go to the eladas page via menu
    Check the audit name appear on the event list page

Event lista oldalon a "Dátum" szoveg megnezese HU
    [Documentation]  A teszt során azt nézzük meg, hogy a Dátum szöveg megjelenik-e az oldalon.
    [Tags]  smoke  hun
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok}
    Check the login succes or not
    sleep  1s
    Go to the eladas page via menu
    Check the "Dátum" text in the esemenyek page  ${EVENT_LIST_DATUM_TEXT_HU}

Event lista oldalon a "Jegyek" szoveg megnezese HU
    [Documentation]  A teszt során azt nézzük meg, hogy a Jegyek szöveg megjelenik-e az oldalon.
    [Tags]  smoke  hun  most5
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok}
    Check the login succes or not
    sleep  1s
    Go to the eladas page via menu
    Check the "Jegyek" text in the esemenyek page  ${EVENT_LIST_JEGYEK_TEXT_HU}


Event lista oldalon az esemenyek kozt a datum megjelenik-e
    [Documentation]  A teszt során azt nézzük meg, hogy dátum megjelenik az event eseményeknél és hogy ennek a
                ...  formátuma megfelelő-e.
    [Tags]  smoke
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok}
    Check the login succes or not
    sleep  1s
    Go to the eladas page via menu
    ${datum_string} =  Check the date time appear on the event list page
    Check the hun date format is correct  ${datum_string}


test1
    [Tags]  most3
    # ${string} =  return_date_text
    ${date} =  convert date  20190212
    ${ABC}  Set Variable    Test
    ${XYZ}  Set Variable    1233
    ${type_abc} =  evaluate  type($ABC)
    Log  ${type_abc}
    ${type_xyz} =  evaluate  type($XYZ)
    Log  ${type_xyz}
    should be true  ${XYZ} > 0
*** Keywords ***

