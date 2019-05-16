*** Settings ***
Resource  ../../../../Resources/partner_letre_folyamat_resource.robot
Resource  ../../../../Resources/partner_adat_megtekintese_resource.robot

Suite Setup  Login and create partners data2  ${LOGIN_DATA}  ${Partner_data1}
Suite Teardown  common.End web test
Test Template  Ellenorzes

*** Variables ***
${LAN} =  Hun
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}  language=${LAN}



*** Test Cases ***
Companyname         ${LAN}  szoveg      ${Partner_data1.Companyname}             0
Companylongname     ${LAN}  szoveg      ${Partner_data1.Companylongname}         1
Companyregnumber    ${LAN}  szoveg      ${Partner_data1.Companyregnumber}        2
Companyaddress      ${LAN}  cim         ${address}                               3
Companystatus       ${LAN}  szoveg      ${COMPANYSTATUS.${LAN}}                  4
Billingname         ${LAN}  szoveg      ${Partner_data1.Billingname}             5
Taxnumber           ${LAN}  szoveg      ${Partner_data1.Taxnumber}               6
Bankname            ${LAN}  szoveg      ${Partner_data1.Bankname}                7
Banknumber          ${LAN}  szoveg      ${Partner_data1.Banknumber}              8
IBAN                ${LAN}  szoveg      ${Partner_data1.Iban}                    9
Swift               ${LAN}  szoveg      ${Partner_data1.Swift}                   10
Billingaddress      ${LAN}  cim         ${baddress}                              11
ContactFirstname    ${LAN}  szoveg      ${Partner_data1.Contactfirstname}        12
ContactLastname     ${LAN}  szoveg      ${Partner_data1.Contactlastname}         13
ContactPhone        ${LAN}  szoveg      ${Partner_data1.Contactphonenumber}      14
Contactemail        ${LAN}  szoveg      ${Partner_data1.Contactemail}            15
Jobdescription      ${LAN}  szoveg      ${Partner_data1.Jobdesctiption}          16



*** Keywords ***
Create cim2
    [Arguments]  ${da}
    ${address} =  create dictionary
    ${zip} =  szotarban van e  ${da}  Zipcode
    run keyword if  ${zip}==${TRUE}  set to dictionary  ${address}  ${zipcode}  ${da.Zipcode}
    set suite variable  ${address}
    log  ${address}

