*** Settings ***
Resource  partner_invite_common_resource.robot
Library  ../ExternalResources/mylibrary.py

*** Keywords ***
Login and go to the new partner page and give all data
    [Arguments]  ${oldal}  ${bong}  ${email}  ${jelszo}  ${adat}
    Login and go to the new partner page  ${oldal}  ${bong}  ${email}  ${jelszo}
    Give the all partner data  ${adat}

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
    click element  xpath=//*[@formcontrolname="firstName"]
    #Give the billing bankname  ${ADATOK}[Bankname]
    #input text  //*[@formgroupname="company"]//*[@formcontrolname="name"]  ${max128}

    #Give the country2  Németország


    #
    #
    #  ${max128}
    #
    # ${max128}

    #  ${max128}
    # ${max128}
    #  ${max128}
    #  ${max128}
    #  ${max128}
    #  Magyarország
    #  ${max128}
    # ${max128}
    #  ${max128}
    #Give the billing street  ${max128}
    #Give the billing housenumber  ${max128}
    #Give the billing door  ${max128}
    #Give the billing floor  ${max128}
    #Give the contact phone  +36209602628
    #input text  xpath=//*[@formcontrolname="jobDescription"]  ${max128}
    #input text  //*[@formarrayname="contacts"]//input[@formcontrolname="firstName"]  ${max128}
    #input text  //*[@formarrayname="contacts"]//input[@formcontrolname="lastName"]  ${max128}
    #input text  xpath=//*[@formarrayname="contacts" ]//input[@formcontrolname="email"]   valami@valami.hu
    #click element  //*[@formgroupname="company"]//*[@formcontrolname="name"]
    sleep  10s


