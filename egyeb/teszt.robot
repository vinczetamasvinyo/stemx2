
*** Settings ***
Library  SeleniumLibrary
Library  ../ExternalResources/mylibrary.py
Library  Collections
Library  robot.libraries.String
Resource  ../Resources/Common_resource.robot

*** Variables ***
&{Partner_data2}  Firstname=Vincze
            ...  Lastname=Tamás
            ...  Email=${EMPTY}
            ...  Companyname=Valami cég
            ...  Companylongname=Valami cégnév hosszú név
            ...  Companyregnumber=12123121212
            ...  Companycountry=Magyarország
            ...  Companyzipcode=1139
            ...  Companycity=Budapest
            ...  Companycounty=Pest
            ...  Companystreet=Füredi utca
            ...  Companyhousenumber=11/D
            ...  Companydoor=41
            ...  Companyfloor=10
            ...  Billingname=Vinyó számlázás
            ...  Taxnumber=1201212121212
            ...  Bankname=OTP
            ...  Banknumber=11773111-11222222
            ...  Iban=Iban szám
            ...  Swift=Swift szám
            ...  Billingcountry=Magyarország
            ...  Billingzipcode=1139
            ...  Billingcity=Budapest
            ...  Billingcounty=Pest
            ...  Billingstreet=Váci út
            ...  Billinghousenumber=99
            ...  Billingdoor=10
            ...  Billingfloor=6.
            ...  Contactfirstname=Vincze
            ...  Contactlastname=Tomi
            ...  Contactphonenumber=+36209602628
            ...  Contactemail=tamas.vincze@interticket.hu
            ...  Jobdesctiption=Tesztelés


*** Test Cases ***
Test 0
    [Tags]  most
    Begin web test  https://www.jegy.hu  chrome
    ${valami} =  get css attribute value2  //*[@id='newsletterLink']  color

Test1
    Create cim  ${Partner_data2}
    Create billingaddress  ${Partner_data2}
    log  ${address}
    ${cim} =  create address string  Hun  ${address}
    log  ${cim}
    log to console  ${cim}

*** Keywords ***
Get CSS Attribute Value2
    [Arguments]    ${locator}    ${attribute}
    # Get element using Xpath in JavaScript.
    # Note there are other options like getElementById/Class/Tag
    ${element}=    Set Variable    document.evaluate("${locator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
    # Get css attribute value using getComputedStyle()
    ${attribute_value}=    Execute Javascript    return window.getComputedStyle(${element},null).getPropertyValue('${attribute}');
    Log   ${attribute_value}
    [Return]    ${attribute_value}

Create cim
    [Arguments]  ${da}
    ${address} =  create dictionary
    ${country} =  szotarban van e  ${da}  Companycountry
    run keyword if  ${country}==${TRUE}  set to dictionary  ${address}  country  ${da.Companycountry}
    ${zip} =  szotarban van e  ${da}  Companyzipcode
    run keyword if  ${zip}==${TRUE}  set to dictionary  ${address}  zipcode  ${da.Companyzipcode}
    ${county} =  szotarban van e  ${da}  Companycounty
    run keyword if  ${county}==${TRUE}  set to dictionary  ${address}  county  ${da.Companycounty}
    ${city} =  szotarban van e  ${da}  Companycity
    run keyword if  ${city}==${TRUE}  set to dictionary  ${address}  city  ${da.Companycity}
    ${street} =  szotarban van e  ${da}  Companystreet
    run keyword if  ${street}==${TRUE}  set to dictionary  ${address}  street  ${da.Companystreet}
    ${housenumber} =  szotarban van e  ${da}  Companyhousenumber
    run keyword if  ${housenumber}==${TRUE}  set to dictionary  ${address}  housenumber  ${da.Companyhousenumber}
    ${door} =  szotarban van e  ${da}  Companydoor
    run keyword if  ${door}==${TRUE}  set to dictionary  ${address}  door  ${da.Companydoor}
    ${floor} =  szotarban van e  ${da}  Companyfloor
    run keyword if  ${floor}==${TRUE}  set to dictionary  ${address}  floor  ${da.Companyfloor}
    set suite variable  ${address}
    log  ${address}
    log to console  ${address}

Create billingaddress
    [Arguments]  ${da}
    ${baddress} =  create dictionary
    ${country} =  szotarban van e  ${da}  Billingcountry
    run keyword if  ${country}==${TRUE}  set to dictionary  ${baddress}  country  ${da.Billingcountry}
    ${zip} =  szotarban van e  ${da}  Billingzipcode
    run keyword if  ${zip}==${TRUE}  set to dictionary  ${baddress}  zipcode  ${da.Billingzipcode}
    ${county} =  szotarban van e  ${da}  Billingcounty
    run keyword if  ${county}==${TRUE}  set to dictionary  ${baddress}  county  ${da.Billingcounty}
    ${city} =  szotarban van e  ${da}  Billingcity
    run keyword if  ${city}==${TRUE}  set to dictionary  ${baddress}  city  ${da.Billingcity}
    ${street} =  szotarban van e  ${da}  Billingstreet
    run keyword if  ${street}==${TRUE}  set to dictionary  ${baddress}  street  ${da.Billingstreet}
    ${housenumber} =  szotarban van e  ${da}  Billinghousenumber
    run keyword if  ${housenumber}==${TRUE}  set to dictionary  ${baddress}  housenumber  ${da.Billinghousenumber}
    ${door} =  szotarban van e  ${da}  Companydoor
    run keyword if  ${door}==${TRUE}  set to dictionary  ${baddress}  door  ${da.Companydoor}
    ${floor} =  szotarban van e  ${da}  Companyfloor
    run keyword if  ${floor}==${TRUE}  set to dictionary  ${baddress}  floor  ${da.Companyfloor}
    set suite variable  ${baddress}
    log  ${baddress}
    log to console  ${baddress}

