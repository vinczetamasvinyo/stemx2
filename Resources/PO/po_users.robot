*** Settings ***
Library  SeleniumLibrary
Resource  po_menu.robot

*** Variables ***
${PO_USERS_SEARCH_INPUT} =  xpath=//*[@formcontrolname="fullName"]
${PO_USERS_SEARCH_BUTTON} =  xpath=//search-button
${PO_USERS_NEW_BUTTON} =  xpath=//*[@id="new_button"]
${PO_USERS_INVITE_BUTTON_ID} =  xpath=//*[@ng-reflect-router-link="invite"]
${PO_USERS_INVITE_FIRSTNAME_INPUT_ID} =  xpath=//*[@formcontrolname="firstName"]
${PO_USERS_PICTURE_ID} =  id=profile-picture-upload
${PO_USERS_DELETE_USER_PICTURE_ID} =  xpath=//delete-button
${PO_USERS_FIRSTNAME_ID} =  xpath=//*[@formcontrolname="firstName"]
${PO_USERS_LASTNAME_ID} =  xpath=//*[@formcontrolname="lastName"]
${PO_USERS_EMAIL_ID} =  xpath=//*[@formcontrolname="email"]
${PO_USERS_PHONE_ID} =  id=phone
${PO_USERS_BIRTHDAY_ID} =  id=birthday
${PO_USERS_BIRTHPLACE_ID} =  id=birth_place
${PO_USERS_BIRTHNAME_ID} =  id=birth_name
${PO_USERS_MOTHERNAME_ID} =  id=motherName
${PO_USERS_GENDER_MALE_ID} =  id=gender_male
${PO_USERS_GENDER_FEMALE_ID} =  id=gender_female
${PO_USERS_ROLE_PLACE_ID} =  xpath=//*[@class="mat-accordion"]
${PO_USERS_ROLE_CHECKBOX_PLACE_ID} =  xpath=//*[@class="mat-checkbox-label"]

*** Keywords ***
Wait the users page loaded
    wait until element is visible  ${PO_USERS_SEARCH_BUTTON}

Click the new button on users page
    click element  ${PO_USERS_NEW_BUTTON}

Click the invite button on the users page
    click element  ${PO_USERS_INVITE_BUTTON_ID}

Wait the user invite page loaded
    wait until element is visible  ${PO_USERS_INVITE_FIRSTNAME_INPUT_ID}

Go to the users invite page
    po_menu.Go to the users page via menu
    po_users.Click the invite button on the users page
    po_users.Wait the user invite page loaded


Give the user data
    [Arguments]  ${ADATOK}
    ${vpicture} =  szotarban van e  ${ADATOK}  Picture
    run keyword if  ${vpicture}==${TRUE}  Give the user picture  ${ADATOK}[Picture]
    ${vfirstname} =  szotarban van e  ${ADATOK}  Firstname
    run keyword if  ${vfirstname}==${TRUE}  Give the user firstname  ${ADATOK}[Firstname]
    ${vlastname} =  szotarban van e  ${ADATOK}  Lastname
    run keyword if  ${vlastname}==${TRUE}  Give the user lastname  ${ADATOK}[Lastname]
    ${vemail} =  szotarban van e  ${ADATOK}  Email
    run keyword if  ${vemail}==${TRUE}  Give the user email  ${ADATOK}[Email]
    ${vphone} =  szotarban van e  ${ADATOK}  Phone
    run keyword if  ${vphone}==${TRUE}  Give the user phone  ${ADATOK}[Phone]
    ${vbirthday} =  szotarban van e  ${ADATOK}  Birthday
    run keyword if  ${vbirthday}==${TRUE}  Give the user birthday  ${ADATOK}[Birthday]
    ${vbirthplace} =  szotarban van e  ${ADATOK}  Birthplace
    run keyword if  ${vbirthplace}==${TRUE}  Give the user birthplace  ${ADATOK}[Birthplace]
    ${vmothername} =  szotarban van e  ${ADATOK}  Mothername
    run keyword if  ${vmothername}==${TRUE}  Give the user mother name  ${ADATOK}[Mothername]
    ${vbirthname} =  szotarban van e  ${ADATOK}  Birthname
    run keyword if  ${vbirthname}==${TRUE}  Give the user birthname  ${ADATOK}[Birthname]
    ${vgender} =  szotarban van e  ${ADATOK}  Gender
    run keyword if  ${vgender}==${TRUE}  Give the user gender  ${ADATOK}[Gender]
    ${vrole} =  szotarban van e  ${ADATOK}  Role
    run keyword if  ${vrole}==${TRUE}  Give the user role  ${ADATOK}[Role]

Give the user picture
    [Arguments]  ${text}
    input text  ${PO_USERS_PICTURE_ID}  ${text}
    wait until element is visible  ${PO_USERS_DELETE_USER_PICTURE_ID}
    sleep  1s

Give the user firstname
    [Arguments]  ${text}
    input text  ${PO_USERS_FIRSTNAME_ID}  ${text}

Give the user lastname
    [Arguments]  ${text}
    input text  ${PO_USERS_LASTNAME_ID}  ${text}

Give the user email
    [Arguments]  ${text}
    input text  ${PO_USERS_EMAIL_ID}  ${text}

Give the user phone
    [Arguments]  ${text}
    input text  ${PO_USERS_PHONE_ID}  ${text}

Give the user birthday
    [Arguments]  ${text}
    input text  ${PO_USERS_BIRTHDAY_ID}  ${text}

Give the user birthplace
    [Arguments]  ${text}
    input text  ${PO_USERS_BIRTHPLACE_ID}  ${text}

Give the user birthname
    [Arguments]  ${text}
    input text  ${PO_USERS_BIRTHNAME_ID}  ${text}

Give the user mother name
    [Arguments]  ${text}
    input text  ${PO_USERS_MOTHERNAME_ID}  ${text}

Give the user gender male
    click element  ${PO_USERS_GENDER_MALE_ID}

Give the user gender female
    click element  ${PO_USERS_GENDER_FEMALE_ID}

Give the user gender
    [Arguments]  ${text}
    run keyword if  "${text}" == "0"  Give the user gender male
    ...  ELSE  Give the user gender female

Create dc of items
    #[Arguments]  ${text}
    @{elemek} =  SeleniumLibrary.Get WebElements  xpath=//*[@class="mat-checkbox-label"]
    ${szotar} =  create dictionary
    ${i} =  set variable  -1
    :FOR  ${valt}  IN  @{elemek}
    \  ${i} =  Evaluate  ${i} + 1
    \  ${elem} =  get text  ${valt}
    #\  ${resz} =  set variable  //*[@id="${valt}"]/span
    #\  ${resz} =  set variable  //*[@id="${valt}"]/span
    \  log  ${elem}
    \  ${a} =  convert to string  ${i}
    \  set to dictionary  ${szotar}  ${elem}  ${a}
    log  ${szotar}
    [Return]  ${szotar}

Give the user role
    [Arguments]  ${text}
    scroll to element  ${PO_USERS_ROLE_PLACE_ID}  100
    ${szotar} =  Create dc of items
    log  ${szotar}
    @{elem} =  SeleniumLibrary.Get WebElements  ${PO_USERS_ROLE_CHECKBOX_PLACE_ID}
    ${kivalasztott} =  get from list  ${elem}  ${szotar}[${text}]
    click element  ${kivalasztott}
    #sleep  3s

Go to the new user page
    [Documentation]  Elnavigal az új user létrehozása oldalra.
    Go to the users page via menu
    click element  id=new_button
    wait until element is visible  xpath=//*[@formcontrolname="firstName"]