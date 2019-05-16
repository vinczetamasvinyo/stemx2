*** Settings ***
Documentation  A teszt suite azokat a teszteseteket tartalmazza, hogy a venue lista oldalon
          ...  minden elem megfelelően jelenik-e meg.

Resource  ../../../../Resources/eloadohelyek_resource.robot

Suite Setup  Open browser and login and after go to the venues page  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
Suite Teardown  Common.End web test

*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}  language=${LAN}
${LAN}=  Hun

*** Test Cases ***
Test the not existing value on the venues page
    [Tags]  most
    Reset on the venue page
    ${kereses} =  set variable  Ilyen érték biztos hogy nincs felvéve
    ${ertek} =  get time in string
    Give the search value  ${kereses}${ertek}
    po_alt.Click the search button
    sleep  3s
    ${rownumber} =  Get the active row count
    should be true  ${rownumber}==0

Test the search of full venues name
    [Documentation]  A teszt során egy létező nézőtér résznevére keresünk.
    [Tags]  most
    Reset on the venue page
    @{lista}=  Get the venues name on the venues page
    ${kivalasztott} =  Get random venues name of the list  ${lista}
    Give the search value  ${kivalasztott}
    po_alt.Click the search button
    sleep  3s
    ${eredmeny} =  Get the venues name on the venues page
    Check result of full venue name search results  ${eredmeny}  ${kivalasztott}

Test the search of full Capital venues name
    [Documentation]  A teszt során egy létező nézőtér résznevére keresünk.
    ...  Nagybetűsen adjuk meg a nézőtér nevét
    [Tags]  most
    Reset on the venue page
    @{lista}=  Get the venues name on the venues page
    ${kivalasztott2} =  Get random venues name of the list  ${lista}
    ${kivalasztott} =  robot.libraries.String.convert to uppercase  ${kivalasztott2}
    Give the search value  ${kivalasztott}
    po_alt.Click the search button
    sleep  3s
    ${eredmeny} =  Get the venues name on the venues page
    Check result of full venue name search results  ${eredmeny}  ${kivalasztott2}

Test the search of subtring of venues name
    [Documentation]  A teszt során egy létező nézőtér résznevére keresünk.
    [Tags]  most
    Reset on the venue page
    @{lista}=  Get the venues name on the venues page
    ${kivalasztott2} =  Get random venues name of the list  ${lista}
    ${kivalasztott} =  Get random string of other string  ${kivalasztott2}
    Give the search value  ${kivalasztott}
    po_alt.Click the search button
    sleep  3s
    ${eredmeny} =  Get the venues name on the venues page
    check result when search of substring of venue name  ${eredmeny}  ${kivalasztott}

Test the search of captial subtring of venues name
    [Documentation]  A teszt során egy létező nézőtér résznevére keresünk.
    [Tags]  most2
    Reset on the venue page
    @{lista}=  Get the venues name on the venues page
    ${kivalasztott2} =  Get random venues name of the list  ${lista}
    ${kivalasztott} =  Get random string of other string  ${kivalasztott2}
    ${kivalasztott3} =  robot.libraries.String.convert to uppercase  ${kivalasztott}
    Give the search value  ${kivalasztott3}
    po_alt.Click the search button
    sleep  3s
    ${eredmeny} =  Get the venues name on the venues page
    check result when search of substring of venue name  ${eredmeny}  ${kivalasztott}