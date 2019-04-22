*** Settings ***
Resource  ../../../../Resources/partner_adat_szerk_resource.robot
Suite Setup  Login and go to partner edit page  ${OLDAL_URL}  ${bogeszo}  ${box_office1_email_ok}  ${box_office1_password_ok }
Suite Teardown  common.End web test
Test Template  Check the text on the edit partner page


*** Variables ***
${LAN} =  Hun
${TYPE1} =  szoveg
${TYPE2} =  list

*** Test Cases ***
Companyname             ${TYPE1}  ${COMPANY_NAME_TEXT.${LAN}}                 ${PO_P_PAGE_LABEL_ID}               0
Companylongname         ${TYPE1}  ${COMPANY_LONG_NAME_TEXT.${LAN}}            ${PO_P_PAGE_LABEL_ID}               1
Companyregnumber        ${TYPE1}  ${COMPANY_REG_NUMBER_TEXT.${LAN}}           ${PO_P_PAGE_LABEL_ID}               2
Companycountry          ${TYPE2}  ${COMPANY_COUNTRY_TEXT.${LAN}}              ${PO_P_PAGE_LABEL_ID}               3
Companyzipcode          ${TYPE1}  ${COMPANY_ZIPCODE_TEXT.${LAN}}              ${PO_P_PAGE_LABEL_ID}               4
Companycity             ${TYPE1}  ${COMPANY_CITY_TEXT.${LAN}}                 ${PO_P_PAGE_LABEL_ID}               5
Companycounty           ${TYPE1}  ${COMPANY_COUNTY_TEXT.${LAN}}               ${PO_P_PAGE_LABEL_ID}               6
Companystreet           ${TYPE1}  ${COMPANY_STREET_TEXT.${LAN}}               ${PO_P_PAGE_LABEL_ID}               7
Companyhousenumber      ${TYPE1}  ${COMPANY_HOUSENUMBER_TEXT.${LAN}}          ${PO_P_PAGE_LABEL_ID}               8
Companydoor             ${TYPE1}  ${COMPANY_DOOR_TEXT.${LAN}}                 ${PO_P_PAGE_LABEL_ID}               9
Companyfloor            ${TYPE1}  ${COMPANY_FLOOR_TEXT.${LAN}}                ${PO_P_PAGE_LABEL_ID}               10
Billingname             ${TYPE1}  ${BILLING_NAME_TEXT.${LAN}}                 ${PO_P_PAGE_LABEL_ID}               11
Billingtaxnumber        ${TYPE1}  ${BILLING_TAXNUMBER_TEXT.${LAN}}            ${PO_P_PAGE_LABEL_ID}               12
Billingbank             ${TYPE1}  ${BILLING_BANK_TEXT.${LAN}}                 ${PO_P_PAGE_LABEL_ID}               13
Billingbanknumber       ${TYPE1}  ${BILLING_BANKNUMBER_TEXT.${LAN}}           ${PO_P_PAGE_LABEL_ID}               14
Billingiban             ${TYPE1}  ${BILLING_IBAN_TEXT.${LAN}}                 ${PO_P_PAGE_LABEL_ID}               15
Billingswift            ${TYPE1}  ${BILLING_SWIFT_TEXT.${LAN}}                ${PO_P_PAGE_LABEL_ID}               16
Billingcountry          ${TYPE2}  ${BILLING_COUNTRY_TEXT.${LAN}}              ${PO_P_PAGE_LABEL_ID}               17
Billingzipcode          ${TYPE1}  ${BILLING_ZIPCDOE_TEXT.${LAN}}              ${PO_P_PAGE_LABEL_ID}               18
Billingcity             ${TYPE1}  ${BILLING_CITY_TEXT.${LAN}}                 ${PO_P_PAGE_LABEL_ID}               19
Billingcounty           ${TYPE1}  ${BILLING_COUNTY_TEXT.${LAN}}               ${PO_P_PAGE_LABEL_ID}               20
Billingstreet           ${TYPE1}  ${BILLING_STREET_TEXT.${LAN}}               ${PO_P_PAGE_LABEL_ID}               21
Billinghousenumber      ${TYPE1}  ${BILLING_HOUSENUMBER_TEXT.${LAN}}          ${PO_P_PAGE_LABEL_ID}               22
Billingdoor             ${TYPE1}  ${BILLING_DOOR_TEXT.${LAN}}                 ${PO_P_PAGE_LABEL_ID}               23
Billingfloor            ${TYPE1}  ${BILLING_FLOOR_TEXT.${LAN}}                ${PO_P_PAGE_LABEL_ID}               24
ContactFirstname        ${TYPE1}  ${FIRSTNAMECONTACT_TEXT.${LAN}}             ${PO_P_PAGE_LABEL_ID}               25
ContactLastname         ${TYPE1}  ${SECONDNAMECONTACT_TEXT.${LAN}}            ${PO_P_PAGE_LABEL_ID}               26
Contactphone            ${TYPE1}  ${PHONECONTACT_TEXT.${LAN}}                 ${PO_P_PAGE_LABEL_ID}               27
Contactemail            ${TYPE1}  ${EMAILCONTACT_TEXT.${LAN}}                 ${PO_P_PAGE_LABEL_ID}               28
Contactjob              ${TYPE1}  ${JOBCONTACT_TEXT.${LAN}}                   ${PO_P_PAGE_LABEL_ID}               29
Backbutton              ${TYPE1}  ${BACKBUTTON_TEXT.${LAN}}                   ${PO_P_PAGE_BUTTON_BACK_TEXT_ID}    0
Savebutton              ${TYPE1}  ${SAVEBUTTON_TEXT.${LAN}}                   ${PO_P_PAGE_BUTTON_SAVE_TEXT_ID}    0
Deletebutton            ${TYPE1}  ${DELETBUTTON_TEXT.${LAN}}                  ${PO_P_PAGE_BUTTON_DELETE_TEXT_ID}  0
Companyinfotext         ${TYPE1}  ${COMPANY_DETEAILS_TEXT.${LAN}}             ${PO_P_PAGE_COMPANY_PROFILE_TEXT_ID}  0
Billinginfotext         ${TYPE1}  ${BILLING_TITLE_TEXT.${LAN}}                ${PO_PARTNERS_TITTLE_H3}                            1
Contactinfotext         ${TYPE1}  ${CONTACT_TITLE_TEXT.${LAN}}                ${PO_PARTNERS_TITTLE_H3}                            2
Firstcontactinfotext    ${TYPE1}  ${FIRSTCONTACT_TITLE_TEXT.${LAN}}           ${PO_PARTNERS_TITTLE_H4}                           0
Newcontact button       ${TYPE1}  ${NEW_CONTACT_BUTTON_TEXT.${LAN}}           ${PO_P_PAGE_CONTACT_BUTTON_TEXT_ID}   0
Edit title              ${TYPE1}  ${EDIT_TITLE_TEXT.${LAN}}                   ${PO_PARTNERS_TITLE_ID}               0

*** Keywords ***
