*** Settings ***
Resource  ../../../../Resources/partner_letrehozasa_elem_resource.robot

Suite Setup  Login and go to the new partner page  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
Suite Teardown  Common.End web test

*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}  language=${NYELV}
${NYELV} =  ${EMPTY}
#robot -d results Tests/partnerek/partner_letrehozasa/partner_letrehozasa_elem.robot

*** Test Cases ***
Test the partner firstname visible
    [Documentation]  A teszt során azt nézzük meg, hogy a keresztnév input mező
                ...  megjelenik-e az oldalon.
    [Tags]  Low
    Check the partner firstname input

Test the partner lastname visible
    [Documentation]  A teszt során azt nézzük meg, hogy a vezetéknév input mező
                ...  megjelenik-e az oldalon.
    [Tags]  Low
    Check the partner lastnem input

Test the partner email visible
    [Documentation]  A teszt során azt nézzük meg, hogy a partnernél az email
                ...  megjelenik-.e
    [Tags]  Low
    Check the partner email input

Test the partner company name visible
    [Documentation]  A teszt során azt nézzük meg, hogy a partnernél a cégnév
                ...  megjelenik-.e
    [Tags]  Low
    Check the company company input

Test the partner company long name visible
    [Documentation]  A teszt során azt nézzük meg, hogy a partnernél a cégnév
                ...  hosszú neve megjelenik-e.
    Check the company long name input

Test the partner company country visible
    [Documentation]  A teszt során azt nézzük meg, hogy a partnernél az ország
                ...  megjelenik-e.
    Check the company country input

Test the partner company zipcode visible
    [Documentation]  A teszt során azt nézzük meg, hogy a partnernél az irányítószám
                ...  megjelenik-e.
    Check the company zipcode input

Test the partner company city visible
    [Documentation]  A teszt során azt nézzük meg, hogy a partnernél a város
                ...  megjelenik-e.
    Check the company city input

Test the partner company county visible
    [Documentation]  A teszt során azt nézzük meg, hogy partnernél a megye
                ...  megjelenik-e.
    Check the company county input

Test the partner company street visible
    [Documentation]  A teszt során azt nézzük meg, hogy a partnernél az
                ...  utca megjelenik-e.
    Check the company street input

Test the partner company housenumber visible
    [Documentation]  A teszt során azt nézzük meg, hogy a partnernél a
                ...  házszám az rendben megjelenik-e.
    Check the company housenumber input

Test the partner company door visible
    [Documentation]  A teszt során azt nézzük meg, hogy a partnernél az ajtó
                ...  rendben megjelenik-e.
    Check the company door input

Test the partner company floor visible
    [Documentation]  A teszt során azt nézzük meg, hogy a partnernél az emelet
                ...  rendben megjelenik-e.
    Check the company floor input

Test the partner billing name visible
    [Documentation]  A teszt során azt nézzük meg, hogy a számlázásnál a név
                ...  rendben megjelenik-e.
    Check the billing name input

Test the partner billing taxnumber visible
    [Documentation]  A teszt során azt nézzük meg, hogy a számlázásnál az adószám
                ...  rendben megjelenik-e.
    Check the billing taxnumber input

Test the partner billing bankname visible
    [Documentation]  A teszt során azt nézzük meg, hogy a számlázásnál a banknév
                ...  rendben megjelenik-e.
    Check the billing bank name input

Test the partner billing banknumber visible
    [Documentation]  A teszt során azt nézzük meg, hogy a számlázásnál a
                ...  bankszámlaszám rendben megjelenik-e.
    Check the billing bankaccountnumber input

Test the partner billing iban visible
    [Documentation]  A teszt során azt nézzük meg, hogy a számlázásnál a
                ...  iban rendben megjelenik-e.
    Check the billing iban input

Test the partner billing swift visible
    [Documentation]  A teszt során azt nézzük meg, hogy a számlázásnál a
                ...  swift rendben megjelenik-e.
    Check the billing swift input

Test the partner billing country visible
    [Documentation]  A teszt során azt nézzük meg, hogy a számlázásnál az
                ...  ország rendben megjelenik-e.
    Check the billing country input

Test the partner billing zipcode visible
    [Documentation]  A teszt során azt nézzük meg, hogy a számlázásnál az
                ...  irányítószám rendben megjelenik-e.
    Check the billing zipcode input

Test the partner billing city visible
    [Documentation]  A teszt során azt nézzük meg, hogy a számlázásnál a
                ...  város rendben megjelenik-e.
    Check the billing city input

Test the partner billing county visible
    [Documentation]  A teszt során azt nézzük meg, hogy a számlázásnál a
                ...  megye rendben megjelenik-e.
    Check the billing county input

Test the partner billing street visible
    [Documentation]  A teszt során azt nézzük meg, hogy a számlázásnál a
                ...  utca rendben megjelenik-e.
    Check the billing street input

Test the partner billing housenumber visible
    [Documentation]  A teszt során azt nézzük meg, hogy a számlázásnál a
                ...  házszám rendben megjelenik-e.
    Check the billing housenumber input

Test the partner billing door visible
    [Documentation]  A teszt során azt nézzük meg, hogy a számlázásnál az
                ...  ajtó rendben megjelenik-e.
    Check the billing door input

Test the partner billing floor visible
    [Documentation]  A teszt során azt nézzük meg, hogy a számlázásnál az
                ...  emelet rendben megjelenik-e.
    Check the billing floor input

Test the new contact button visible
    [Documentation]  A teszt során azt nézzük meg, hogy a számlázásnál az
                ...  emelet rendben megjelenik-e.
    Check the new contact button

Test the contact firstname visible
    [Documentation]  A teszt során azt nézzük meg, hogy a kapcsolatnál
                ...  a keresztnév megjelenik-e.
    Check the contact firstname

Test the contact lastname visible
    [Documentation]  A teszt során azt nézzük meg, hogy a kapcsolatnál
                ...  a vezetéknév megjelenik-e.
    Check the contact lastname

Test the contact phone visible
    [Documentation]  A teszt során azt nézzük meg, hogy a kapcsolatnál
                ...  a telefonszám megjelenik-e.
    Check the contact phone

Test the contact email visible
    [Documentation]  A teszt során azt nézzük meg, hogy a kapcsolatnál
                ...  az email megjelenik-e.
    Check the contact email

Test the contact jobdescription visible
    [Documentation]  A teszt során azt nézzük meg, hogy a kapcsolatnál
                ...  a munkakör megjelenik-e.
    Check the contact jobdescription

Test the back button visible
    [Documentation]  A teszt során azt nézzük meg, hogy a visszagomb megjelenik-e
    Check the back button

Test the save button visible
    [Documentation]  A teszt során azt nézzük meg, hogy a mentes gomb megjelenik-e
    Check the save button