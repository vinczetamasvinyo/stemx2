*** Settings ***
Resource  ../../../Resources/partner_letrehozasa_szoveg_resource.robot
Resource  ../../../Resources/Common_resource.robot
Resource  ../../../Resources/PO/po_mymenu.robot

Suite Setup  Login and go to the new paratner page and change language to english  ${OLDAL_URL}  ${bogeszo}  ${box_office1_email_ok}  ${box_office1_password_ok}
#Suite Setup  Login and go to the new partner page  ${OLDAL_URL}  ${bogeszo}  ${box_office1_email_ok}  ${box_office1_password_ok}
Suite Teardown  Common.End web test

*** Variables ***
${Nyelv} =  En

*** Test Cases ***
Test the new partner page title
    [Documentation]  A teszt során azt nézzük meg, hogy az új partner létrehozása
                ...  oldal címének a szövege az megfelelő.
    [Tags]  most
    #po_mymenu.Click the Mymenu
    #po_mymenu.Click the language
    #po_mymenu.Wait the language submenu appear
    #po_mymenu.Click the english language
    #po_mymenu.Waiting the new language is loaded
    Check the page title text on the new partner page  ${TITLE_TEXT.${Nyelv}}

Test the partner profile block tilte
    [Documentation]  A teszt soránt azt nézzük meg, hogy a partner profile
                ...  blokkhoz kapcsolódó szöveg megfelelően jelenik-e meg.
    [Tags]  Low
    Check the partner profile block title text on the new partner page  ${PARTNER_PROFILE_TITLE_TEXT.${Nyelv}}

Test1
    [Documentation]  A teszt során azt nézzük meg, hogy a partner profile
                ...  oldalon található keresztnév mező szöveg az jól jelenik-e meg.
    [Tags]  Low
    Check the firstname text on the new partner page  ${KERESZTNEV_TEXT.${Nyelv}}

Test the veznev
    [Documentation]  A teszt során azt nézzük meg, hogy a partner profile
                ...  oldalon található vezetéknév mező szövege az jól jelenik-e meg.
    [Tags]  Low
    Check the veznev text on the new partner page  ${VEZNEV_TEXT.${Nyelv}}

Test the email cim
    [Documentation]  A teszt soránt azt nézzük meg, hogy a partner profile
                ...  oldalon az email cím az jó szöveggel jelenik-e meg.
    [Tags]  Low
    Check the email text on the new partner page  ${EMAIL_CIM_TEXT.${Nyelv}}

Test the company details title on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy a cég részleteihez
                ...  tartozó bloknak a címe az megfelelően jelenik-e meg.
    [Tags]  Low
    Check the company details block title text on the new partner page  ${COMPANY_DETEAILS_TEXT.${Nyelv}}

Test the company name label on the new partner page
    [Documentation]  A teszt során azt nézük meg, hogy a cég nevéhez tartozó
                ...  szöveg megfelelően jelenik-e meg.
    [Tags]  Low
    Check the company name text on the new partner page  ${COMPANY_NAME_TEXT.${Nyelv}}

Test the company long name label on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy a cég long nevéhez
                ...  tartozó szöveg megfelelően jelenik-e meg.
    [Tags]  Low
    Check the company long name text on the new partner page  ${COMPANY_LONG_NAME_TEXT.${Nyelv}}

Test the company reg number label on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy a cég regisztrációs labelje
                ...  megfelelően jelenik-e meg.
    [Tags]  Low
    Check the company reg number text on the new partner page  ${COMPANY_REG_NUMBER_TEXT.${Nyelv}}

Test the company country label on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy a cég ország labelje
                ...  az megfelelően jelenik-e meg.
    [Tags]  Low
    Check the company country text on the new partner page  ${COMPANY_COUNTRY_TEXT.${Nyelv}}

Test the company zipcode label on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy a cég irányítószám labelje
                ...  az megfelelően jelenik-e meg.
    [Tags]  Low
    Check the company zipcode  ${COMPANY_ZIPCODE_TEXT.${Nyelv}}

Test the company city label on the new partner page
    [Documentation]  A teszt soránt azt nézzük meg, hogy a cég irányítószám labelje
                ...  a megjelenik-e, illetve megfelelő-e a szövege.
    [Tags]  Low
    Check the company city text  ${COMPANY_CITY_TEXT.${Nyelv}}

Test the company county label on the new partner page
    [Tags]  Low
    Check the company county text  ${COMPANY_COUNTY_TEXT.${Nyelv}}

Test the company street label on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy a céghez tartozó utca mező
                ...  labelnek a szövege az megfelelőe.
    [Tags]  Low
    Check the company street text  ${COMPANY_STREET_TEXT.${Nyelv}}

Test the company housenumber text on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy a céghez tartozó házszám mező
                ...  labelnek a szövege az megfelelő-e.
    [Tags]  low
    Check the company housenumber text  ${COMPANY_HOUSENUMBER_TEXT.${Nyelv}}

Test the company door text on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy a céghez tartozó ajtó
                ...  labelnek a szövege megfelelő-e.
    [Tags]  Low
    Check the company door text  ${COMPANY_DOOR_TEXT.${Nyelv}}

Test the company floor text on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy a céghez tartozó emelet
                ...  labelnek a szövege megfelelő-e.
    [Tags]  Low
    Check the company floor text  ${COMPANY_FLOOR_TEXT.${Nyelv}}

Test the billing title text on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy a számlázási blokk
                ...  címének a szövege az megfelelő-e.
    [Tags]  Low
    Check the billing title text  ${BILLING_TITLE_TEXT.${Nyelv}}

