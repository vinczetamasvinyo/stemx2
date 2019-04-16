*** Settings ***
Resource  ../../../Resources/partner_letre_mezo_valid_resource.robot


Suite Setup  Login and go new partner page and give data and change language  ${OLDAL_URL}  ${bogeszo}  ${box_office1_email_ok}  ${box_office1_password_ok}  ${ADAT_TOOlONG}
Suite Teardown  Common.End web test

*** Variables ***
${NYELV} =  En
${LONG} =  ddddddddddddddddddddwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwdwwwwwwwwwwwwwwwwwwwwwwqqqqqqqqqqqqqqqqqqqqqqqqqqqqdddddd
${Max_LONG} =  ddddddddddddddddddddwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwqqqqqqqqqqqqqqqqqqqqqqqqqqqqdddddddd
${Max_ZIPCODE_TOO_LONG} =  ddddddddddddddddddddwwwDDDDDDDDD
${Max_COUNTY_TOO_LONG} =  lldslslsllslslllllllllllllllllllslslslslllslllllllllllllllllllll
${Max_10_TOO_LONG} =  llslslsllss
${Max_30_TOO_LONG} =  llslslsllssdsdsdsssssssssssssss
${MAX_PHONE_LONG} =  +3630960362800000
${SHORT_NORMAL} =  k
${LETTER_VALIDATOR_GOOD} =  azAz áéíóúűöő-.
${LETTER_VALIDATOR_NUMBER_WRONG} =  ${LETTER_VALIDATOR_GOOD}1
${LETTER_VALIDATOR_OTHER_WRONG} =  ${LETTER_VALIDATOR_GOOD}$
${NORMAL} =  normal
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

&{ADAT_TOOlONG}  Firstname=${Max_LONG}
            ...  Lastname=${Max_LONG}
            ...  Email=${EMAIL_TOO_LONG}
            ...  Companyname=${Max_LONG}
            ...  Companylongname=${Max_LONG}
            ...  Companyregnumber=${Max_LONG}
            ...  Companycountry=Hungary
            ...  Companyzipcode=${Max_ZIPCODE_TOO_LONG}
            ...  Companycity=${Max_LONG}
            ...  Companycounty=${Max_COUNTY_TOO_LONG}
            ...  Companystreet=${Max_LONG}
            ...  Companyhousenumber=${Max_30_TOO_LONG}
            ...  Companydoor=${Max_10_TOO_LONG}
            ...  Companyfloor=${Max_30_TOO_LONG}
            ...  Billingname=${Max_LONG}
            ...  Taxnumber=${Max_LONG}
            ...  Bankname=${Max_LONG}
            ...  Banknumber=${Max_LONG}
            ...  Iban=${Max_LONG}
            ...  Swift=${Max_LONG}
            ...  Billingcountry=Hungary
            ...  Billingzipcode=${Max_ZIPCODE_TOO_LONG}
            ...  Billingcity=${Max_LONG}
            ...  Billingcounty=${Max_COUNTY_TOO_LONG}
            ...  Billingstreet=${Max_LONG}
            ...  Billinghousenumber=${Max_30_TOO_LONG}
            ...  Billingdoor=${Max_10_TOO_LONG}
            ...  Billingfloor=${Max_30_TOO_LONG}
            ...  Contactfirstname=${Max_LONG}
            ...  Contactlastname=${Max_LONG}
            ...  Contactphonenumber=${MAX_PHONE_LONG}
            ...  Contactemail=${EMAIL_TOO_LONG}
            ...  Jobdesctiption=${Max_LONG}

*** Test Cases ***
Test firstname max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a keresztnévbe beírunk a maxnál 1-el nagyobb
                ...  karaktert és az erre vonatkozó hibaüzenet megjelenik.
    [Tags]  Medium  maxx
    #Common_resource.Reload the page
    ${firstname} =  Get firstname div object of partnerinfo
    #Check the div object contains the error message  ${firstname}
    #Give the max128 data   ${ADAT_TOOlONG}  valami  valami2
    #Give the firstname and lastname  ${ADAT}[Firstname]  ${NORMAL}
    Check the error message appear and the error text value  ${firstname}  ${MAX_KARAKTER_127.${NYELV}}

Test the lastname max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a vezetéknévbe beírunk a maxnál 1-el nagyobb
                ...  karaktert és az erre vonatkozó hibaüzenet megjelenik.
    [Tags]  Medium  maxx
    #Common_resource.Reload the page
    ${lastname} =  Get lastname div object of partnerinfo
    #Check the div object contains the error message  ${firstname}
    #Give the lastname and firstname  ${Max_LONG}  ${NORMAL}
    Check the error message appear and the error text value  ${lastname}  ${MAX_KARAKTER_127.${NYELV}}

Test the email max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a meghívásos email címbe
                ...  beírunk a maxnál 1-el nagyobb karaktert és az erre vonatkozó
                ...  hibaüzenet megjelenik.
    [Tags]  Medium  maxx
    #Common_resource.Reload the page
    ${email} =  Get email div object of partnerinfo
    #Check the div object contains the error message  ${firstname}
    #Give the lastname and firstname  ${Max_LONG}  ${NORMAL}
    Check the error message appear and the error text value  ${email}  ${MAX_KARAKTER_127.${NYELV}}

