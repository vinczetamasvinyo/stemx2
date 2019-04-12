*** Settings ***
Resource  ../../../Resources/partner_letre_mezo_valid_resource.robot

#Suite Setup  Login and go to the new partner page  ${OLDAL_URL}  ${bogeszo}  ${box_office1_email_ok}  ${box_office1_password_ok}
Suite Setup  Login and go to the new partner page and give all data  ${OLDAL_URL}  ${bogeszo}  ${box_office1_email_ok}  ${box_office1_password_ok}  ${ADAT_TOOlONG}
Suite Teardown  Common.End web test

*** Variables ***
${NYELV} =  Hun
${LONG} =  ddddddddddddddddddddwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwdwwwwwwwwwwwwwwwwwwwwwwqqqqqqqqqqqqqqqqqqqqqqqqqqqqdddddd
${Max_LONG} =  ddddddddddddddddddddwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwqqqqqqqqqqqqqqqqqqqqqqqqqqqqdddddddd
${Max_ZIPCODE_TOO_LONG} =  ddddddddddddddddddddwwwDDDDDDDDD
${Max_COUNTY_TOO_LONG} =  lldslslsllslslllllllllllllllllllslslslslllslllllllllllllllllllll
${Max_10_TOO_LONG} =  llslslsllss
${Max_30_TOO_LONG} =  llslslsllssdsdsdsssssssssssssss
${SHORT_NORMAL} =  k
${LETTER_VALIDATOR_GOOD} =  azAz áéíóúűöő-.
${LETTER_VALIDATOR_NUMBER_WRONG} =  ${LETTER_VALIDATOR_GOOD}1
${LETTER_VALIDATOR_OTHER_WRONG} =  ${LETTER_VALIDATOR_GOOD}$
${NORMAL} =  normal
${EMAIL_TOO_LONG} =  ddddddddddddddddddddwwwwwwwwwwwwwwwwwwww@wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq.com
&{MAX_KARAKTER_127}  Hun=Kérem legfeljebb 127 karaktert adjon meg
                ...  En=Please enter no more than 127 characters
&{ERROR_MAX_ZIPCODE_KARAKTER}  Hun=Kérem legfeljebb 31 karaktert adjon meg
                          ...  En=Please enter no more than 31 characters
&{ERROR_MAX_63_KARAKTER}  Hun=Kérem legfeljebb 63 karaktert adjon meg
                     ...  En=Please enter no more than 63 characters
&{ERROR_MAX_10_KARAKTER}  Hun=Kérem legfeljebb 10 karaktert adjon meg
                     ...  En=Please enter no more than 10 characters
&{ERROR_MAX_30_KARAKTER}  Hun=Kérem legfeljebb 30 karaktert adjon meg
                     ...  En=Please enter no more than 30 characters
&{ERRORS_LETTER_VALIDATOR}  Hun=Ez a mező csak betűt, \'.\' és \'-\' karaktert tartalmazhat.
                       ...  En=Only letters, '.' and '-' can be used in this field.
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
            ...  Companycountry=Magyarország
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
            ...  Billingcountry=Magyarország
            ...  Billingzipcode=${Max_ZIPCODE_TOO_LONG}
            ...  Billingcity=${Max_LONG}
            ...  Billingcounty=${Max_COUNTY_TOO_LONG}

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



#ITT KELL FOLYTATNI


Test the firstname give minimum karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a keresztnévbe beírunk minimum karaktert, akkor
                ...  nem jelenik meg hibaüzenet.
    [Tags]  Medium
    Common_resource.Reload the page
    ${firstname} =  Get firstname div object of partnerinfo
    Check the div object contains the error message  ${firstname}
    Give the firstname and lastname  ${SHORT_NORMAL}  ${NORMAL}
    Check the div object contains the error message  ${firstname}

Test the firstname give max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a keresztnévbe beírunk maximum elfogadott karaktert,
                ...  akkor nem jelenik meg hibaüzenet.
    [Tags]  Medium
    Common_resource.Reload the page
    ${firstname} =  Get firstname div object of partnerinfo
    Check the div object contains the error message  ${firstname}
    Give the firstname and lastname  ${LONG}  ${NORMAL}
    Check the div object contains the error message  ${firstname}

Test firstname max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a keresztnévbe beírunk a maxnál 1-el nagyobb
                ...  karaktert és az erre vonatkozó hibaüzenet megjelenik.
    [Tags]  Medium  most
    #Common_resource.Reload the page
    ${firstname} =  Get firstname div object of partnerinfo
    Check the div object contains the error message  ${firstname}
    Give the max128 data   ${ADAT_TOOlONG}  valami  valami2
    #Give the firstname and lastname  ${ADAT}[Firstname]  ${NORMAL}
    Check the error message appear and the error text value  ${firstname}  ${MAX_KARAKTER_127.${NYELV}}

