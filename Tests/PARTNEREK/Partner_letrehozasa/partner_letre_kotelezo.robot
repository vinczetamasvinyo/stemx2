*** Settings ***
Documentation  A suite azokat a teszteseteket tartalmazza amelyek megnézik, hogy
          ...  a partner felvitele során melyik mező kötelező, vagy nem kötelező.

Resource  ../../../Resources/partner_letre_kotelezo_resource.robot
Suite Setup  Login and go the new partner page and push the mentes  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
Suite Teardown  Common.End web test

*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}
${Nyelv} =  Hun
&{Kotelezo}  Hun=A mező kitöltése kötelező.  En=This field is required.


*** Test Cases ***
Test the firstname of partner is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a partner adatain belül
                ...  a firtname-nél megjelenik-e a hibaüzenet
                ...  Meg kell jelennie a hibaüzentnek.
    [Tags]  Low
    ${firstname} =  Get firstname div object of partnerinfo
    #${v1}  ${v2} =  check the elem contain in parent2  ${firstname}   ./app-show-errors/ul/li
    #${van1}  ${van2} =  po_partners.Check the error message  ${firstname}
    #log  ${v1}
    #Check the div object contains the error message  ${firstname}
    Check the error message appear and the error text value  ${firstname}  ${Kotelezo.${Nyelv}}


Test the lastname of partner is mandantory

    ${lastname} =  Get lastname div object of partnerinfo
    #Check the div object contains the error message  ${lastname}
    Check the error message appear and the error text value  ${lastname}  ${Kotelezo.${Nyelv}}

Test the email of partnert is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a partner adatain belül
                ...  a email-nél megjelenik-e a hibaüzenet
                ...  Meg kell jelennie a hibaüzentnek.
    [Tags]  Medium
    ${email} =  Get email div object of partnerinfo
    #Check the div object contains the error message  ${email}
    Check the error message appear and the error text value  ${email}  ${Kotelezo.${Nyelv}}

Test the company name of company info is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a céginformáción belül
                ...  a cégnévél megjelenik-e a kötelező hibaüzenet.
                ...  Meg kell jelennie a hibaüzentnek.
    [Tags]  Medium
    ${companyname} =  Get companynev div object of companyinfo
    Check the error message appear and the error text value  ${companyname}  ${Kotelezo.${Nyelv}}

Test the company longname of company info is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a céginformáción belül
                ...  a cég hosszú neve megjelenik-e a kötelező hibaüzenet.
                ...  Meg kell jelennie a hibaüzentnek.
    [Tags]  Medium
    ${email} =  Get company lognev div object of companyinfo
    Check the error message appear and the error text value  ${email}  ${Kotelezo.${Nyelv}}

Test the company regnumber of company info is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a céginformáción belül
                ...  a cégjegyzékszám megjelenik-e a kötelező hibaüzenet.
                ...  Meg kell jelennie a hibaüzentnek.
    [Tags]  Medium
    ${email} =  Get company regnumber div object of companyinfo
    Check the error message appear and the error text value  ${email}  ${Kotelezo.${Nyelv}}

Test the company country of company info is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a céginformáción belül
                ...  az országnál megjelenik-e a kötelező hibaüzenet.
                ...  Meg kell jelennie a hibaüzentnek.
    [Tags]  Medium
    ${email} =  Get company country div object of companyinfo
    Check the error message appear and the error text value  ${email}  ${Kotelezo.${Nyelv}}

Test the company zipcode of company info is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a céginformáción belül
                ...  a zipcode megjelenik-e a kötelező hibaüzenet.
                ...  Meg kell jelennie a hibaüzentnek.
    [Tags]  Medium
    ${email} =  Get company zipcode div object of companyinfo
    Check the error message appear and the error text value  ${email}  ${Kotelezo.${Nyelv}}

Test the city county of company info is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a céginformáción belül
                ...  a megyénél nem jelenik meg a kötelező hibaüzenet.
    [Tags]  Medium
    ${city} =  Get company city div object of companyinfo
    Check the error message appear and the error text value  ${city}  ${Kotelezo.${Nyelv}}

Test the company county of company info is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a céginformáción belül
                ...  a megyénél nem jelenik meg a kötelező hibaüzenet.
    [Tags]  Medium
    ${county} =  Get company county div object of companyinfo
    Check the div object contains the error message  ${county}

