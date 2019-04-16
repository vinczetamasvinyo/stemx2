*** Settings ***
Resource  ../../../Resources/partner_adat_megtekintese_resource.robot


Suite Setup  Login and go to partner details page  ${OLDAL_URL}  ${bogeszo}  ${box_office1_email_ok}  ${box_office1_password_ok }
Suite Teardown  common.End web test

*** Variables ***

*** Test Cases ***
Test1
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
    sleep  3s

*** Keywords ***