Test the company name max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a cégnévbe
                ...  beírunk a maxnál 1-el nagyobb karaktert és az erre
                ...  vonatkozó hibaüzenet megjelenik.
    [Tags]  Medium  maxx
    ${companyname} =  Get companynev div object of companyinfo
    Check the error message appear and the error text value  ${companyname}  ${MAX_KARAKTER_127.${NYELV}}

Test the company longname max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a cég hosszabb nevébe
                ...  beírunk a maxnál 1-el nagyobb karaktert és az erre
                ...  vonatkozó hibaüzenet megjelenik.
    [Tags]  Medium  maxx
    ${companylongname} =  get company lognev div object of companyinfo
    Check the error message appear and the error text value  ${companylongname}  ${MAX_KARAKTER_127.${NYELV}}

Test the company regnumber max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a cégjegyzékszámba
                ...  beírunk a egy hosszú akraktert és az erre vonatkozó
                ...  hibaüzenet NEM jelenik meg.
    [Tags]  Medium  maxx
    ${companylongname} =  get company regnumber div object of companyinfo
    Check the div object contains the error message  ${companylongname}

Test the company country max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a céghez országba
                ...  kiválasztunk egy értéket és a hibaüzenet
                ...  NEM jelenik meg.
    [Tags]  Medium  maxx
    ${companycounty} =  get company country div object of companyinfo
    Check the div object contains the error message  ${companycounty}

Test the company zipcode max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a céghez tartozó
                ...  irányítószámába 32 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet megjelenik.
    [Tags]  Medium  maxx
    ${companyzipcode} =  get company zipcode div object of companyinfo
    Check the error message appear and the error text value  ${companyzipcode}  ${ERROR_MAX_ZIPCODE_KARAKTER.${NYELV}}

Test the company city max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a céghez tartozó
                ...  városba 128 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet megjelenik.
    [Tags]  Medium  maxx
    ${companycity} =  get company city div object of companyinfo
    Check the error message appear and the error text value  ${companycity}   ${MAX_KARAKTER_127.${NYELV}}

Test the company county max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a céghez tartozó
                ...  megyébe 64 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet megjelenik.
    [Tags]  Medium  maxx
    ${companycounty} =  get company county div object of companyinfo
    Check the error message appear and the error text value  ${companycounty}  ${ERROR_MAX_63_KARAKTER.${NYELV}}

Test the company street max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a céghez tartozó
                ...  utca részbe 128 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet megjelenik.
    [Tags]  Medium  maxx
    ${companystreet} =  get company street div object of companyinfo
    Check the error message appear and the error text value  ${companystreet}  ${MAX_KARAKTER_127.${NYELV}}

Test the company housenumber max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a céghez tartozó
                ...  házszám részbe 31 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet megjelenik.
    [Tags]  Medium  maxx
    ${companystreet} =  get company housenumber div object of companyinfo
    Check the error message appear and the error text value  ${companystreet}  ${ERROR_MAX_30_KARAKTER.${NYELV}}

Test the company door max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a céghez tartozó
                ...  ajtó részbe 11 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet megjelenik.
    [Tags]  Medium  maxx
    ${companydoor} =  get company door div object of companyinfo
    Check the error message appear and the error text value  ${companydoor}  ${ERROR_MAX_10_KARAKTER.${NYELV}}

Test the company floor max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a céghez tartozó
                ...  emelet részbe 31 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet megjelenik.
    [Tags]  Medium  maxx
    ${companyfloor} =  get company floor div object of companyinfo
    Check the error message appear and the error text value  ${companyfloor}  ${ERROR_MAX_30_KARAKTER.${NYELV}}

Test the billingname max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázási
                ...  cégnév részbe 128 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet megjelenik.
    [Tags]  Medium  maxx
    ${companybillingname} =  get name div object of billinginfo
    Check the error message appear and the error text value  ${companybillingname}  ${MAX_KARAKTER_127.${NYELV}}

Test the billingvatnumber max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázási
                ...  adószám részbe 128 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet nem jelenik meg.
    [Tags]  Medium  maxx
    ${companytaxnumber} =  get taxnumber div object of billinginfo
    Check the div object contains the error message  ${companytaxnumber}

Test the billingbankname max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázási
                ...  részben a banknévbe 128 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet megjelenik.
    [Tags]  Medium  maxx
    ${bankname} =  get bankname div object of billinginfo
    Check the error message appear and the error text value  ${bankname}  ${MAX_KARAKTER_127.${NYELV}}

Test the billingbanknumber max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázási
                ...  részben a bankszámlaszámhoz 128 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet nem jelenik meg.
    [Tags]  Medium  maxx
    ${banknumber} =  get banknumber div object of billinginfo
    Check the div object contains the error message  ${banknumber}

