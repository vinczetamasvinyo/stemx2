*** Settings ***
Resource  ../../Resources/login_resource.robot
Resource  ../../Resources/Common.robot
Library  Collections
Library  ../../ExternalResources/mylibrary.py
Resource  ../../Resources/variables.robot
Variables  ../../Resources/variable.py

Test Setup  Open Vk login page  ${OLDAL_URL}  ${bogeszo}
Test Teardown  common.End web test
Test Template  Invalid login and error message

*** Variables ***
${EMAIL_IS_NOT_EXIST} =  valami@valami.hu
${EMAIL_IS_NOT_EXIST_PASSWORD} =  123456
${EMAIL_SUCCES_PASSWORD} =  ${PASSWORD_OK}
${ERROR_TEXT_HU_GIVE_WRONG_PASSWORD} =  Kedves felhasználó\nA megadott email cím vagy jelszó helytelen. Kérjük próbálja újra.\nclose


*** Test Cases ***
Invalid username          ${EMAIL_IS_NOT_EXIST}      ${EMAIL_IS_NOT_EXIST_PASSWORD}     ${ERROR_TEXT_HU_GIVE_WRONG_PASSWORD}
Invalid password          ${box_office1_email_ok}    ${EMAIL_SUCCES_PASSWORD}           ${ERROR_TEXT_HU_GIVE_WRONG_PASSWORD}

*** Keywords ***
Invalid login and error message
    [Arguments]  ${email}  ${password}  ${error_message}
    Give regeistration data and click the login button  ${email}  ${password}
    Check the login status if gave a worng password  ${error_message}