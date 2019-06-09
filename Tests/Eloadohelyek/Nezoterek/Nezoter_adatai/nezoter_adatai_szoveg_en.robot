*** Settings ***
Resource  ../../../../Resources/auditoriums_resource.robot

Suite Setup  Open browser and login and go to auditoriums and choose one  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
Suite Teardown  Common.End web test
Test Template  Check the text on the auditorium details page




*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}  language=${LAN}
${LAN} =  Hun

*** Test Cases ***
Audit tittle            text    ${AUDITDETAILS_TITTLE.${LAN}}                     0       ${PO_AUDITORIUMS_AUDIT_DETAILS_TITTLE}
Audit name tittle       text    ${AUDITDETAILS_AUDIT_NAME_TITTLE.${LAN}}          0       ${PO_AUDITORIUMS_AUDIT_DETAILS_SUB_TITTLE}
Audit address tittle    text    ${AUDITDETAILS_AUDIT_ADDRESS_TITTLE.${LAN}}       1       ${PO_AUDITORIUMS_AUDIT_DETAILS_SUB_TITTLE}
Audit capacity          text    ${AUDITDETAILS_AUDIT_CAPACITY_TITTLE.${LAN}}      2       ${PO_AUDITORIUMS_AUDIT_DETAILS_SUB_TITTLE}
Venue information       text    ${AUDITDETAILS_VENUE_INFORMATION_TITTLE.${LAN}}   3       ${PO_AUDITORIUMS_AUDIT_DETAILS_SUB_TITTLE}
Cancel button           text    ${AUDITDETAILS_BACK_BUTTON.${LAN}}                0       ${PO_AUDITORIUMS_AUDIT_DETAILS_CANCEL_BUTTON_TEXT_ID}
Delete button           text    ${AUDITDETAILS_DELETE_BUTTON.${LAN}}              0       ${PO_AUDITORIUMS_AUDIT_DETAILS_DELETE_BUTTON_TEXT_ID}
Edit button             text    ${AUDITDETAILS_EDIT_BUTTON.${LAN}}                2       ${PO_AUDITORIUMS_AUDIT_DETAILS_EDIT_BUTTON_TEXT_ID}

*** Keywords ***


