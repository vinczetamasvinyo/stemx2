*** Settings ***
Library  SeleniumLibrary

*** Variables ***
&{PARTNER_INVITE_PAGE_TITTLE_TEXT}  Hun=Felhasználó meghívása  En=Invite user
&{PARTNER_INVITE_PAGE_ICON_TEXT} =  Hun=FELHASZNÁLÓ INFORMÁCIÓI  En=USER INFO
&{PARTNER_INVITE_PAGE_FIRSTNAME_TEXT}  Hun=Keresztnév  En=First Name
&{PARTNER_INVITE_PAGE_LASTNAME_TEXT}  Hun=Vezetéknév  En=Last Name
&{PARTNER_INVITE_PAGE_EMAIL_TEXT}  Hun=E-mail cím  En=E-mail
&{PARTNER_INVITE_PAGE_BACK_BUTTON_TEXT}  Hun=Vissza a listához  En=Back to list
&{PARTNER_INVITE_PAGE_SAVE_BUTTON_TEXT}  Hun=Mentés  En=Save
${PO_INVITE_USER_TITLE_TEXT_ID} =  xpath=//*[@class="page-content"]//h1
${PO_INVITE_USER_Label_ID} =  xpath=//label
${PO_INVITE_USER_BACK_BUTTON_TEXT_ID} =  xpath=//cancel-button//span
${PO_INVITE_USER_SAVE_BUTTON_TEXT_ID} =  xpath=//save-button//span
