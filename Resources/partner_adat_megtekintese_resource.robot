*** Settings ***
Library  SeleniumLibrary
Resource   login_resource.robot
Resource  variables.robot
Variables  variable.py
Resource  PO/po_menu.robot
Library  Collections
Resource  Common_resource.robot
