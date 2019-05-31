*** Settings ***
Resource  ../../../../Resources/auditoriums_resource.robot
Library    robot.libraries.String

Suite Setup  Open browser and login and after go to the auditoriums page  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
Suite Teardown  Common.End web test


*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}  language=${LAN}
${LAN} =  Hun

*** Test Cases ***
Test the not existing value on the auditoriums page
    [Tags]  most
    Reset on the auditorium page
    ${kereses} =  set variable  Ilyen érték biztos hogy nincs felvéve
    ${ertek} =  get time in string
    Give the search value  ${kereses}${ertek}
    po_alt.Click the search button
    sleep  3s
    ${rownumber} =  Get the active row count
    should be true  ${rownumber}==0


Test the search of full auditoriums name
    [Documentation]  A teszt során egy létező nézőtér résznevére keresünk.
    [Tags]  most
    Reset on the auditorium page
    @{lista}=  Get the auditoriums name on the auditoriums page
    ${kivalasztott} =  Get random auditoriums name of the list  ${lista}
    Give the search value  ${kivalasztott}
    po_alt.Click the search button
    sleep  3s
    ${eredmeny} =  Get the auditoriums name on the auditoriums page
    Check result of full auditorium name search results  ${eredmeny}  ${kivalasztott}

Test the search of full Capital auditoriums name
    [Documentation]  A teszt során egy létező nézőtér résznevére keresünk.
    [Tags]  most
    Reset on the auditorium page
    @{lista}=  Get the auditoriums name on the auditoriums page
    ${kivalasztott2} =  Get random auditoriums name of the list  ${lista}
    ${kivalasztott} =  robot.libraries.String.convert to uppercase  ${kivalasztott2}
    Give the search value  ${kivalasztott}
    po_alt.Click the search button
    sleep  3s
    ${eredmeny} =  Get the auditoriums name on the auditoriums page
    Check result of full auditorium name search results  ${eredmeny}  ${kivalasztott2}

Test the search of subtring of auditoriums name
    [Documentation]  A teszt során egy létező nézőtér résznevére keresünk.
    [Tags]  most
    Reset on the auditorium page
    @{lista}=  Get the auditoriums name on the auditoriums page
    ${kivalasztott2} =  Get random auditoriums name of the list  ${lista}
    ${kivalasztott} =  Get random string of other string  ${kivalasztott2}
    Give the search value  ${kivalasztott}
    po_alt.Click the search button
    sleep  3s
    ${eredmeny} =  Get the auditoriums name on the auditoriums page
    check result when search of substring of auditorium name  ${eredmeny}  ${kivalasztott}

Test the search of captial subtring of auditoriums name
    [Documentation]  A teszt során egy létező nézőtér résznevére keresünk.
    [Tags]  most
    Reset on the auditorium page
    @{lista}=  Get the auditoriums name on the auditoriums page
    ${kivalasztott2} =  Get random auditoriums name of the list  ${lista}
    ${kivalasztott} =  Get random string of other string  ${kivalasztott2}
    ${kivalasztott3} =  robot.libraries.String.convert to uppercase  ${kivalasztott}
    Give the search value  ${kivalasztott3}
    po_alt.Click the search button
    sleep  3s
    ${eredmeny} =  Get the auditoriums name on the auditoriums page
    check result when search of substring of auditorium name  ${eredmeny}  ${kivalasztott}

Test the not existing venue on the auditoriums page
    [Documentation]  Teszt során egy nem létező venue névre keresünk.
    [Tags]  most
    Reset on the auditorium page
    ${kereses} =  set variable  Ilyen érték biztos hogy nincs felvéve
    ${ertek} =  get time in string
    Give the search value  ${kereses}${ertek}
    po_alt.Click the search button
    sleep  3s
    ${rownumber} =  Get the active row count
    should be true  ${rownumber}==0

Test the search of full venue name
    [Documentation]  A teszt során egy full venue nevére keresünk.
    [Tags]  most2
    Reset on the auditorium page
    @{lista}=  Get the venue name on the auditoriums page
    ${kivalasztott} =  Get random venue name of the list  ${lista}
    Give the search value  ${kivalasztott}
    log to console  ${kivalasztott}
    po_alt.Click the search button
    sleep  3s
    ${eredmeny} =  Get the venue name on the auditoriums page
    auditoriums_resource.Check result of full venue name search results  ${eredmeny}  ${kivalasztott}

