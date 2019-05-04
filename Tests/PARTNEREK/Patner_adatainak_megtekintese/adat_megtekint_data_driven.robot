*** Settings ***
Resource  ../../../Resources/partner_adat_megtekintese_resource.robot

Suite Setup   Login go partners page and choose one partner details  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
Suite Teardown  common.End web test
Test Template  Check the text on the partner details

*** Variables ***
${LAN}=  Hun
&{LOGIN}  email=${box_office1_email_ok}  password=${box_office1_password_ok }
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}
${index} =  0

*** Test Cases ***
Page tittle             2  ${TITLE_OF_PARTNERS_DETAILS.${LAN}}  0
company longname		0  ${COMPANY_LONGNAME_TEXT.${LAN}}		1
company regnumber		0  ${COMPANY_REGNUMBER_TEXT.${LAN}}	    2
company address			0  ${COMPANY_ADDRESS_TEXT.${LAN}}		3
company status			0  ${COMPANY_STATUS_TEXT.${LAN}}		4
billing name			0  ${BILLING_NAME_TEXT.${LAN}}			5
billing tax				0  ${BILLING_TAX_TEXT.${LAN}}			6
billing bankname		0  ${BILLING_BANKNAME_TEXT.${LAN}}		7
billing banknumber		0  ${BILLING_BANKNUMBER_TEXT.${LAN}}	8
IBAN					0  ${BILLING_IBAN_TEXT.${LAN}}			9
SWIFT					0  ${BILLING_SWIFT_TEXT.${LAN}}		    10
billing address			0  ${BILLING_ADDRESS_TEXT.${LAN}}		11
contact firstname		0  ${CONTACT_FIRSTNAME_TEXT.${LAN}}	    12
contact lastname		0  ${CONTACT_LASTNAME_TEXT.${LAN}}		13
contact phone			0  ${CONTACT_PHONE_TEXT.${LAN}}		    14
e-mail					0  ${CONTACT_EMAIL_TEXT.${LAN}}		    15
contact job				0  ${CONTACT_JOB_TEXT.${LAN}}			16
Companyinfoicon         1  ${TITLE_OF_COMPANYINFO.${LAN}}        0
Billinginfoicon         1  ${BILLING_ICON_TEXT.${LAN}}           1
Contactinfoicon         1  ${CONTAct_ICON_TEXT.${LAN}}           2
Back button             3  ${BUTTON_BACK_TEXT.${LAN}}            ${EMPTY}
Delete button           4  ${BUTTON_DELETE_TEXT.${LAN}}         ${EMPTY}

*** Keywords ***
