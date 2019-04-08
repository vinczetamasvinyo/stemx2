*** Settings ***
Library  SeleniumLibrary
Resource  partner_invite_common_resource.robot
Resource  Common.robot
Resource  variables/new_partner_variables.robot


*** Variables ***

*** Keywords ***
Check the firstname text on the new partner page
    [Documentation]  kdkdkd
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the firtname text
    should be equal  ${szoveg}  ${szoveg2}

Check the veznev text on the new partner page
    [Documentation]  Leellenőrizi a vezeték szöveég, hogy megfelelő-e
                ...  amit paraméterben kap.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the secondname label text
    should be equal  ${szoveg}  ${szoveg2}

Check the email text on the new partner page
    [Documentation]  Leellenőrizi a email cím szövegét, hogy megfelelő-e
                ...  amit paraméterben kap.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the email address text
    should be equal  ${szoveg}  ${szoveg2}

Check the page title text on the new partner page
    [Documentation]  Leellenőrzi a partner létrehozás oldal címét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.get the page title
    should be equal  ${szoveg}  ${szoveg2}

Check the partner profile block title text on the new partner page
    [Documentation]  Leellenőrzi a partner profile blokk-hoz tartozó címet
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the partner profile block title
    should be equal  ${szoveg}  ${szoveg2}

Check the company details block title text on the new partner page
    [Documentation]  Leellenőrzi a cég blokk-hoz tartozó címet
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the company profile block title
    should be equal  ${szoveg}  ${szoveg2}

Check the company name text on the new partner page
    [Documentation]  Leellenőrzi a cég nevéhez tartozó label szövegét
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the company name text
    should be equal  ${szoveg}  ${szoveg2}

Check the company long name text on the new partner page
    [Documentation]  Leellenőrzi a cég nevéhez tartozó label szövegét
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the company long name text
    should be equal  ${szoveg}  ${szoveg2}

Check the company reg number text on the new partner page
    [Documentation]  Leellenőrzi a cég-hez tartozó regisztrációs számot.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the company reg number text
    should be equal  ${szoveg}  ${szoveg2}

Check the company country text on the new partner page
    [Documentation]  Leellenőrzi a cég-hez tartozó ország text-jét
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the company country text
    should be equal  ${szoveg}  ${szoveg2}

Check the company zipcode
    [Documentation]  Leellenőrzi a cég-hez tartozó irányítószám text-jét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the company zipcode text
    should be equal  ${szoveg}  ${szoveg2}

Check the company city text
    [Documentation]  Leellenőrzi a cég-hez tartozó település text-jét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the city text
    should be equal  ${szoveg}  ${szoveg2}

Check the company county text
    [Documentation]  Leellenőrzi a cég-hez tartozó település text-jét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the county text
    should be equal  ${szoveg}  ${szoveg2}

Check the company street text
    [Documentation]  Leellenőrzi a céghez tartozó street mező label-jét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the street text
    should be equal  ${szoveg}  ${szoveg2}

Check the company housenumber text
    [Documentation]  Leellenőrzi a céghez tartozó street mező label-jét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the housenumber text
    should be equal  ${szoveg}  ${szoveg2}

Check the company door text
    [Documentation]  Leellenőrzi a céghez tartozó ajtó mező label-jét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the door text
    should be equal  ${szoveg}  ${szoveg2}

Check the company floor text
    [Documentation]  Leellenőrzi a céghez tartozó emelet mező label-jét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the floor text
    should be equal  ${szoveg}  ${szoveg2}

Check the billing title text
    [Documentation]  Leellenőrzi a számlázási blokk címnek a szövegét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the billing title text
    should be equal  ${szoveg}  ${szoveg2}

Check the billing name text
    [Documentation]  Leellenőrzi a számlázási blokk-on belüli cím szövegét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the billing name text
    should be equal  ${szoveg}  ${szoveg2}

Check the billing taxnumber text
    [Documentation]  Leellenőrzi a számlázási blokk-on belüli az adószám szövegét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the billing taxnumber text
    should be equal  ${szoveg}  ${szoveg2}

Check the billing bank text
    [Documentation]  Leellenőrzi a számlázási blokk-on belüli az bank szövegét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the billing bank text
    should be equal  ${szoveg}  ${szoveg2}