Test the billingiban max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázási
                ...  részben az iban-hoz 128 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet nem jelenik meg.
    [Tags]  Medium  maxx
    ${iban} =  get iban div object of billinginfo
    Check the div object contains the error message  ${iban}

Test the billingswift max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázási
                ...  részben az swift-hez 128 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet nem jelenik meg.
    [Tags]  Medium  maxx
    ${swift} =  get swift div object of billinginfo
    Check the div object contains the error message  ${swift}

Test the billingcountry max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázási
                ...  részben az országhoz kiválasztunk valamit és a hosszra vonatkozó
                ...  hibaüzenet nem jelenik meg.
    [Tags]  Medium  maxx
    ${billingcountry} =  get country div object of billinginfo
    Check the div object contains the error message  ${billingcountry}

Test the billingzipcode max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázáshoz tartozó
                ...  irányítószámába 32 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet megjelenik.
    [Tags]  Medium  maxx
    ${billingzipcode} =  get zipcode div object of billinginfo
    Check the error message appear and the error text value  ${billingzipcode}  ${ERROR_MAX_ZIPCODE_KARAKTER.${NYELV}}

Test the billingcity max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázáshoz tartozó
                ...  városba 128 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet megjelenik.
    [Tags]  Medium  maxx
    ${billingcity} =  get city div object of billinginfo
    Check the error message appear and the error text value  ${billingcity}   ${MAX_KARAKTER_127.${NYELV}}

Test the billing county max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a céghez tartozó
                ...  megyébe 64 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet megjelenik.
    [Tags]  Medium  maxx
    ${billingcounty} =  get county div object of billinginfo
    Check the error message appear and the error text value  ${billingcounty}  ${ERROR_MAX_63_KARAKTER.${NYELV}}

Test the billing street max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázáshoz tartozó
                ...  utca részbe 128 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet megjelenik.
    [Tags]  Medium  maxx
    ${billingstreet} =  get street div object of billinginfo
    Check the error message appear and the error text value  ${billingstreet}  ${MAX_KARAKTER_127.${NYELV}}

Test the billing housenumber max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázáshoz tartozó
                ...  házszám részbe 31 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet megjelenik.
    [Tags]  Medium  maxx
    ${billinghousenumber} =  get housenumber div object of billinginfo
    Check the error message appear and the error text value  ${billinghousenumber}  ${ERROR_MAX_30_KARAKTER.${NYELV}}

Test the billing door max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázhoz tartozó
                ...  ajtó részbe 11 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet megjelenik.
    [Tags]  Medium  maxx
    ${billingdoor} =  get door div object of billinginfo
    Check the error message appear and the error text value  ${billingdoor}  ${ERROR_MAX_10_KARAKTER.${NYELV}}

Test the billing floor max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázáshoz tartozó
                ...  emelet részbe 31 karaktert írunk és ez erre vonatkozó
                ...  hibaüzenet megjelenik.
    [Tags]  Medium  maxx
    ${billingfloor} =  get floor div object of billinginfo
    Check the error message appear and the error text value  ${billingfloor}  ${ERROR_MAX_30_KARAKTER.${NYELV}}

Test contact firstname max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a elérhetőség keresztnévbe
                ...  beírunk a 128 karaktert és az erre vonatkozó hibaüzenet megjelenik.
    [Tags]  Medium  maxx
    ${contactfirstname} =  Get firstname div object of contact
    Check the error message appear and the error text value  ${contactfirstname}  ${MAX_KARAKTER_127.${NYELV}}

Test the contact lastname max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy az elérhetőségi vezetéknévbe
                ...  beírunk 128 karaktert és az erre vonatkozó hibaüzenet megjelenik.
    [Tags]  Medium  maxx
    ${contactlastname} =  Get lastname div object of contact
    Check the error message appear and the error text value  ${contactlastname}  ${MAX_KARAKTER_127.${NYELV}}

Test the contact phone max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy az elérhetőségi telefonszámba
                ...  beírunk 16 karaktert és az erre vonatkozó hibaüzenet megjelenik.
    [Tags]  Medium  maxx
    ${contactphonenumber} =  Get phone div object of contact
    Check the error message appear and the error text value  ${contactphonenumber}  ${ERRORS_PHONE_VALIDATOR.${NYELV}}

Test the contact email max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a contact email címbe beírunk
                ...  egy 128 karaktert és az erre vonatkozó hibaüzenet megjelenik.
    [Tags]  Medium  maxx
    ${contactemail} =  Get email div object of contact
    Check the error message appear and the error text value  ${contactemail}  ${MAX_KARAKTER_127.${NYELV}}

Test the jobdescription max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a munkakörbe
                ...  128 karaktert írunk és ez erre vonatkozó hibaüzenet nem jelenik meg.
    [Tags]  Medium  maxx
    ${jobdescription} =  get jobdescription div object of contact
    Check the error message appear and the error text value  ${jobdescription}  ${MAX_KARAKTER_127.${NYELV}}


*** Keywords ***