Test firstname give good karakter
    [Documentation]  A teszt során azt nézzük meg, hogy a keresztnévbe beírjuk a megengedett karaktereket
                ...  én nem jelenik meg hibaüzenet.
    Common_resource.Reload the page
    ${firstname} =  Get firstname div object of partnerinfo
    Check the div object contains the error message  ${firstname}
    Give the firstname and lastname  ${LETTER_VALIDATOR_GOOD}  ${NORMAL}
    Check the div object contains the error message  ${firstname}

Test firstname wrong karakter
    [Documentation]  A teszt során azt nézzük meg, hogy a keresztnévbe nem megengedett karaktert
                ...  írunk és, hogy a megfelelő hibaüzenet megjelenik-e.
    [Tags]  Medium
    Common_resource.Reload the page
    ${firstname} =  Get firstname div object of partnerinfo
    Check the div object contains the error message  ${firstname}
    Give the firstname and lastname  ${LETTER_VALIDATOR_NUMBER_WRONG}  ${NORMAL}
    Check the error message appear and the error text value  ${firstname}  ${ERRORS_LETTER_VALIDATOR.${NYELV}}

Test firstname other karakter
    [Documentation]  A teszt során azt nézzük meg, hogy a keresztnévbe nem megengedett karaktert
                ...  írunk speciális karaktert és, hogy a megfelelő hibaüzenet megjelenik-e.
    [Tags]  Medium
    Common_resource.Reload the page
    ${firstname} =  Get firstname div object of partnerinfo
    Check the div object contains the error message  ${firstname}
    Give the firstname and lastname  ${LETTER_VALIDATOR_OTHER_WRONG}  ${NORMAL}
    Check the error message appear and the error text value  ${firstname}  ${ERRORS_LETTER_VALIDATOR.${NYELV}}

# Vezetéknév-hez kapcsolódó esetek

Test the lastname give minimum karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a vezetéknévbe beírunk minimum karaktert, akkor
                ...  nem jelenik meg hibaüzenet.
    [Tags]  Medium
    Common_resource.Reload the page
    ${firstname} =  Get lastname div object of partnerinfo
    Check the div object contains the error message  ${firstname}
    Give the lastname and firstname  ${SHORT_NORMAL}  ${NORMAL}
    Check the div object contains the error message  ${firstname}

Test the lastname give max karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a vezetéknévbe beírunk maximum elfogadott karaktert,
                ...  akkor nem jelenik meg hibaüzenet.
    [Tags]  Medium
    Common_resource.Reload the page
    ${firstname} =  Get lastname div object of partnerinfo
    Check the div object contains the error message  ${firstname}
    Give the lastname and firstname  ${LONG}  ${NORMAL}
    Check the div object contains the error message  ${firstname}

Test the lastname max+x karakter
    [Documentation]  A teszt soránt azt nézzük meg, hogy a vezetéknévbe beírunk a maxnál 1-el nagyobb
                ...  karaktert és az erre vonatkozó hibaüzenet megjelenik.
    [Tags]  Medium
    Common_resource.Reload the page
    ${firstname} =  Get lastname div object of partnerinfo
    Check the div object contains the error message  ${firstname}
    Give the lastname and firstname  ${Max_LONG}  ${NORMAL}
    Check the error message appear and the error text value  ${firstname}  ${MAX_KARAKTER_127.${NYELV}}

Test the lastname give good karakter
    [Documentation]  A teszt során azt nézzük meg, hogy a vezetéknévbe beírjuk a megengedett karaktereket
                ...  én nem jelenik meg hibaüzenet.
    Common_resource.Reload the page
    ${firstname} =  Get lastname div object of partnerinfo
    Check the div object contains the error message  ${firstname}
    Give the lastname and firstname  ${LETTER_VALIDATOR_GOOD}  ${NORMAL}
    Check the div object contains the error message  ${firstname}

Test the lastname wrong karakter
    [Documentation]  A teszt során azt nézzük meg, hogy a vezetéknévbe nem megengedett karaktert
                ...  írunk és, hogy a megfelelő hibaüzenet megjelenik-e.
    [Tags]  Medium
    Common_resource.Reload the page
    ${firstname} =  Get lastname div object of partnerinfo
    Check the div object contains the error message  ${firstname}
    Give the lastname and firstname  ${LETTER_VALIDATOR_NUMBER_WRONG}  ${NORMAL}
    Check the error message appear and the error text value  ${firstname}  ${ERRORS_LETTER_VALIDATOR.${NYELV}}

Test lastname other karakter
    [Documentation]  A teszt során azt nézzük meg, hogy a vezetéknévbe nem megengedett karaktert
                ...  írunk speciális karaktert és, hogy a megfelelő hibaüzenet megjelenik-e.
    [Tags]  Medium
    Common_resource.Reload the page
    ${firstname} =  Get lastname div object of partnerinfo
    Check the div object contains the error message  ${firstname}
    Give the lastname and firstname  ${LETTER_VALIDATOR_OTHER_WRONG}  ${NORMAL}
    Check the error message appear and the error text value  ${firstname}  ${ERRORS_LETTER_VALIDATOR.${NYELV}}

*** Keywords ***
