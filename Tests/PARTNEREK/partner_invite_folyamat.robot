*** Settings ***
Resource  ../../Resources/partner_invite_resource.robot
Resource  ../../Resources/login_resource.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/PO/po_menu.robot
Library  ../../ExternalResources/mylibrary.py
Resource  ../../Resources/variables.robot
Variables  ../../Resources/variable.py
Library  SeleniumLibrary
Library  Collections

*** Variables ***

*** Test Cases ***
test3
    [Tags]  most3
    Begin web test  https://temp-mail.org/  chrome
    wait until element is visible  id=mail  20
    ${email} =  get value  id=mail
    log  ${email}
    go to  ${OLDAL_URL}
    #sleep  3s
    #go to  https://temp-mail.org/
    #${email2} =  get value  id=mail
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Go to the partners page via menu
    sleep  1s
    Click the partner invite button
    Waite the partner invite page loaded
    input text  //input[@formcontrolname="email"]  ${email}
    #Give the name of company  cegnevvalami
    input text  //input[@formcontrolname="companyName"]  cegnevvalami
    give the lastname  last
    give the firstname  valami
    click element  //button[@class="button success"]
    wait until element is visible  xpath=//*[contains(@class,'toast-success')]
    wait until element is not visible  xpath=//*[contains(@class,'toast-success')]  10
    #wait until element is visible  //button[@class="button hollow"]  30
    # sleep  8s
    click element  //*[@class="user-profile"]
    sleep  2s
    click element  //*[@id="menu_loguout"]
    sleep  2s
    go to  https://temp-mail.org/
    sleep  1s
    # wait until element is visible  Új bejelentés érkezett  120
    wait until page contains  Meghívás elfogadása   120
    click link  link=Meghívás elfogadása
    sleep  3s
    #TODO: megnézni, hogy a partial link miért nem működik.
    scroll to element  link=Regisztáció befejezése  100
    click link  link=Regisztáció befejezése
    sleep  2s
    close window
    select window  MAIN
    wait until page contains element  xpath=//input[@formcontrolname="token"]  60
    sleep  2s
    input text  xpath=//input[@formcontrolname="password"]  Vinyo123456
    input text  xpath=//input[@formcontrolname="passwordConfirm"]  Vinyo123456
    # Rákattintunk a REgisztráció megerősítése gombra
    click element  xpath=//*[@type="submit"]
    wait until page contains element  id=mat-checkbox-1  10
    sleep  2s
    Give regeistration data and click the login button  ${email}  Vinyo123456
    Check the login succes or not
    click element  //*[@class="user-profile"]
    wait until element is visible  id=menu-account
    click element  id=menu-account
    sleep  3s
    input text  //input[@formcontrolname="phone"]  +36209602628
    input text  //input[@formcontrolname="birthday"]  1984.02.24
    input text  //input[@formcontrolname="birthPlace"]  Ózd
    input text  //input[@formcontrolname="motherName"]  Anyja neve
    input text  //input[@formcontrolname="birthName"]  Vincze Tamás
    click element  id=mat-radio-3
    click element  //app-button/button[@class="button success"]
    sleep  8s
    click element  //*[@class="user-profile"]
    sleep  2s
    click element  //*[@id="menu_loguout"]
    sleep  2s
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Go to the partners page via menu
    sleep  2s
    #wait until element is visible  xpath=xpath=//input[@formcontrolname="invitedUserEmail"]
    input text  xpath=//input[@formcontrolname="invitedUserEmail"]  ${email}
    click element  xpath=//search-button
    sleep  2s
    close browser




*** Keywords ***
