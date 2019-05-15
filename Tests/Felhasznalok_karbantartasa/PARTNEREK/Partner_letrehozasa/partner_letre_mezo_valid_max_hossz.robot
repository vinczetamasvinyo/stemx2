*** Settings ***
Documentation  A suite azokat az teszteseteket tartalmazza amely során
          ...  a max értékeket írjuk be a mezőkbe és megnézzük, hogyy a max
          ...  hosszra vonatkozó hibaüzenet nem jelenik meg.

Resource  ../../../../Resources/partner_letre_mezo_valid_resource.robot
Suite Setup  Login and go to the new partner page and give all data  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}  ${ADAT_TOOlONG}
#Suite Setup  Login and go new partner page and give data and change language  ${OLDAL_URL}  ${bogeszo}  ${box_office1_email_ok}  ${box_office1_password_ok}  ${ADAT_TOOlONG}
Suite Teardown  Common.End web test

*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}  language=${NYELV}
${NYELV} =  Hun
${LONG} =  ddddddddddddddddddddwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwdwwwwwwwwwwwwwwwwwwwwwwqqqqqqqqqqqqqqqqqqqqqqqqqqqqdddddd
${Max_LONG} =  ddddddddddddddddddddwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwqqqqqqqqqqqqqqqqqqqqqqqqqqqqdddddddd
${Max_ZIPCODE_LONG} =  ddddddddddddddddddddwwwDDDDDDDD
${Max_ZIPCODE_TOO_LONG} =  ddddddddddddddddddddwwwDDDDDDDDD
${Max_COUNTY_LONG} =  lldslslsllslslllllllllllllllllllslslslslllsllllllllllllllllllll
${Max_COUNTY_TOO_LONG} =  lldslslsllslslllllllllllllllllllslslslslllslllllllllllllllllllll
${Max_10_LONG} =  llslslslls
${Max_10_TOO_LONG} =  llslslsllss
${Max_30_LONG} =  llslslsllssdsdsdssssssssssssss
${Max_30_TOO_LONG} =  llslslsllssdsdsdsssssssssssssss
${MAX_PHONE_LONG} =  +363096036280000
${SHORT_NORMAL} =  k
${LETTER_VALIDATOR_GOOD} =  azAz áéíóúűöő-.
${LETTER_VALIDATOR_NUMBER_WRONG} =  ${LETTER_VALIDATOR_GOOD}1
${LETTER_VALIDATOR_OTHER_WRONG} =  ${LETTER_VALIDATOR_GOOD}$
${NORMAL} =  normal
${EMAIL_MAX_LONG} =  ddddddddddddddddddddwwwwwwwwwwwwwwwwwwww@wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq.com
${EMAIL_TOO_LONG} =  ddddddddddddddddddddwwwwwwwwwwwwwwwwwwww@wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq.com
&{Dfirstname}  Required=Y  Value=${Max_LONG}
&{DLastname}  Required=Y  Value=${Max_LONG}
&{DEmail}  Required=Y  Value=${EMAIL_TOO_LONG}
&{DCompanyname}  Required=Y  Value=${Max_LONG}
&{Companylongname}  Required=Y   Value=${Max_LONG}
&{Companyregnumber}  Required=Y   Value=${Max_LONG}
&{Companycountry}  Required=Y  Value=Magyarország
&{Companyzipcode}  Required=Y  Value=${Max_ZIPCODE_TOO_LONG}
&{Companycity}  Required=Y  Value=${Max_LONG}

&{ADAT_TOOlONG}  Firstname=${LONG}
            ...  Lastname=${LONG}
            ...  Email=${EMAIL_MAX_LONG}
            ...  Companyname=${LONG}
            ...  Companylongname=${LONG}
            ...  Companyregnumber=${LONG}
            ...  Companycountry=Magyarország
            ...  Companyzipcode=${Max_ZIPCODE_LONG}
            ...  Companycity=${LONG}
            ...  Companycounty=${Max_COUNTY_LONG}
            ...  Companystreet=${LONG}
            ...  Companyhousenumber=${Max_30_LONG}
            ...  Companydoor=${Max_10_LONG}
            ...  Companyfloor=${Max_30_LONG}
            ...  Billingname=${LONG}
            ...  Taxnumber=${LONG}
            ...  Bankname=${LONG}
            ...  Banknumber=${LONG}
            ...  Iban=${LONG}
            ...  Swift=${LONG}
            ...  Billingcountry=Magyarország
            ...  Billingzipcode=${Max_ZIPCODE_LONG}
            ...  Billingcity=${LONG}
            ...  Billingcounty=${Max_COUNTY_LONG}
            ...  Billingstreet=${LONG}
            ...  Billinghousenumber=${Max_30_LONG}
            ...  Billingdoor=${Max_10_LONG}
            ...  Billingfloor=${Max_30_LONG}
            ...  Contactfirstname=${LONG}
            ...  Contactlastname=${LONG}
            ...  Contactphonenumber=${MAX_PHONE_LONG}
            ...  Contactemail=${EMAIL_MAX_LONG}
            ...  Jobdesctiption=${LONG}