Test the search of CAPITAL full venue name
    [Documentation]  A teszt során egy full venue nevére keresünk.
    [Tags]  most2
    Reset on the auditorium page
    @{lista}=  Get the venue name on the auditoriums page
    ${kivalasztott} =  Get random venue name of the list  ${lista}
    ${kivalasztott2} =  robot.libraries.String.convert to uppercase  ${kivalasztott}
    Give the search value  ${kivalasztott2}
    log to console  ${kivalasztott2}
    po_alt.Click the search button
    sleep  3s
    ${eredmeny} =  Get the venue name on the auditoriums page
    auditoriums_resource.Check result of full venue name search results  ${eredmeny}  ${kivalasztott}

Test the search of subtring of venue name
    [Documentation]  A teszt során egy venue nérészletére keresünk.
    [Tags]  most2
    Reset on the auditorium page
    @{lista}=  Get the venue name on the auditoriums page
    ${kivalasztott2} =  Get random venue name of the list  ${lista}
    ${kivalasztott} =  Get random string of other string  ${kivalasztott2}
    Give the search value  ${kivalasztott}
    po_alt.Click the search button
    sleep  3s
    ${eredmeny} =  Get the venue name on the auditoriums page
    auditoriums_resource.check result when search of substring of venue name  ${eredmeny}  ${kivalasztott}

Test the CAPITAL search of subtring of venue name
    [Documentation]  A teszt során egy venue nérészletére keresünk.
    [Tags]  most2
    Reset on the auditorium page
    @{lista}=  Get the venue name on the auditoriums page
    ${kivalasztott2} =  Get random venue name of the list  ${lista}
    ${kivalasztott} =  Get random string of other string  ${kivalasztott2}
    ${kivalasztott3} =  robot.libraries.String.convert to uppercase  ${kivalasztott}
    Give the search value  ${kivalasztott3}
    po_alt.Click the search button
    sleep  3s
    ${eredmeny} =  Get the venue name on the auditoriums page
    auditoriums_resource.check result when search of substring of venue name  ${eredmeny}  ${kivalasztott}

Test the reset button and table
    [Documentation]  A teszt soránt azt nézzük meg, hogy a reset button
                ...  gomb megnyomása visszaállítja-e a táblázatot alaphelyzetbe.
    [Tags]  Most2
    Reset on the auditorium page
    ${original_rownumber} =  Get the active row count
    ${kereses} =  set variable  Ilyen érték biztos hogy nincs felvéve
    ${ertek} =  get time in string
    Give the search value  ${kereses}${ertek}
    po_alt.Click the search button
    sleep  3s
    ${rownumber} =  Get the active row count
    Reset on the auditorium page
    ${new_rownumber} =  Get the active row count
    should be equal  ${original_rownumber}   ${new_rownumber}

Test the reset button and showe deleted auditoriums checkbox
    [Documentation]  A teszt során azt nézzük meg, hogy törölt nézőterek mutatása checkbox-ot
                ...  alaphelyzetbe állítja-e a visszaállít gombt
    [Tags]  Most2
    Reset on the auditorium page
    Check the checkbox is not select on th auditorium page
    Click the show deleted checkbox
    Check the checkbox is select on th auditorium page
    po_alt.Click the search button
    sleep  3s
    Check the checkbox is select on th auditorium page
    Reset on the auditorium page
    Check the checkbox is not select on th auditorium page

Test the search input field with reset button
    [Documentation]  A teszt során azt nézzük meg, hogy a visszaállít gomb
                ...  üres helyzetbe állítja-e a kereső mezőt.
    [Tags]  most2
    Reset on the auditorium page
    Give the search value  valami
    sleep  1s
    Check the search input value on the audtioriums page  valami
    Reset on the auditorium page
    Check the search input value is empty on the auditoriums page

test2
    [Tags]  most3
    Give the search value  valamissssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssqwqwqwqwqwqwqwqwqq
    click element  //mat-header-cell[3]
    sleep  3s
    Check error message appear on the page  xpath=//label  0  Please enter no more than 127 characters

*** Keywords ***



