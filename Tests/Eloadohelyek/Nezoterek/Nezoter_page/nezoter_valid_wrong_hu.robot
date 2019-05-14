*** Settings ***
Documentation  A suite a keresőhöz kapcsolódó teszteseteket tartalmazza, hogy a nézőtér oldalon
          ...  megfelelő szöveg beírása során nem jelenik meg hibaüzenet.

Resource  ../../../../Resources/auditoriums_resource.robot


Suite Setup  Open browser and login and after go to the auditoriums page and change hu language  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
Suite Teardown  Common.End web test

*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}
${NEZOTER_VALID_WRONG_TOO_LONG} =  dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
${LAN} =  Hun

*** Test Cases ***
Test give the too long text into the input search field hu
    [Documentation]  A teszt során azt nézzük meg, hogy a magyar oldalon
                ...  túl hosszú szöveget írunk be és a megfelelő
                ...  hibaüzenet megjelenik-e.
    Reset on the auditorium page
    Give the search value  ${NEZOTER_VALID_WRONG_TOO_LONG}
    Click the header row3 on the auditorium page
    Check the error message appear on the search fields ont the auditorium page  ${AUDITORIUMS_ERROR_TEXT_TOO_LONG.${LAN}}
