*** Settings ***
Documentation  A suite azokat az teszteseteket tartalmazza amely során
          ...  a minimum értékeket írunk be a mezőkbe és megnézzük, hogy ilyenkor
          ...  a hosszra vonatkozó hibaüzenet nem jelenik meg.

Resource  ../../../Resources/partner_letre_mezo_valid_resource.robot
Suite Setup  Login and go to the new partner page and give all data  ${OLDAL_URL}  ${bogeszo}  ${box_office1_email_ok}  ${box_office1_password_ok}  ${ADAT_TOOlONG}
Suite Teardown  Common.End web test

*** Variables ***
${NYELV} =  Hun
${MIN_LONG} =  d
${MIN_PHONE_LONG} =   +3630960362
${EMAIL_MIN_LONG} =  d@d.hu

&{ADAT_TOOlONG}  Firstname=${MIN_LONG}
            ...  Lastname=${MIN_LONG}
            ...  Email=${EMAIL_MIN_LONG}
            ...  Companyname=${MIN_LONG}
            ...  Companylongname=${MIN_LONG}
            ...  Companyregnumber=${MIN_LONG}
            ...  Companycountry=Magyarország
            ...  Companyzipcode=${MIN_LONG}
            ...  Companycity=${MIN_LONG}
            ...  Companycounty=${MIN_LONG}
            ...  Companystreet=${MIN_LONG}
            ...  Companyhousenumber=${MIN_LONG}
            ...  Companydoor=${MIN_LONG}
            ...  Companyfloor=${MIN_LONG}
            ...  Billingname=${MIN_LONG}
            ...  Taxnumber=${MIN_LONG}
            ...  Bankname=${MIN_LONG}
            ...  Banknumber=${MIN_LONG}
            ...  Iban=${MIN_LONG}
            ...  Swift=${MIN_LONG}
            ...  Billingcountry=Magyarország
            ...  Billingzipcode=${MIN_LONG}
            ...  Billingcity=${MIN_LONG}
            ...  Billingcounty=${MIN_LONG}
            ...  Billingstreet=${MIN_LONG}
            ...  Billinghousenumber=${MIN_LONG}
            ...  Billingdoor=${MIN_LONG}
            ...  Billingfloor=${MIN_LONG}
            ...  Contactfirstname=${MIN_LONG}
            ...  Contactlastname=${MIN_LONG}
            ...  Contactphonenumber=${MIN_PHONE_LONG}
            ...  Contactemail=${EMAIL_MIN_LONG}
            ...  Jobdesctiption=${MIN_LONG}

*** Test Cases ***
Test firstname min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a keresztnévbe
                ...  beírunk minimum(1db karakter) karaktert és a hosszra
                ...  vonatkozó hibaüzenet nem jeleik meg.
    [Tags]  Medium
    ${firstname} =  Get firstname div object of partnerinfo
    Check the div object contains the error message  ${firstname}

Test the lastname min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a vezetéknévbe
                ...  beírunk minimum(1db karakter) karaktert és a hosszra
                ...  vonatkozó hibaüzenet nem jeleik meg.
    [Tags]  Medium
    ${lastname} =  Get lastname div object of partnerinfo
    Check the div object contains the error message  ${lastname}

Test the email min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy az email-be
                ...  beírunk minimum(1db karakter) karaktert és a hosszra vonatkozó
                ...  hibaüzenet nem jeleik meg.
    [Tags]  Medium
    ${email} =  Get email div object of partnerinfo
    Check the div object contains the error message  ${email}

Test the company name min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a cégnévbe
                ...  beírunk minimum(1db karakter) karaktert és a hosszra
                ...  vonatkozó hibaüzenet nem jeleik meg.
    [Tags]  Medium
    ${companyname} =  Get companynev div object of companyinfo
    Check the div object contains the error message  ${companyname}

Test the company longname min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a hosszú cégnévbe
                ...  beírunk minimum(1db karakter) karaktert és a hosszra
                ...  vonatkozó hibaüzenet nem jeleik meg.
    [Tags]  Medium
    ${companylongname} =  get company lognev div object of companyinfo
    Check the div object contains the error message  ${companylongname}

Test the company regnumber min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a hosszú cégnévbe
                ...  beírunk minimum(1db karakter) karaktert és a hosszra
                ...  vonatkozó hibaüzenet nem jeleik meg.
    [Tags]  Medium
    ${companyregnumber} =  get company regnumber div object of companyinfo
    Check the div object contains the error message  ${companyregnumber}

