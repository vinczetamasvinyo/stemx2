*** Settings ***
Documentation  A loginhoz kapcsolódó funkcionális teszteket tartalmazza.

Resource  ../../Resources/login_resource.robot
Resource  ../../Resources/Common.robot
Library  Collections
Library  ../../ExternalResources/mylibrary.py
Resource  ../../Resources/variables.robot
Variables  ../../Resources/variable.py

Test Setup  Open Vk login page  ${OLDAL_URL}  chrome
Test Teardown  common.End web test

*** Variables ***
${bogeszo} =  chrome
${EMAIL_SUCCES} =  ${EM_SUC}
${EMAIL_IS_NOT_EXIST} =  valami@valami.hu
${EMAIL_IS_NOT_EXIST_PASSWORD} =  123456
${EMAIL_SUCCES_PASSWORD} =  ${PASSWORD_OK}
${ERROR_TEXT_HU_GIVE_WRONG_PASSWORD} =  Kedves felhasználó\nA megadott email cím vagy jelszó helytelen. Kérjük próbálja újra.\nclose
${EMAIL_PLACEHOLDER_TEXT} =  somebody@example.com
${SHORT_PASSWORD} =  1111

# Teszt sikeres login
# sikertelen login jelszó
# Sikertelen login rossz login + jelszó
# Placeholder checkolása
# jelszó mutatása funkció tesztelése

*** Test Cases ***
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

Sikeres bejelentkezes jo loginnal es jelszoval
    [Documentation]  A teszt során sikeres bejelentkezést teszteljük.
    [Tags]  smoke6  login
    Give regeistration data and click the login button  ${EMAIL_SUCCES}  ${EMAIL_SUCCES_PASSWORD}
    Check the login succes or not
    sleep  1s

Sikertelen bejelentkezes rossz jeleszo
    [Documentation]  A teszt során a sikertelen bejelentkezést teszteljük rossz jelszóval
    [Tags]  login
    Give regeistration data and click the login button  ${EMAIL_SUCCES}  Vinyo1234567
    Check the login status if gave a worng password  ${ERROR_TEXT_HU_GIVE_WRONG_PASSWORD}

Sikertelen bejelentkezes nemletezo login es jelszoval
    [Documentation]  A teszt során azt nézzük, hogy nemlétező lignnal nem sikerülhet a bejelentezés
    [Tags]  login5
    Give regeistration data and click the login button  ${EMAIL_IS_NOT_EXIST}  ${EMAIL_SUCCES_PASSWORD}
    Check the login status if gave a worng password  ${ERROR_TEXT_HU_GIVE_WRONG_PASSWORD}

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

Test the language setting in the login page
    [Documentation]  A teszt során azt nézzük meg, hogy a nyelvválasztó működik-e
                ...  a bejelentkezés oldalon.
    [Tags]  most
    Chechked the language is Hungarian in the login page
    Changed the language in the login page
    Chechked the language is English in the login page

Test the email placeholder
    [Documentation]  A teszt során azt nézzük meg, hogy az email mezőhoz
                ...  tartozó placeholder példa email megjelenik-e.
    [Tags]  smoke1
    ${placeholder} =  Get and log the placeholder email of username
    Check the email text of placeholder  ${placeholder}  ${EMAIL_PLACEHOLDER_TEXT}

Test the checkbox of password is not select
    [Documentation]  A teszt során azt nézzük meg
    [Tags]  smoke
    Check the "password show" checkbox status

Test the password show
    [Documentation]  A teszt soránt az nézzük meg, hogyha beírunk egy jelszót majd
                ...  bekapcsoljuk a jelszó mutatását, akkor azt látszik-e.
    [Tags]  akt
    Give the password in th CK login page  ${SHORT_PASSWORD}
    Click the show password checkbox in the login page
    Check that we see the password and logs

*** Keywords ***
