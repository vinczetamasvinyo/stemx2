*** Settings ***
Resource  ../../../../Resources/felhasznalo_meghivasa_folyamat_resource.robot
Library    robot.libraries.String

*** Variables ***
&{USER_DATA}  Email=${EMPTY}
        ...   Firstname=Vinyó
        ...   Lastname=Vincze

&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}

*** Test Cases ***
Test1
    ${szoveg} =  robot.libraries.String.Generate Random String  6  letters
    ${email} =  po_tempmail.Get the email address from the tempmail  ${bogeszo}
    ${USER_DATA.Email} =  set variable  ${email}
    #${szoveg} =  get time in string
    ${USER_DATA.Firstname} =  Catenate  ${USER_DATA.Firstname}  ${szoveg}
    log to console  ${USER_DATA.Firstname}
    go to  ${OLDAL_URL}
    Login to stemx or stemxcity  ${login_data}
    Go to the users page via menu
    Click the invite button on the users page
    Wait the user invite page loaded
    input text  //*[@formcontrolname="firstName"]  ${USER_DATA.Firstname}
    input text  //*[@formcontrolname="lastName"]  ${USER_DATA.Lastname}
    input text  //*[@formcontrolname="email"]  ${USER_DATA.Email}
    Click the save button on the page
    Wait the succes message and click
    Wait the users page loaded
    input text  //*[@formcontrolname="searchText"]  ${USER_DATA.Email}
    click element  xpath=//search-button
    sleep  3s
    Check the active icon is appear
    Full logout
    Go tempmail and wait the reg email az open  ${Tempmail}
    close window
    select window  MAIN
    Finish the registration the stemx or stemc page   ${password_ok2}
    ${logindatap} =  create dictionary
    set to dictionary  ${logindatap}  email  ${email}
    set to dictionary  ${logindatap}  password  Vinyo123456_
    set to dictionary  ${logindatap}  partner  Interticket
    Login to stemx or stemxcity  ${logindatap}
    go to  ${Tempmail.url}
    sleep  3s