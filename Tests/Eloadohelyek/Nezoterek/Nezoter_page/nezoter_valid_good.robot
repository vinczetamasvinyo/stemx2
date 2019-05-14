*** Settings ***
Documentation  A suite a keresőhöz kapcsolódó teszteseteket tartalmazza, hogy a nézőtér oldalon
          ...  megfelelő szöveg beírása során nem jelenik meg hibaüzenet.

Resource  ../../../../Resources/auditoriums_resource.robot


Suite Setup  Open browser and login and after go to the auditoriums page  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
Suite Teardown  Common.End web test

*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}
${NEZOTER_VALID_GOOD_NORMAL_TEXT} =  valami
${NEZOTER_VALID_GOOD_NORMAL_TEXT_CAPITAL} =  VALAMI
${NEZOTER_VALID_GOOD_NORMAL_TEXT_SMALL_CAPITAL} =  Valami
${NEZOTER_VALID_GOOD_NORMAL_TEXT_SMALL_CAPITAL_NUMBER} =  Valami1223
${NEZOTER_VALID_GOOD_NORMAL_TEXT_SMALL_CAPITAL_NUMBER_OTHERS} =  Valami1223$#*@
${NEZOTER_VALID_GOOD_NORMAL_TEXT_LONG_GOOD} =  ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
${NEZOTER_VALID_GOOD_NORMAL_TEXT_SHOORT_GOOD} =  d
${NEZOTER_VALID_GOOD_NORMAL_TEXT_LONG_WRONG} =  dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
${LAN} =  Hun

*** Test Cases ***
Test the validation on the search input field give the normal text
    [Documentation]  Azt nézzük meg, hogy csak kisbetűt írunk be és nem jelenik meg hibaüzenet.
    Reset on the auditorium page
    Give the search value  ${NEZOTER_VALID_GOOD_NORMAL_TEXT}
    Click the header row3 on the auditorium page
    Check error not apper the search fields on the auditorium page

Test the validation on the search input field give the capital normal text
    [Documentation]  Azt nézzük meg, hogy csak nagybetűt írunk be és nem jelenik meg hibaüzenet.
    Reset on the auditorium page
    Give the search value  ${NEZOTER_VALID_GOOD_NORMAL_TEXT_CAPITAL}
    Click the header row3 on the auditorium page
    Check error not apper the search fields on the auditorium page

Test the validation on the search input field give the capital and small normal text
    [Documentation]  Azt nézzük meg, hogy nagy és kisbetűt írunk be.
    Reset on the auditorium page
    Give the search value  ${NEZOTER_VALID_GOOD_NORMAL_TEXT_SMALL_CAPITAL}
    Click the header row3 on the auditorium page
    Check error not apper the search fields on the auditorium page

Test the validation on the search input field give the capital, small, number normal text
    [Documentation]  Azt nézzük meg, hogy nagy és kisbetűt és számot írunk be.
    Reset on the auditorium page
    Give the search value  ${NEZOTER_VALID_GOOD_NORMAL_TEXT_SMALL_CAPITAL_NUMBER}
    Click the header row3 on the auditorium page
    Check error not apper the search fields on the auditorium page

Test the validation on the search input field give the capital, small, number and others normal text
    [Documentation]  Azt nézzük meg, hogy nagy, kisbetűt, számot, és speciális karaktert írtunk be.
    Reset on the auditorium page
    Give the search value  ${NEZOTER_VALID_GOOD_NORMAL_TEXT_SMALL_CAPITAL_NUMBER_OTHERS}
    Click the header row3 on the auditorium page
    Check error not apper the search fields on the auditorium page

Test the validation on the search input field give long good text
    [Documentation]  Azt nézzük meg, hogy hosszú 127 karakteres szöveget írunk be
                ...  és nem jelenik meg hibaüzenet.
    Reset on the auditorium page
    Give the search value  ${NEZOTER_VALID_GOOD_NORMAL_TEXT_LONG_GOOD}
    Click the header row3 on the auditorium page
    Check error not apper the search fields on the auditorium page

Test the validation on the search input field give long good text
    [Documentation]  Azt nézzük meg, hogy 1 hosszú szöveget írunk be
                ...  és nem jelenik meg hibaüzenet
    Reset on the auditorium page
    Give the search value  ${NEZOTER_VALID_GOOD_NORMAL_TEXT_SHOORT_GOOD}
    Click the header row3 on the auditorium page
    Check error not apper the search fields on the auditorium page