Test the company street of company info is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a céginformáción belül
                ...  az utcánál megjelenik-e a kötelező hibaüzenet.
                ...  Meg kell jelennie a hibaüzentnek.
    [Tags]  Medium
    ${street} =  Get company street div object of companyinfo
    #Check the div object contains the error message  ${street}
    Check the error message appear and the error text value  ${street}  ${Kotelezo.${Nyelv}}

Test the company housenumber of company info is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a céginformáción belül
                ...  a házszámnál megjelenik-e a kötelező hibaüzenet.
                ...  Meg kell jelennie a hibaüzentnek.
    [Tags]  Medium
    ${housenumber} =  Get company housenumber div object of companyinfo
    #Check the div object contains the error message  ${housenumber}
    Check the error message appear and the error text value  ${housenumber}  ${Kotelezo.${Nyelv}}

Test the company door of company info is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a céginformáción belül
                ...  az ajtónál megjelenik-e a kötelező hibaüzenet.
                ...  Nem kell megjelennie a hibaüzentnek.
    [Tags]  Medium
    ${door} =  Get company door div object of companyinfo
    Check the div object contains the error message  ${door}

Test the company floor of company info is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a céginformáción belül
                ...  az ajtónál megjelenik-e a kötelező hibaüzenet.
                ...  Nem kell megjelennie a hibaüzentnek.
    [Tags]  Medium
    ${door} =  Get company floor div object of companyinfo
    Check the div object contains the error message  ${door}

Test the billing name of company info is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a céginformáció/számlázási résznél
                ...  a névnél megjelenik-e a kötelező hibaüzenet.
                ...  Meg kell jelennie a hibaüzentnek.
    [Tags]  Medium
    ${billingname} =  Get name div object of billinginfo
    #Check the div object contains the error message  ${door}
    Check the error message appear and the error text value  ${billingname}  ${Kotelezo.${Nyelv}}

Test the billing taxnumber of company info is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a céginformáció/számlázási résznél
                ...  az adószámnál megjelenik-e a kötelező hibaüzenet.
                ...  Meg kell jelennie a hibaüzentnek.
    [Tags]  Medium
    ${taxnumber} =  Get name div object of billinginfo
    Check the error message appear and the error text value  ${taxnumber}  ${Kotelezo.${Nyelv}}

Test the bankname of billing info is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a céginformáció/számlázási résznél
                ...  a banknév megjelenik-e a kötelező hibaüzenet.
                ...  Meg kell jelennie a hibaüzentnek.
    [Tags]  Medium
    ${bankname} =  Get bankname div object of billinginfo
    Check the error message appear and the error text value  ${bankname}  ${Kotelezo.${Nyelv}}

Test the banknumber of billing info is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a céginformáció/számlázási résznél
                ...  a banknév megjelenik-e a kötelező hibaüzenet.
                ...  Meg kell jelennie a hibaüzentnek.
    [Tags]  Medium
    ${banknumber} =  Get banknumber div object of billinginfo
    Check the error message appear and the error text value  ${banknumber}  ${Kotelezo.${Nyelv}}

Test the iban of billing info is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a céginformáció/számlázási résznél
                ...  az iban megjelenik-e a kötelező hibaüzenet.
                ...  Nem kell megjelennie a hibaüzentnek.
    [Tags]  Medium
    ${iban} =  Get iban div object of billinginfo
    Check the div object contains the error message  ${iban}

Test the swift of billing info is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a céginformáció/számlázási résznél
                ...  a swift-nél megjelenik-e a kötelező hibaüzenet.
                ...  Nem kell megjelennie a hibaüzentnek.
    [Tags]  Medium
    ${swift} =  Get swift div object of billinginfo
    Check the div object contains the error message  ${swift}

Test the country of billing info is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a céginformáció/számlázási résznél
                ...  a country-nál megjelenik-e a kötelező hibaüzenet.
                ...  Meg kell jelennie a hibaüzentnek.
    [Tags]  Medium
    ${country} =  Get country div object of billinginfo
    Check the error message appear and the error text value  ${country}  ${Kotelezo.${Nyelv}}