*** Test Cases ***
Test firstname max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a keresztnévbe
                ...  beírunk 127 karaktert és a hosszra vonatkozó hibaüzenet
                ...  nem jeleik meg.
    [Tags]  Medium  maxx  most
    ${firstname} =  Get firstname div object of partnerinfo
    Check the div object contains the error message  ${firstname}

Test the lastname max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a vezetéknévbe
                ...  beírunk 127 karaktert és a hosszra vonatkozó hibaüzenet
                ...  nem jeleik meg.
    [Tags]  Medium  maxx
    ${lastname} =  Get lastname div object of partnerinfo
    Check the div object contains the error message  ${lastname}

Test the email max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy az email-be
                ...  beírunk 127 karaktert és a hosszra vonatkozó hibaüzenet
                ...  nem jeleik meg.
    [Tags]  Medium  maxx
    ${email} =  Get email div object of partnerinfo
    Check the div object contains the error message  ${email}

Test the company name max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a cégnévbe
                ...  beírunk 127 karaktert és a hosszra vonatkozó hibaüzenet
                ...  nem jeleik meg.
    [Tags]  Medium  maxx
    ${companyname} =  Get companynev div object of companyinfo
    Check the div object contains the error message  ${companyname}

Test the company longname max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a hosszú cégnévbe
                ...  beírunk 127 karaktert és a hosszra vonatkozó hibaüzenet
                ...  nem jeleik meg.
    [Tags]  Medium  maxx
    ${companylongname} =  get company lognev div object of companyinfo
    Check the div object contains the error message  ${companylongname}

Test the company regnumber max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a hosszú cégnévbe
                ...  beírunk 127 karaktert és a hosszra vonatkozó hibaüzenet
                ...  nem jeleik meg.
    [Tags]  Medium  maxx
    ${companyregnumber} =  get company regnumber div object of companyinfo
    Check the div object contains the error message  ${companyregnumber}

Test the company country max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a céghez országba
                ...  kiválasztunk egy értéket és a hibaüzenet
                ...  NEM jelenik meg.
    [Tags]  Medium  maxx
    ${companycounty} =  get company country div object of companyinfo
    Check the div object contains the error message  ${companycounty}

Test the company zipcode max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy az irányítószámba
                ...  beírunk 31 karaktert és a hosszra vonatkozó hibaüzenet
                ...  nem jeleik meg.
    [Tags]  Medium  maxx
    ${companyzipcode} =  get company zipcode div object of companyinfo
    Check the div object contains the error message  ${companyzipcode}

Test the company city max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a városba
                ...  beírunk 127 karaktert és a hosszra vonatkozó hibaüzenet
                ...  nem jeleik meg.
    [Tags]  Medium  maxx
    ${companycity} =  get company city div object of companyinfo
    Check the div object contains the error message  ${companycity}

Test the company county max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a városba
                ...  beírunk 63 karaktert és a hosszra vonatkozó hibaüzenet
                ...  nem jeleik meg.
    [Tags]  Medium  maxx
    ${companycounty} =  get company county div object of companyinfo
    Check the div object contains the error message  ${companycounty}

Test the company street max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy az utcába
                ...  beírunk 127 karaktert és a hosszra vonatkozó hibaüzenet
                ...  nem jeleik meg.
    [Tags]  Medium  maxx
    ${companystreet} =  get company street div object of companyinfo
    Check the div object contains the error message  ${companystreet}

Test the company housenumber max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a házszámba
                ...  beírunk 30 karaktert és a hosszra vonatkozó hibaüzenet
                ...  nem jeleik meg.
    [Tags]  Medium  maxx
    ${companyhousenumber} =  get company housenumber div object of companyinfo
    Check the div object contains the error message  ${companyhousenumber}

Test the company door max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy az ajtóba
                ...  beírunk 10 karaktert és a hosszra vonatkozó hibaüzenet
                ...  nem jeleik meg.
    [Tags]  Medium  maxx
    ${companydoor} =  get company door div object of companyinfo
    Check the div object contains the error message  ${companydoor}

Test the company floor max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy az emeletbe
                ...  beírunk 31 karaktert és a hosszra vonatkozó hibaüzenet
                ...  nem jeleik meg.
    [Tags]  Medium  maxx
    ${companyfloor} =  get company floor div object of companyinfo
    Check the div object contains the error message  ${companyfloor}

Test the billingname max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázási
                ...  cégnév részbe 1127 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet nem jelenik meg.
    [Tags]  Medium  maxx
    ${companybillingname} =  get name div object of billinginfo
    Check the div object contains the error message  ${companybillingname}

Test the billingvatnumber max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázási
                ...  adószám részbe 127 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet nem jelenik meg.
    [Tags]  Medium  maxx
    ${companytaxnumber} =  get taxnumber div object of billinginfo
    Check the div object contains the error message  ${companytaxnumber}

