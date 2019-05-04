*** Settings ***
Resource  ../../../Resources/partner_letre_folyamat_resource.robot
Resource  ../../../Resources/partner_adat_megtekintese_resource.robot


#Suite Setup  Login and create partners data  ${box_office1_email_ok}  ${box_office1_password_ok}
Suite Setup  Login and create partners data  ${LOGIN_DATA}
Test Template  Ellenorzes

*** Variables ***
${LAN} =  Hun
&{LOGIN_DATA}  email=${box_office1_email_ok1}  password=${box_office1_password_ok1}  partner=${VARIABLES_PARTNER}


*** Test Cases ***
Companyname         ${LAN}  szoveg      ${Partner_data2.Companyname}             0
Companylongname     ${LAN}  szoveg      ${Partner_data2.Companylongname}         1
Companyregnumber    ${LAN}  szoveg      ${Partner_data2.Companyregnumber}        2
Companyaddress      ${LAN}  cim         ${address}                               3
Companystatus       ${LAN}  szoveg      ${COMPANYSTATUS.${LAN}}                  4
Billingname         ${LAN}  szoveg      ${Partner_data2.Billingname}             5
Taxnumber           ${LAN}  szoveg      ${Partner_data2.Taxnumber}               6
Bankname            ${LAN}  szoveg      ${Partner_data2.Bankname}                7
Banknumber          ${LAN}  szoveg      ${Partner_data2.Banknumber}              8
IBAN                ${LAN}  szoveg      ${Partner_data2.Iban}                    9
Swift               ${LAN}  szoveg      ${Partner_data2.Swift}                   10
Billingaddress      ${LAN}  cim         ${baddress}                              11
ContactFirstname    ${LAN}  szoveg      ${Partner_data2.Contactfirstname}        12
ContactLastname     ${LAN}  szoveg      ${Partner_data2.Contactlastname}         13
ContactPhone        ${LAN}  szoveg      ${Partner_data2.Contactphonenumber}      14
Contactemail        ${LAN}  szoveg      ${Partner_data2.Contactemail}            15
Jobdescription      ${LAN}  szoveg      ${Partner_data2.Jobdesctiption}          16



*** Keywords ***
Create cim2
    [Arguments]  ${da}
    ${address} =  create dictionary
    ${zip} =  szotarban van e  ${da}  Zipcode
    run keyword if  ${zip}==${TRUE}  set to dictionary  ${address}  ${zipcode}  ${da.Zipcode}
    set suite variable  ${address}
    log  ${address}

