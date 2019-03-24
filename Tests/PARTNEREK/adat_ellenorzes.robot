*** Settings ***
Library  Selenium Library

*** Test Cases ***
Email cim ellenorzes
    # Ide kell majd a login rész
    click element  id=mat-expansion-panel-header-0
    wait until element is visible  id=partners_submenu
    click element  id=partners_submenu
    #click element  xpath=//*[@id="partners_submenu"]
    sleep  3s
    ${ikon} =  get element count  css=a.link-action-icon.link-icon
    ${ikon2} =  SeleniumLibrary.Get WebElementS  css=a.link-action-icon.link-icon
    ${random} =  Evaluate  random.randint(0, ${ikon})  modules=random
    log  ${random}
    click element  ${ikon2}[0]
    # click element  css=a.link-action-icon.link-icon
    sleep  3s
    page should contain  E-mail cím
    element text should be  xpath=//*[@id="mainContent"]/app-page-content/section/div[2]/div/div/app-user-management/user-management-partners/app-partner-view/div[1]/div/div/div/div/div/div[3]/h6  E-mail cím
    ${text} =  get text  xpath=//*[@id="mainContent"]/app-page-content/section/div[2]/div/div/app-user-management/user-management-partners/app-partner-view/div[1]/div/div/div/div/div/div[3]/p
    log  ${text}
    should be true  '${text}' == '-' or '@' in '${text}'