*** Settings ***
Resource  ../../../Resources/partner_adat_megtekintese_resource.robot

Suite Setup   Login go partners page and choose one partner details  ${OLDAL_URL}  ${bogeszo}  ${LOGIN}
Suite Teardown  common.End web test

*** Variables ***
${LAN}=  Hun
&{LOGIN}  email=${box_office1_email_ok}  password=${box_office1_password_ok }


*** Test Cases ***
Test the title of partner details
    [Documentation]  A teszt a partner megtekintése oldalon ellenőrizzük a címet.
    [Tags]  Medium
    Check the title of partner details  ${TITLE_OF_PARTNERS_DETAILS.${LAN}}

Test the company info text
    [Documentation]  A teszt során a céginformáció block címét ellenőrizzük.
    [Tags]  Medium
    Check the company info text  ${TITLE_OF_COMPANYINFO.${LAN}}

Test the company name text
    [Documentation]  A teszt során megnézzük a céginformáción belül lévő
    ...  Cégnév tittle.
    [Tags]  Medium
    Check the company name text   ${COMPANY_NAME_TEXT.${LAN}}

Test the company long name text
    [Documentation]  A teszt soránt a partner adatainak a megtekintése oldalon
                ...  ellenőrizzük a cég hosszú nevének a szövegét.
    [Tags]  Medium
    Check the company long name text  ${COMPANY_LONGNAME_TEXT.${LAN}}

Test the company regnumber text
    [Documentation]  A teszt soránt a partner adatainak a megtekintése oldalon
                ...  ellenőrizzük a cégjegyzékszám szövegét.
    [Tags]  Medium
    Check the company regnumber text on the partner details  ${COMPANY_REGNUMBER_TEXT.${LAN}}

Test the company adress text
    [Documentation]  A teszt során azt nézzük meg, hogy partner adatainak
                ...  a megtekintése oldalon ellenőrizzük a cím szövegét.
    [Tags]  Medium
    Check the company address text on the partner details  ${COMPANY_ADDRESS_TEXT.${LAN}}

Test the company address text
    [Documentation]  A teszt során azt nézzük meg, hogy partner adatainak
                ...  a megtekintése oldalon ellenőrizzük a cím szövegét.
    [Tags]  Medium
    Check the company address text on the partner details  ${COMPANY_ADDRESS_TEXT.${LAN}}

Test the company status text
    [Documentation]  A teszt során azt nézzük meg, hogy partner adatainak
                ...  a megtekintése oldalon ellenőrizzük a cég
                ...  státuszának a szövegét.
    [Tags]  Medium
    Check the company status text on the partner details  ${COMPANY_STATUS_TEXT.${LAN}}

Test the billing tittle text on the partner details page
    Check the billing tittle on the partner details  ${BILLING_ICON_TEXT.${LAN}}

Test the billing name text on the partner details page
    Check the billing name on the partner details  ${BILLING_NAME_TEXT.${LAN}}

*** Keywords ***
Login go partners page and choose one partner details
    [Arguments]  ${old}  ${bong}  ${login}
    Login and go to partner details page  ${old}  ${bong}  ${login.email}  ${login.password}
    Choose and open one partners details


Choose and open one partners details
    ${ikon} =  get element count  css=a.link-action-icon.link-icon
    log  ${ikon}
    ${ikon2} =  SeleniumLibrary.Get WebElementS  css=a.link-action-icon.link-icon
    ${random} =  Evaluate  random.randint(0, ${ikon}-1)  modules=random
    log  ${random}
    #click element  ${ikon2}[0]
    #click element  ${ikon2}[${random}]
    ${elem} =  get from list  ${ikon2}  ${random}
    scroll to element  ${elem}  100
    click element  ${elem}
    Wait the partner details page loaded