Test the company country min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a céghez országba
                ...  kiválasztunk egy értéket és a hibaüzenet
                ...  NEM jelenik meg.
    [Tags]  Medium
    ${companycounty} =  get company country div object of companyinfo
    Check the div object contains the error message  ${companycounty}

Test the company zipcode min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy az irányítószámba
                ...  beírunk minimum(1db karakter) karaktert és a hosszra
                ...  vonatkozó hibaüzenet nem jeleik meg.
    [Tags]  Medium
    ${companyzipcode} =  get company zipcode div object of companyinfo
    Check the div object contains the error message  ${companyzipcode}

Test the company city min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a városba
                ...  beírunk minimum(1db karakter) karaktert és a hosszra
                ...  vonatkozó hibaüzenet nem jeleik meg.
    [Tags]  Medium
    ${companycity} =  get company city div object of companyinfo
    Check the div object contains the error message  ${companycity}

Test the company county min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a városba
                ...  beírunk minimum(1db karakter) karaktert és a hosszra vonatkozó
                ...  hibaüzenet nem jeleik meg.
    [Tags]  Medium
    ${companycounty} =  get company county div object of companyinfo
    Check the div object contains the error message  ${companycounty}

Test the company street min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy az utcába
                ...  beírunk minimum(1db karakter) karaktert és a hosszra
                ...  vonatkozó hibaüzenet nem jeleik meg.
    [Tags]  Medium
    ${companystreet} =  get company street div object of companyinfo
    Check the div object contains the error message  ${companystreet}

Test the company housenumber min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a házszámba
                ...  beírunk minimum(1db karakter) karaktert és a hosszra vonatkozó
                ...  hibaüzenet nem jeleik meg.
    [Tags]  Medium
    ${companyhousenumber} =  get company housenumber div object of companyinfo
    Check the div object contains the error message  ${companyhousenumber}

Test the company door min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy az ajtóba
                ...  beírunk minimum(1db karakter) karaktert és a hosszra
                ...  vonatkozó hibaüzenet nem jeleik meg.
    [Tags]  Medium
    ${companydoor} =  get company door div object of companyinfo
    Check the div object contains the error message  ${companydoor}

Test the company floor min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy az emeletbe
                ...  beírunk minimum(1db karakter) karaktert és a hosszra
                ...  vonatkozó hibaüzenet nem jeleik meg.
    [Tags]  Medium
    ${companyfloor} =  get company floor div object of companyinfo
    Check the div object contains the error message  ${companyfloor}

Test the billingname min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázási
                ...  cégnév részbe minimum(1db karakter) karaktert írunk
                ...  és ez erre vonatkozó hibaüzenet nem jelenik meg.
    [Tags]  Medium
    ${companybillingname} =  get name div object of billinginfo
    Check the div object contains the error message  ${companybillingname}

Test the billingvatnumber min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázási
                ...  adószám részbe minimum(1db karakter) karaktert írunk
                ...  és ez erre vonatkozó hibaüzenet nem jelenik meg.
    [Tags]  Medium
    ${companytaxnumber} =  get taxnumber div object of billinginfo
    Check the div object contains the error message  ${companytaxnumber}

Test the billingbankname min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázási
                ...  részben a banknévbe minimum(1db karakter) karaktert
                ...  írunk és ez erre vonatkozó hibaüzenet nem jelenik meg.
    [Tags]  Medium  maxx
    ${bankname} =  get bankname div object of billinginfo
    Check the div object contains the error message  ${bankname}

Test the billingbanknumber min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázási
                ...  részben a bankszámlaszámhoz minimum(1db karakter) karaktert
                ...  írunk és ez erre vonatkozó hibaüzenet nem jelenik meg.
    [Tags]  Medium
    ${banknumber} =  get banknumber div object of billinginfo
    Check the div object contains the error message  ${banknumber}

Test the billingiban min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázási
                ...  részben az iban-hoz minimum(1db karakter) karaktert
                ...  írunk és ez erre vonatkozó hibaüzenet nem jelenik meg.
    [Tags]  Medium
    ${iban} =  get iban div object of billinginfo
    Check the div object contains the error message  ${iban}

Test the billingswift min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázási
                ...  részben az swift-hez minimum(1db karakter)karaktert írunk
                ...  és ez erre vonatkozó hibaüzenet nem jelenik meg.
    [Tags]  Medium
    ${swift} =  get swift div object of billinginfo
    Check the div object contains the error message  ${swift}

