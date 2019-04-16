*** Settings ***
Resource  partner_invite_common_resource.robot
Library  ../ExternalResources/mylibrary.py
Resource  partner_adat_szerk_resource.robot

*** Keywords ***
Finish the registration in the token page
    [Documentation]  A token oldalon befejezi a regisztrációt.
                ...  A folyamatban megadja a két megfelelő jelszót,
                ...  majd megvárja amíg a belépési oldal betöltődik.
                ...  A jelszót paraméterben kapja meg.
    [Arguments]  ${jelszo}
    Wait the token page is loaded
    PO_login.Give the password  ${jelszo}
    PO_login.Give the same password  ${jelszo}
    po_login.Push the regisztracio megerositese button
    Wait the succes message and click
    po_login.Waiting the login pager loaded

Login and go to partner details page
    [Arguments]  ${old}  ${bong}  ${em}  ${pas}
    login_resource.Open Vk login page  ${old}  ${bong}
    Give login date and login  ${em}  ${pas}
    Go to the partners page via menu

Login and go to the partners page
    [Arguments]  ${old}  ${bong}  ${em}  ${pas}
    login_resource.Open Vk login page  ${old}  ${bong}
    Give login date and login  ${em}  ${pas}
    Go to the partners page via menu

Login and go the new partner page
    [Arguments]  ${em}  ${pas}
    Give login date and login  ${em}  ${pas}
    Go to the partners page via menu

Open browser and Login and after go to the partners page
    [Arguments]  ${old}  ${bong}  ${em}  ${pas}
    login_resource.Open Vk login page  ${old}  ${bong}
    Give login date and login  ${em}  ${pas}
    Go to the partners page via menu


Login and go to the partners page and change lan
    [Arguments]  ${old}  ${bong}  ${em}  ${pas}
    login_resource.Open Vk login page  ${old}  ${bong}
    Give login date and login  ${em}  ${pas}
    Go to the partners page via menu
    Change the language to English via mymenu

Login and go to partner edit page
    [Arguments]  ${old}  ${bong}  ${em}  ${pas}
    login_resource.Open Vk login page  ${old}  ${bong}
    Give regeistration data and click the login button  ${em}  ${pas}
    Check the login succes or not
    Go to the partners page via menu
    Chose elem and go the the edit page

Login and go to the new partner page and give all data
    [Arguments]  ${oldal}  ${bong}  ${email}  ${jelszo}  ${adat}
    Login and go to the new partner page  ${oldal}  ${bong}  ${email}  ${jelszo}
    Give the all partner data  ${adat}

Login and go new partner page and give data and change language
    [Arguments]  ${oldal}  ${bong}  ${email}  ${jelszo}  ${adat}
    Login and go to the new partner page  ${oldal}  ${bong}  ${email}  ${jelszo}
    Change the language to English via mymenu
    Give the all partner data  ${adat}
    Click the firstanme input
    sleep  2s


Login and go to the new partner page
    [Arguments]  ${oldal}  ${bong}  ${email}  ${jelszo}
    Login and go to the partners page  ${oldal}  ${bong}  ${email}  ${jelszo}
    Click the new partner
    Waiting the new partner page loaded

Login and go to the new paratner page and change language to english
    [Arguments]  ${oldal}  ${bong}  ${email}  ${jelszo}
    Login and go to the partners page  ${oldal}  ${bong}  ${email}  ${jelszo}
    Click the new partner
    Waiting the new partner page loaded
    Change the language to English via mymenu

Check the error message appear and the error text value
    [Documentation]  Megnézzük, hogy megjelenik-e a hibaüzenet,
                ...  illetve az error hibaüzenet megfelelőe.
    [Arguments]  ${veznev}  ${hibaszoveg}
    ${van3}  ${van4} =  check the elem contain in parent2  ${veznev}  .//app-show-errors/ul/li
    should be true  ${van3}
    ${hibaszoveg2} =  get text  ${van4}
    #element should be visible  ${van4}
    log  ${hibaszoveg2}
    should be true  "${hibaszoveg}" == "${hibaszoveg2}"

