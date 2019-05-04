*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/Common_resource.robot

*** Test Cases ***
Test0
    [Tags]  most
    log  valami
    ${split_text} =  set variable  \n
    #${valami} =  set variable  \n
    run keyword if  '${split_text}'!='üres'
    ...  Run Keywords
    ...  log  ${split_text}

test1
    ${email} =  po_tempmail.Get the email address from the tempmail  ${bogeszo}
    go to  ${OLDAL_URL}
    #login_resource.Open Vk login page  ${OLDAL_URL}  ${bogeszo}
    Give login date and login  ${box_office1_email_ok}  ${box_office1_password_ok }
    Click the felhasznalok karbantartasa
    Wait the felhasznalaok karbantartasa submenu visiable
    click element  id=users_submenu
    sleep  2s
    click element  id=new_button
    sleep  2s
    ${elem} =  get text  xpath=//*[@class="mat-checkbox-label"]
    log  ${elem}
    #click element  xpath=//*[@for="profile-picture-upload"]
    #sleep  3s
    choose file  id=profile-picture-upload   C:/Vinyo/hibakepek/2019.02.27/teszt_kep.jpg
    #input text  id=profile-picture-upload  C:/Vinyo/hibakepek/2019.02.27/teszt_kep.jpg
    sleep  3s
    click element  xpath=//*[@class="mat-checkbox-label"]
    input text  xpath=//*[@formcontrolname="firstName"]  Valami
    input text  xpath=//*[@formcontrolname="lastName"]  Vincze
    input text  xpath=//*[@formcontrolname="email"]  ${email}
    input text  id=phone  +36209602628
    input text  id=birthday  1984.02.24
    input text  id=birth_place  Ózd
    input text  id=birth_name  Vincze Tamás
    input text  id=motherName  Anyja neve
    click element  id=gender_male
    scroll to element  xpath=//*[@class="mat-accordion"]  100
    #click element  id=mat-checkbox-2
    #click element  xpath=//*[@class="mat-checkbox-label"]
    sleep  3s
    click element  id=save_button
    Wait the succes message and click
    Click the Mymenu
    Click the logout submenu
    go to  ${PARTNER_INVITE_FOLYAMAT_TEMP_URL}
    po_tempmail.Waiting and click the mail in themp page  ${PARTNER_INVITE_FOLYAMATA_SUBJECT_ID}  ${PARTNER_INVITE_FOLYAMATA_MAIL_TIMEOUT}  ${PARTNER_INVITE_FOLYAMATA_SUBJECT_LINK_ID}
    Scroll and click the link in the email  link=Regisztáció befejezése  100
    close window
    select window  MAIN
    Wait the token page is loaded
    PO_login.Give the password  Vinyo123456
    PO_login.Give the same password  Vinyo123456
    po_login.Push the regisztracio megerositese button
    Wait the succes message and click
    po_login.Waiting the login pager loaded
    Give regeistration data and click the login button  ${email}  Vinyo123456
    Check the login succes or not
    Sleep  3s

