*** Settings ***
Documentation  A programok megtekintéséhez kapcsolódó tesztesetek futtatása

Resource  ../../Resources/programok_megtek_resource.robot
#Resource  ../../Resources/login_resource.robot
#Resource  ../../Resources/variables.robot
#Variables  ../../Resources/variable.py

Test Setup  login_resource.Open Vk login page  ${OLDAL_URL}  ${bogeszo}
# Test Teardown

*** Variables ***

*** Test Cases ***
Programok teszt
    [Tags]  most
    Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    Check the login succes or not
    sleep  1s
    Go to the Programok page via menu
    sleep  3s
    Click the megtekintes icon an waite the page of program load