Reload the page
    [Documentation]  Újratölti az aktuális oldalt és megvárja amig az betöltődik.
    reload page
    po_mymenu.Waiting the page loaded

Give the all partner data
    [Arguments]  ${ADATOK}
    #run keyword if  '${ADATOK}[Firstname][Required]'=='Y'  give the firstname  ${ADATOK}[Firstname][Value]
    ${vfirstname} =  szotarban van e  ${ADATOK}  Firstname
    run keyword if  ${vfirstname}==${TRUE}  give the firstname  ${ADATOK}[Firstname]
    ${vlastname} =  szotarban van e  ${ADATOK}  Lastname
    run keyword if  ${vlastname}==${TRUE}  give the lastname  ${ADATOK}[Lastname]
    ${vemail} =  szotarban van e  ${ADATOK}  Email
    run keyword if  ${vemail}==${TRUE}  give the email of partner  ${ADATOK}[Email]
    ${vcompanyname} =  szotarban van e  ${ADATOK}  Companyname
    run keyword if  ${vcompanyname}==${TRUE}  Give the company name in new partner page  ${ADATOK}[Companyname]
    #Give the company name in new partner page  ${ADATOK}[Companyname]
    ${vcompanylongname} =  szotarban van e  ${ADATOK}  Companylongname
    run keyword if  ${vcompanylongname}==${TRUE}  Give the copany long name  ${ADATOK}[Companylongname]
    #Give the copany long name  ${ADATOK}[Companylongname]
    ${companyregnumber} =  szotarban van e  ${ADATOK}  Companyregnumber
    run keyword if  ${companyregnumber}==${TRUE}  Give the registration number  ${ADATOK}[Companyregnumber]
    #Give the registration number  ${ADATOK}[Companyregnumber]
    ${vcompanycountry} =  szotarban van e  ${ADATOK}  Companycountry
    run keyword if  ${vcompanycountry}==${TRUE}  Give the country2  ${ADATOK}[Companycountry]
    #Give the country2  ${ADATOK}[Companycountry]
    ${companyzipcode} =  szotarban van e  ${ADATOK}  Companyzipcode
    run keyword if  ${companyzipcode}==${TRUE}  Give the zipcode  ${ADATOK}[Companyzipcode]
    #Give the zipcode  ${ADATOK}[Companyzipcode]
    ${companycity} =  szotarban van e  ${ADATOK}  Companycity
    run keyword if  ${companycity}==${TRUE}  Give the city  ${ADATOK}[Companycity]
    #Give the city  ${ADATOK}[Companycity]
    ${companycounty} =  szotarban van e  ${ADATOK}  Companycounty
    run keyword if  ${companycounty}==${TRUE}  Give the county  ${ADATOK}[Companycounty]
    #Give the county  ${ADATOK}[Companycounty]
    ${companystreet} =  szotarban van e  ${ADATOK}  Companystreet
    run keyword if   ${companystreet}==${TRUE}  Give the street  ${ADATOK}[Companystreet]
    #Give the street  ${ADATOK}[Companystreet]
    ${companyhousenumber} =  szotarban van e  ${ADATOK}  Companyhousenumber
    run keyword if  ${companyhousenumber}==${TRUE}  Give the housenumber  ${ADATOK}[Companyhousenumber]
    #Give the housenumber  ${ADATOK}[Companyhousenumber]
    ${companydoor} =  szotarban van e  ${ADATOK}  Companydoor
    run keyword if  ${companydoor}==${TRUE}  Give the door  ${ADATOK}[Companydoor]
    #Give the door  ${ADATOK}[Companydoor]
    ${companyfloor} =  szotarban van e  ${ADATOK}  Companyfloor
    run keyword if  ${companyfloor}==${TRUE}  Give the floor  ${ADATOK}[Companyfloor]
    #Give the floor  ${ADATOK}[Companyfloor]
    ${billingname} =  szotarban van e  ${ADATOK}  Billingname
    run keyword if  ${billingname}==${TRUE}  Give the billing name  ${ADATOK}[Billingname]
    #Give the billing name  ${ADATOK}[Billingname]
    ${taxnumber} =  szotarban van e  ${ADATOK}  Taxnumber
    run keyword if  ${taxnumber}==${TRUE}  Give the billing taxnumber  ${ADATOK}[Taxnumber]
    #Give the billing taxnumber  ${ADATOK}[Taxnumber]
    ${bankname} =  szotarban van e  ${ADATOK}  Bankname
    run keyword if  ${bankname}==${TRUE}  Give the billing bankname  ${ADATOK}[Bankname]
    ${banknumber} =  szotarban van e  ${ADATOK}  Banknumber
    run keyword if  ${banknumber}==${TRUE}   give the billing banknumber   ${ADATOK}[Banknumber]
    #Give the billing bankname   ${ADATOK}[Banknumber]
    ${iban} =  szotarban van e  ${ADATOK}  Iban
    run keyword if  ${iban}==${TRUE}  Give the billing iban number  ${ADATOK}[Iban]
    ${swift} =  szotarban van e  ${ADATOK}  Swift
    run keyword if  ${swift}==${TRUE}  Give the billing swift number  ${ADATOK}[Swift]
    #Give the billing swift number  ${ADATOK}[Swift]
    ${bcountry} =  szotarban van e  ${ADATOK}  Billingcountry
    run keyword if  ${bcountry}==${TRUE}  Give the billing country2  ${ADATOK}[Billingcountry]
    # Give the billing country2
    #Give the billing iban number  ${ADATOK}[Iban]
    ${billingzipcode} =  szotarban van e  ${ADATOK}  Billingzipcode
    run keyword if  ${billingzipcode}==${TRUE}  Give the billing zipcode  ${ADATOK}[Billingzipcode]

    ${billingcity} =  szotarban van e  ${ADATOK}  Billingcity
    run keyword if  ${billingcity}==${TRUE}  Give the billing city   ${ADATOK}[Billingcity]
    ${billingcounty} =  szotarban van e  ${ADATOK}  Billingcounty
    run keyword if  ${billingcounty}==${TRUE}  Give the billing county  ${ADATOK}[Billingcounty]
    # Give the billing county  ${ADATOK}[Billingcounty]
    ${billingstreet} =  szotarban van e  ${ADATOK}  Billingstreet
    run keyword if  ${billingstreet}==${TRUE}  Give the billing street  ${ADATOK}[Billingstreet]
    ${billinghousenumber} =  szotarban van e  ${ADATOK}  Billinghousenumber
    run keyword if  ${billinghousenumber}==${TRUE}  Give the billing housenumber  ${ADATOK}[Billinghousenumber]
    ${billingdoor} =  szotarban van e  ${ADATOK}  Billingdoor
    run keyword if  ${billingdoor}==${TRUE}  Give the billing door  ${ADATOK}[Billingdoor]
    ${billingfloor} =  szotarban van e  ${ADATOK}  Billingfloor
    run keyword if  ${billingfloor}==${TRUE}  Give the billing floor   ${ADATOK}[Billingfloor]
    ${contactfirstname} =  szotarban van e  ${ADATOK}  Contactfirstname
    run keyword if  ${contactfirstname}==${TRUE}  Give the contact firstname  ${ADATOK}[Contactfirstname]
    ${contactlastname} =  szotarban van e  ${ADATOK}  Contactlastname
    run keyword if  ${contactlastname}==${TRUE}  Give the contact lastname  ${ADATOK}[Contactlastname]
    ${contactphonenumber} =  szotarban van e  ${ADATOK}  Contactphonenumber
    run keyword if  ${contactphonenumber}==${TRUE}  Give the contact phone  ${ADATOK}[Contactphonenumber]
    ${contactemail} =  szotarban van e  ${ADATOK}  Contactemail
    run keyword if  ${contactemail}==${TRUE}  Give the contact email  ${ADATOK}[Contactemail]
    ${jobdescription} =  szotarban van e  ${ADATOK}  Jobdesctiption
    run keyword if  ${jobdescription}==${TRUE}  Give the jobdescription  ${ADATOK}[Jobdesctiption]
    #TODO: Ez még ki kell innen tenni.
    #click element  xpath=//*[@formcontrolname="firstName"]
    #sleep  2s



