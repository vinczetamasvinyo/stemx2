*** Settings ***
Resource  PO/po_partners.robot
Resource  Common_resource.robot

*** Keywords ***
Check the partner firstname input
    [Documentation]  Megnézi, hogy a partnernél a keresztnév rendben megjelenik-e.
    Get partner firstname input is visiable

Check the partner lastnem input
    [Documentation]  Megnézi, hogy a partnernél a vezetéknél rendben megjelenik-e.
    Get partner lastname input is visiable

Check the partner email input
    [Documentation]  Megnézi, hogy a partnernél az email cím megjelenik-e.
    Get partner email input is visiable

Check the company company input
    [Documentation]  Megnézi, hogy a partnernél az cégnév megjelenik-e.
    Get company company name input is visiable

Check the company long name input
    [Documentation]  Megnézi, hogy a partnernél a cégnév hosszú neve megjelenik-e.
    Get company company long name input is visiable

Check the company country input
    [Documentation]  Megnézi, hogy a partnernél az ország megjelenik-e.
    Get company country input is visiable

Check the company zipcode input
    [Documentation]  Megnézi, hogy a partnernél az irányítószám megjelenik-e.
    Get company zipcode input is visiable

Check the company city input
    [Documentation]  Megnézi, hogy a partnernél a város megjelenik-e.
    Get company city input is visiable

Check the company county input
    [Documentation]  Megnézi, hogy a partnernél a megye megjelenik-e.
    Get company county input is visiable

Check the company street input
    [Documentation]  Megnézi, hogy a partnernél az utca megjelenik-e.
    Get company street input is visiable

Check the company housenumber input
    [Documentation]  Megnézi, hogy a partnernél a házszám megjelenik-e.
    Get company housenumber input is visiable

Check the company door input
    [Documentation]  Megnézi, hogy a partnernél az ajtó rendben megjelenik-e.
    Get company door input is visiable

Check the company floor input
    [Documentation]  Megnézi, hogy a partnernél az emelet rendben megjelenik-e.
    Get company floor input is visiable

Check the billing name input
    [Documentation]  Megnézi, hogy a számlázásnál a cégnév rendben megjelenik-e.
    Get billing name input is visiable

Check the billing taxnumber input
    [Documentation]  Megnézi, hogy a számlázásnál az adószám megjelenik-e.
    Get billing taxnumber input is visiable

Check the billing bank name input
    [Documentation]  Megnézi, hogy a számlázásnál a banknév megjelenik-e.
    Get billing bank name input is visiable

Check the billing bankaccountnumber input
    [Documentation]  Megnézi, hogy a számlázásnál a bankszámlaszám megjelenik-e.
    Get billing bankaccountnumber input is visiable

Check the billing iban input
    [Documentation]  Megnézi, hogy a számlázásnál a iban megjelenik-e.
    Get billing iban input is visiable

Check the billing swift input
    [Documentation]  Megnézi, hogy a számlázásnál a swift megjelenik-e.
    Get billing swift input is visiable

Check the billing country input
    [Documentation]  Megnézi, hogy a számlázásnál a country megjelenik-e.
    Get billing country input is visiable

Check the billing zipcode input
    [Documentation]  Megnézi, hogy a számlázásnál az irányítószám megjelenik-e.
    Get billing zipcode input is visiable

Check the billing city input
    [Documentation]  Megnézi, hogy a számlázásnál a város megjelenik-e.
    Get billing city input is visiable

Check the billing county input
    [Documentation]  Megnézi, hogy a számlázásnál a megye megjelenik-e.
    Get billing county input is visiable

Check the billing street input
    [Documentation]  Megnézi, hogy a számlázásnál az utca megjelenik-e.
    Get billing street input is visiable

Check the billing housenumber input
    [Documentation]  Megnézi, hogy a számlázásnál a házszám megjelenik-e.
    Get billing housenumber input is visiable

Check the billing door input
    [Documentation]  Megnézi, hogy a számlázásnál az ajtó megjelenik-e.
    Get billing door input is visiable

Check the billing floor input
    [Documentation]  Megnézi, hogy a számlázásnál a floor megjelenik-e.
    Get billing floor input is visiable

Check the new contact button
    [Documentation]  Megnézi, hogy az új kontatkt hozzáadása gomb megjelenik-e.
    Get new contact button is visiable

Check the contact firstname
    [Documentation]  Megnézi, hogy a kontakton belül a keresztnév megjelenik-e.
    Get contact firstname input is visiable

Check the contact lastname
    [Documentation]  Megnézi, hogy a kontakton belül a vezetéknév megjelenik-e.
    Get contact lastname input is visiable

Check the contact phone
    [Documentation]  Megnézi, hogy a kontakton belül a telefonszám megjelenik-e.
    Get contact phone input is visiable

Check the contact email
    [Documentation]  Megnézi, hogy a kontakton belül az email megjelenik-e.
    Get contact email input is visiable

Check the contact jobdescription
    [Documentation]  Megnézi, hogy a kontakton belül az munkakör megjelenik-e.
    Get contact jobdescription input is visible

Check the back button
    [Documentation]  Megnézi, hogy a vissza gomb megjelenik-e.
    Get back button is visible

Check the save button
    [Documentation]  Megnézi, hogy a mentes gomb rendben megjelenik-e.
    Get save button is visible