Test the billing name text on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy a számlázási blokk-on belül
                ...  a név input mezőnek szövege az megfelelő-e.
    [Tags]  Low
    Check the billing name text  ${BILLING_NAME_TEXT.${Nyelv}}

Test the billing taxnumber text on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy a számlázási blokk-on belül
                ...  az adószám input mezőnek szövege az megfelelő-e.
    [Tags]  Low
    Check the billing taxnumber text  ${BILLING_TAXNUMBER_TEXT.${Nyelv}}

Test the billing bank text on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy a számlázási blokk-on belül
                ...  az bank input mezőnek szövege az megfelelő-e
    [Tags]  Low
    Check the billing bank text    ${BILLING_BANK_TEXT.${Nyelv}}

Test the billing banknumber text on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy a számlázási blokk-on belül
                ...  az bank number input mezőnek szövege az megfelelő-e
    [Tags]  Low
    Check the billing banknumber text  ${BILLING_BANKNUMBER_TEXT.${Nyelv}}

Test the billing iban text on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy a számlázási blokk-on belül
                ...  az iban input mezőnek szövege az megfelelő-e
    [Tags]  Low
    Check the billing iban text  ${BILLING_IBAN_TEXT.${Nyelv}}

Test the billing swift text on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy a számlázási blokk-on belül
                ...  a swift input mezőnek szövege az megfelelő-e
    [Tags]  Low
    check the billing swift text  ${BILLING_SWIFT_TEXT.${Nyelv}}

Test the billing country text on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy a számlázási blokk-on belül
                ...  az ország mezőnek szövege az megfelelő-e
    [Tags]  Low
    Check the billing country text  ${BILLING_COUNTRY_TEXT.${Nyelv}}

Test the billing zipcode text on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy a számlázási blokk-on belül
                ...  az irányítószám mezőnek szövege az megfelelő-e
    [Tags]  Low
    Check the billing zipcode text  ${BILLING_ZIPCDOE_TEXT.${Nyelv}}

Test the billing város text on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy a számlázási blokk-on belül
                ...  az irányítószám mezőnek szövege az megfelelő-e
    [Tags]  Low
    Check the billing city text  ${BILLING_CITY_TEXT.${Nyelv}}

Test the billing county text on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy a számlázási blokk-on belül
                ...  a megye mezőnek szövege az megfelelő-e
    [Tags]  Low
    Check the billing county text  ${BILLING_COUNTY_TEXT.${Nyelv}}

Test the billing street text on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy a számlázási blokk-on belül
                ...  az utca mezőnek szövege az megfelelő-e
    [Tags]  Low
    Check the billing street text  ${BILLING_STREET_TEXT.${Nyelv}}

Test the billing housenumber text on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy a számlázási blokk-on belül
                ...  az utca mezőnek szövege az megfelelő-e
    [Tags]  Low
    Check the billing housenumber text  ${BILLING_HOUSENUMBER_TEXT.${Nyelv}}

Test the billing door text on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy a számlázási blokk-on belül
                ...  az ajtó mezőnek szövege az megfelelő-e
    [Tags]  Low
    Check the billing door text  ${BILLING_DOOR_TEXT.${Nyelv}}

Test the billing floor text on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy a számlázási blokk-on belül
                ...  az emelet mezőnek szövege az megfelelő-e
    [Tags]  Low
    Check the billing floor text  ${BILLING_FLOOR_TEXT.${Nyelv}}

Test the new contact button text on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy az új elérhetőség hozzáadása
                ...  gombnak a szövege az megfelelő-e.
    [Tags]  Low
    Check the new contact button text  ${NEW_CONTACT_BUTTON_TEXT.${Nyelv}}

Test the contact title text on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy az elérhetőségek címének
                ...  a szövege az megfelelő-e.
    [Tags]  Low
    Check the contact title text  ${CONTACT_TITLE_TEXT.${Nyelv}}

Test the contact title on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy az elérhetőség
                ...  blokk címének a szövege az megfelelőe.
    [Tags]  Low
    Check the first contact title text  ${FIRSTCONTACT_TITLE_TEXT.${Nyelv}}

Test the contact firstname text on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy az elérhetőség
                ...  blokk-on belül a keresztnév szövege megfelelő-e.
    [Tags]  Low
    Check the contact firstname text  ${FIRSTNAMECONTACT_TEXT.${Nyelv}}

Test the contact secondname text on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy az elérhetőség
                ...  blokk-on belül a vezetéknév szövege megfelelő-e.
    [Tags]  Low
    Check the contact secondname text  ${SECONDNAMECONTACT_TEXT.${Nyelv}}

Test the conatct telefonszam text on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy az elérhetőség
                ...  blokk-on belül a telefonszám szövege megfelelő-e.
    [Tags]  Low
    Check the contact phone text  ${PHONECONTACT_TEXT.${Nyelv}}

Test the contact email address text on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy az elérhetőség
                ...  blokk-on belül a telefonszám szövege megfelelő-e.
    [Tags]  Low
    Check the contact email text  ${EMAILCONTACT_TEXT.${Nyelv}}

Test the job text on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy az elérhetőség
                ...  blokk-on belül a munkakör szövege megfelelő-e.
    [Tags]  Low
    Check the job text  ${JOBCONTACT_TEXT.${Nyelv}}

Test the back to the list button text on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy az elérhetőség
                ...  blokk-on belül a munkakör szövege megfelelő-e.
    [Tags]  Low
    Check the back button text  ${BACKBUTTON_TEXT.${Nyelv}}

Test the save button text on the new partner page
    [Documentation]  A teszt során azt nézzük meg, hogy az elérhetőség
                ...  blokk-on belül a munkakör szövege megfelelő-e.
    [Tags]  Low
    Check the save button text   ${SAVEBUTTON_TEXT.${Nyelv}}