Test the billingbankname max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázási
                ...  részben a banknévbe 127 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet nem jelenik meg.
    [Tags]  Medium  maxx
    ${bankname} =  get bankname div object of billinginfo
    Check the div object contains the error message  ${bankname}

Test the billingbanknumber max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázási
                ...  részben a bankszámlaszámhoz 127 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet nem jelenik meg.
    [Tags]  Medium  maxx
    ${banknumber} =  get banknumber div object of billinginfo
    Check the div object contains the error message  ${banknumber}

Test the billingiban max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázási
                ...  részben az iban-hoz 127 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet nem jelenik meg.
    [Tags]  Medium  maxx
    ${iban} =  get iban div object of billinginfo
    Check the div object contains the error message  ${iban}

Test the billingswift max+ karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázási
                ...  részben az swift-hez 127 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet nem jelenik meg.
    [Tags]  Medium  maxx
    ${swift} =  get swift div object of billinginfo
    Check the div object contains the error message  ${swift}

Test the billingcountry max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázási
                ...  részben az országhoz kiválasztunk valamit és a hosszra vonatkozó
                ...  hibaüzenet nem jelenik meg.
    [Tags]  Medium  maxx
    ${billingcountry} =  get country div object of billinginfo
    Check the div object contains the error message  ${billingcountry}

Test the billingzipcode max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázáshoz tartozó
                ...  irányítószámába 31 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet nem jelenik meg.
    [Tags]  Medium  maxx
    ${billingzipcode} =  get zipcode div object of billinginfo
    Check the div object contains the error message  ${billingzipcode}

Test the billingcity max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázáshoz tartozó
                ...  városba 127 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet nem jelenik meg
    [Tags]  Medium  maxx
    ${billingcity} =  get city div object of billinginfo
    Check the div object contains the error message  ${billingcity}

Test the billing county max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a céghez tartozó
                ...  megyébe 63 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet nem jelenik meg.
    [Tags]  Medium  maxx
    ${billingcounty} =  get county div object of billinginfo
    Check the div object contains the error message  ${billingcounty}

Test the billing street max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázáshoz tartozó
                ...  utca részbe 127 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet nem jelenik meg.
    [Tags]  Medium  maxx
    ${billingstreet} =  get street div object of billinginfo
    Check the div object contains the error message  ${billingstreet}

Test the billing housenumber max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázáshoz tartozó
                ...  házszám részbe 31 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet nem jelenik meg.
    [Tags]  Medium  maxx
    ${billinghousenumber} =  get housenumber div object of billinginfo
    Check the div object contains the error message  ${billinghousenumber}

Test the billing door max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázhoz tartozó
                ...  ajtó részbe 10 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet nem jelenik meg.
    [Tags]  Medium  maxx
    ${billingdoor} =  get door div object of billinginfo
    Check the div object contains the error message  ${billingdoor}

Test the billing floor max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázáshoz tartozó
                ...  emelet részbe 31 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet nem jelenik meg.
    [Tags]  Medium  maxx
    ${billingfloor} =  get floor div object of billinginfo
    Check the div object contains the error message  ${billingfloor}

Test contact firstname max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a elérhetőségi
                ...  keresztnévbe beírunk a 127 karaktert és az erre
                ...  vonatkozó hibaüzenet nem jelenik meg.
    [Tags]  Medium  maxx
    ${contactfirstname} =  Get firstname div object of contact
    Check the div object contains the error message  ${contactfirstname}

Test the contact lastname max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy az elérhetőségi vezetéknévbe
                ...  beírunk 127 karaktert és a hosszra vonatkozó hibaüzenet
                ...  nem jelenik meg.
    [Tags]  Medium  maxx
    ${contactlastname} =  Get lastname div object of contact
    Check the div object contains the error message  ${contactlastname}

Test the contact phone max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy az elérhetőségi telefonszámba
                ...  beírunk 15 karaktert és a hosszra vonatkozó hibaüenet nem
                ...  nem jelenik meg.
    [Tags]  Medium  maxx
    ${contactphonenumber} =  Get phone div object of contact
    Check the div object contains the error message  ${contactphonenumber}

Test the contact email max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a contact email címbe beírunk
                ...  egy 127 karaktert és az erre vonatkozó hibaüzenet
                ...  nem jelenik meg.
    [Tags]  Medium  maxx
    ${contactemail} =  Get email div object of contact
    Check the div object contains the error message  ${contactemail}

Test the jobdescription max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a munkakörbe
                ...  127 karaktert írunk és a hosszra vonatkozó hibaüzenet
                ...  nem jelenik meg.
    [Tags]  Medium  maxx
    ${jobdescription} =  get jobdescription div object of contact
    Check the div object contains the error message  ${jobdescription}


*** Keywords ***