Test the billingcountry min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázási
                ...  részben az országhoz kiválasztunk valamit és a hosszra vonatkozó
                ...  hibaüzenet nem jelenik meg.
    [Tags]  Medium
    ${billingcountry} =  get country div object of billinginfo
    Check the div object contains the error message  ${billingcountry}

Test the billingzipcode min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázáshoz tartozó
                ...  irányítószámába minimum(1db karakter) karaktert írunk
                ...  és ez erre vonatkozó hibaüzenet nem jelenik meg.
    [Tags]  Medium
    ${billingzipcode} =  get zipcode div object of billinginfo
    Check the div object contains the error message  ${billingzipcode}

Test the billingcity min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázáshoz tartozó
                ...  városba minimum(1db karakter) karaktert írunk
                ...  és ez erre vonatkozó hibaüzenet nem jelenik meg
    [Tags]  Medium
    ${billingcity} =  get city div object of billinginfo
    Check the div object contains the error message  ${billingcity}

Test the billing county min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a céghez tartozó
                ...  megyébe minimum(1db karakter) karaktert írunk
                ...  és ez erre vonatkozó  hibaüzenet nem jelenik meg.
    [Tags]  Medium
    ${billingcounty} =  get county div object of billinginfo
    Check the div object contains the error message  ${billingcounty}

Test the billing street min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázáshoz tartozó
                ...  utca részbe minimum(1db karakter) karaktert írunk
                ...  és ez erre vonatkozó hibaüzenet nem jelenik meg.
    [Tags]  Medium
    ${billingstreet} =  get street div object of billinginfo
    Check the div object contains the error message  ${billingstreet}

Test the billing housenumber min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázáshoz tartozó
                ...  házszám részbe minimum(1db karakter) karaktert írunk
                ...  és ez erre vonatkozó hibaüzenet nem jelenik meg.
    [Tags]  Medium
    ${billinghousenumber} =  get housenumber div object of billinginfo
    Check the div object contains the error message  ${billinghousenumber}

Test the billing door min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázhoz tartozó
                ...  ajtó részbe minimum(1db karakter) karaktert írunk
                ...  és ez erre vonatkozó hibaüzenet nem jelenik meg.
    [Tags]  Medium
    ${billingdoor} =  get door div object of billinginfo
    Check the div object contains the error message  ${billingdoor}

Test the billing floor min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a számlázáshoz tartozó
                ...  emelet részbe minimum(1db karakter) karaktert írunk
                ...  és ez erre vonatkozó hibaüzenet nem jelenik meg.
    [Tags]  Medium
    ${billingfloor} =  get floor div object of billinginfo
    Check the div object contains the error message  ${billingfloor}

Test contact firstname min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a elérhetőségi
                ...  keresztnévbe beírunk minimum(1db karakter) karaktert
                ...  és az erre vonatkozó hibaüzenet nem jelenik meg.
    [Tags]  Medium
    ${contactfirstname} =  Get firstname div object of contact
    Check the div object contains the error message  ${contactfirstname}

Test the contact lastname min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy az elérhetőségi
                ...  vezetéknévbe beírunk minimum(1db karakter) karaktert
                ...  és a hosszra vonatkozó hibaüzenet nem jelenik meg.
    [Tags]  Medium
    ${contactlastname} =  Get lastname div object of contact
    Check the div object contains the error message  ${contactlastname}

Test the contact phone min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy az elérhetőségi telefonszámba
                ...  beírunk 10 karaktert(számsor) és a hosszra vonatkozó hibaüenet
                ...  nem jelenik meg.
    [Tags]  Medium
    ${contactphonenumber} =  Get phone div object of contact
    Check the div object contains the error message  ${contactphonenumber}

Test the contact email min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a contact email címbe beírunk
                ...  egy minimum hosszú emailt és az erre vonatkozó hibaüzenet
                ...  nem jelenik meg.
    [Tags]  Medium
    ${contactemail} =  Get email div object of contact
    Check the div object contains the error message  ${contactemail}

Test the jobdescription min karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a munkakörbe
                ...  minimum(1db karakter) karaktert írunk és a hosszra
                ...  vonatkozó hibaüzenet nem jelenik meg.
    [Tags]  Medium
    ${jobdescription} =  get jobdescription div object of contact
    Check the div object contains the error message  ${jobdescription}

*** Keywords ***