Check the billing banknumber text
    [Documentation]  Leellenőrzi a számlázási blokk-on belüli a bankszámlaszám szövegét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the billing banknumber text
    should be equal  ${szoveg}  ${szoveg2}

Check the billing iban text
    [Documentation]  Leellenőrzi a számlázási blokk-on belüli az iban szövegét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the billing iban text
    should be equal  ${szoveg}  ${szoveg2}

check the billing swift text
    [Documentation]  Leellenőrzi a számlázási blokk-on belüli a swift szövegét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the billing swift text
    should be equal  ${szoveg}  ${szoveg2}

Check the billing country text
    [Documentation]  Leellenőrzi a számlázási blokk-on belüli a ország szövegét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the billing country text
    should be equal  ${szoveg}  ${szoveg2}

Check the billing zipcode text
    [Documentation]  Leellenőrzi a számlázási blokk-on belüli a ország szövegét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the billing zipcode text
    should be equal  ${szoveg}  ${szoveg2}

Check the billing city text
    [Documentation]  Leellenőrzi a számlázási blokk-on belüli a város szövegét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the billing city text
    should be equal  ${szoveg}  ${szoveg2}

Check the billing county text
    [Documentation]  Leellenőrzi a számlázási blokk-on belüli a megye szövegét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the billing county text
    should be equal  ${szoveg}  ${szoveg2}

Check the billing street text
    [Documentation]  Leellenőrzi a számlázási blokk-on belüli az utca szövegét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the billing street text
    should be equal  ${szoveg}  ${szoveg2}

Check the billing housenumber text
    [Documentation]  Leellenőrzi a számlázási blokk-on belüli a házszám szövegét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the billing housenumber text
    should be equal  ${szoveg}  ${szoveg2}

Check the billing door text
    [Documentation]  Leellenőrzi a számlázási blokk-on belüli az ajtó szövegét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the billing door text
    should be equal  ${szoveg}  ${szoveg2}

Check the billing floor text
    [Documentation]  Leellenőrzi a számlázási blokk-on belüli a floor szövegét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the billing floor text
    should be equal  ${szoveg}  ${szoveg2}

Check the new contact button text
     [Documentation]  Leellenőrzi az új konakt hozzáadása gomb szövegét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the new contact button text
    should be equal  ${szoveg}  ${szoveg2}

Check the contact title text
    [Documentation]  Leellenőrzi az elérhetőségek címének a szövegét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the contact title text
    should be equal  ${szoveg}  ${szoveg2}

Check the first contact title text
    [Documentation]  Leellenőrzi a kontakt rész címének a szövegét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the firt contact Title text
    should be equal  ${szoveg}  ${szoveg2}

Check the contact firstname text
    [Documentation]  Leellenőrzi a kontakt részben lévő keresztnév mező labeljének
                ...  a szövegét
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the contact firstname text
    should be equal  ${szoveg}  ${szoveg2}

Check the contact secondname text
    [Documentation]  Leellenőrzi a kontakt részben lévő vezetéknév mező labeljének
                ...  a szövegét
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the contact secondname text
    should be equal  ${szoveg}  ${szoveg2}

Check the contact phone text
    [Documentation]  Leellenőrzi a kontakt részben lévő Telefonszám mező labeljének
                ...  a szövegét
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the contact phone text
    should be equal  ${szoveg}  ${szoveg2}

Check the contact email text
    [Documentation]  Leellenőrzi a kontakt részben lévő email mező labeljének
                ...  a szövegét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the contact email text
    should be equal  ${szoveg}  ${szoveg2}

Check the job text
    [Documentation]  Leellenőrzi a kontakt részben lévő munkakör mező labeljének
                ...  a szövegét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the job text
    should be equal  ${szoveg}  ${szoveg2}

Check the back button text
    [Documentation]  Leellenőrzi a vissza a listához gomb szövegét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get the back button text
    should be equal  ${szoveg}  ${szoveg2}

Check the save button text
    [Documentation]  Leellenőrzi a vissza a listához gomb szövegét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  po_partners.Get he save button text
    should be equal  ${szoveg}  ${szoveg2}
