*** Test Cases ***

Nyelv valaszto a fooldalon
    # TODO:  A nyevlválasztót egy külön modulba kell tenni.
    [Documentation]  Sikertelen bejelentkezés tesztje úgy, hogy rossz jelszót adunk meg
    [Tags]  Smoke2
    Waiting for login page will load
    click element  xpath=//*[@id="mat-select-0"]
    sleep  3s
    Give regeistration data and click the login button  ${EMAIL_SUCCES}  Vinyo12345
    # alert should be present  Kedves felhasználó  Confirm Action
    wait until element is visible  css=app-callout
    sleep  2s
    # element should be visible  css=app-callout
    ${szoveg} =  get text  css=app-callout
    Log  ${szoveg}
    element text should be  css=app-callout  Kedves felhasználó\nA megadott email cím vagy jelszó helytelen. Kérjük próbálja újra.\nclose


Sikeres bejelentkezes tesztje es meg mas valami
    [Documentation]  A teszt során sikeres bejelentkezést teszteljük.
    [Tags]  smoke3
    Give regeistration data and click the login button  ${EMAIL_SUCCES}  ${EMAIL_SUCCES_PASSWORD}
    # click element  xpath=//*[@id="mat-checkbox-1"]/label
    Check the login succes or not
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



Sikeres bejelentkezes jo loginnal es jelszoval1
    # TODO: ebben az ágban szerepel az, hogy lehet a boxoffice-ban eljutni és egy csomó dolgot elindítani.

    [Documentation]  A teszt során sikeres bejelentkezést teszteljük.
    [Tags]  smoke7  login
    Give regeistration data and click the login button  balazs.varga@interticket.hu  Password1
    Check the login succes or not
    sleep  1s
    # click link  link=Jegypénztár
    click element  id=mat-expansion-panel-header-6
    sleep  3s
    # click element  xpath=//*[@id="cdk-accordion-child-6"]/div/ul/div[1]/a
    click element  css=a[href*='boxoffice/sales']
    # wait until element is visible  css=input[formcontrolname=searchFilter]
    wait until page contains element  css=input[formcontrolname=searchFilter]
    sleep  5s
    ${lista}=  get element count  xpath=//boxoffice-sales-product-list-item
    Log  ${lista}
    ${venuneve} =  venu nev
    Log  ${venuneve}
    mouse over  xpath=//size-selector
    sleep  3s
    #click element  xpath=//*[@id="mainContent"]/app-page-content/section/div[2]/div/div/app-boxoffice/boxoffice-sales/app-boxoffice-sales-product-list/div/form/div[3]/div/size-selector/div[2]/div[3]
    #click element  xpath=//size-selector/div[2]/div[3]
    click element  xpath=//div[@class='selectors-container ng-tns-c21-21 ng-trigger ng-trigger-scaleOpacityAnimation ng-star-inserted']/div[3]
    sleep  3s
    # input text  css=input[formcontrolname="searchFilter"]  valami
    click element  xpath=//div[contains(text(),'Ma')]
    sleep  5s
    # textfield value should be  css=input[formcontrolname="searchFilter"]  valami
    ${elem} =  get element attribute  css=input[formcontrolname="eventDate"]  value
    Log  ${elem}
    ${datum} =  get text  css=div[class=start-date]
    # mouse down  xpath=//*[@id="mat-expansion-panel-header-37"]
    ${title} =  get text  css=div[class="title"]
    LOG  ${title}
    click element  css=div[class="title"]
    sleep  5s
    element should be visible  css=boxoffice-sales-product-pricing[class=ng-star-inserted]