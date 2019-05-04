*** Settings ***
Library  SeleniumLibrary
Resource  PO/po_tempmail.robot
Library  ../ExternalResources/mylibrary.py
Resource  variables.robot
Resource  login_resource.robot
Resource  Common_resource.robot
Resource  PO/po_invite_users.robot

*** Keywords ***