Test the zipcode of billing info is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a céginformáció/számlázási résznél
                ...  az irányítószámnál megjelenik-e a kötelező hibaüzenet.
                ...  Meg kell jelennie a hibaüzentnek.
    [Tags]  Medium
    ${zipcode} =  Get zipcode div object of billinginfo
    Check the error message appear and the error text value  ${zipcode}  ${Kotelezo.${Nyelv}}

Test the city of billing info is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a céginformáció/számlázási résznél
                ...  a városnnál megjelenik-e a kötelező hibaüzenet.
                ...  Meg kell jelennie a hibaüzentnek.
    [Tags]  Medium
    ${city} =  Get city div object of billinginfo
    Check the error message appear and the error text value  ${city}  ${Kotelezo.${Nyelv}}

Test the county of billing info is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a céginformáció/számlázási résznél
                ...  a megyénél megjelenik-e a kötelező hibaüzenet.
                ...  Nem kell megjelennie a hibaüzentnek.
    [Tags]  Medium
    ${county} =  Get county div object of billinginfo
    Check the div object contains the error message  ${county}

Test the street of billing info is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a céginformáció/számlázási résznél
                ...  az utcánál megjelenik-e a kötelező hibaüzenet.
                ...  Meg kell jelennie a hibaüzentnek.
    [Tags]  Medium
    ${street} =  Get street div object of billinginfo
    Check the error message appear and the error text value  ${street}  ${Kotelezo.${Nyelv}}

Test the house of billing info is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a céginformáció/számlázási résznél
                ...  a házszámnál megjelenik-e a kötelező hibaüzenet.
                ...  Meg kell jelennie a hibaüzentnek.
    [Tags]  Medium
    ${housenumber} =  Get housenumber div object of billinginfo
    Check the error message appear and the error text value  ${housenumber}  ${Kotelezo.${Nyelv}}

Test the door of billing info is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a céginformáció/számlázási résznél
                ...  az ajtónál megjelenik-e a kötelező hibaüzenet.
                ...  Nem kell megjelennie a hibaüzentnek.
    [Tags]  Medium
    ${door} =  Get door div object of billinginfo
    Check the div object contains the error message  ${door}

Test the floor of billing info is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a céginformáció/számlázási résznél
                ...  az emeletnél megjelenik-e a kötelező hibaüzenet.
                ...  Nem kell megjelennie a hibaüzentnek.
    [Tags]  Medium
    ${door} =  Get floor div object of billinginfo
    Check the div object contains the error message  ${door}

Test the firstname of contact info is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a céginformáció/elérhetőség
                ...  résznél a keresztnévnél megjelenik-e a kötelező hibaüzenet.
                ...  Meg kell jelennie a hibaüzentnek.
    [Tags]  Medium
    ${firstname} =  Get firstname div object of contact
    Check the error message appear and the error text value  ${firstname}  ${Kotelezo.${Nyelv}}

Test the latname of contact info is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a céginformáció/elérhetőség
                ...  résznél a vezetéknévnél megjelenik-e a kötelező hibaüzenet.
                ...  Meg kell jelennie a hibaüzentnek.
    [Tags]  Medium
    ${lastname} =  Get lastname div object of contact
    Check the error message appear and the error text value  ${lastname}  ${Kotelezo.${Nyelv}}

Test the phone of contact info is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a céginformáció/elérhetőség
                ...  résznél a telefonszámnál megjelenik-e a kötelező hibaüzenet.
                ...  Meg kell jelennie a hibaüzentnek.
    [Tags]  Medium
    ${phone} =  Get phone div object of contact
    Check the error message appear and the error text value  ${phone}  ${Kotelezo.${Nyelv}}

Test the email of contact info is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a céginformáció/elérhetőség
                ...  résznél az email-nél megjelenik-e a kötelező hibaüzenet.
                ...  Meg kell jelennie a hibaüzentnek.
    [Tags]  Medium
    ${email} =  Get email div object of contact
    Check the error message appear and the error text value  ${email}  ${Kotelezo.${Nyelv}}

Test the jobdesciption of contact info is mandantory
    [Documentation]  A teszt során azt nézzü meg, hogy a céginformáció/elérhetőség
                ...  résznél a munkakörnél-nél megjelenik-e a kötelező hibaüzenet.
                ...  Nem kell megjelennie a hibaüzentnek.
    [Tags]  Medium
    ${jobdescription} =  Get jobdescription div object of contact
    Check the div object contains the error message  ${jobdescription}




















*** Keywords ***
