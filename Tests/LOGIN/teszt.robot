*** Settings ***
Resource  ../../Resources/login_resource.robot
Variables  ../../Resources/variable.py
Resource    ../../Resources/variables.robot
Resource  ../../Resources/PO/po_mymenu.robot

*** Test Cases ***
Test1
    Open Vk login page  ${OLDAL_URL}  ${bogeszo}
    Give login date and login  ${box_office1_email_ok}  ${box_office1_password_ok}
    change the language to english via mymenu