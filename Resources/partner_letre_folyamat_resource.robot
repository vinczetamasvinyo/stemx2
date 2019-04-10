*** Settings ***
Resource  partner_invite_resource.robot
Resource  login_resource.robot
Resource  Common.robot
Resource  PO/po_menu.robot
Library   ../ExternalResources/mylibrary.py
Resource  ../Resources/variables.robot
Variables  variable.py
Library  SeleniumLibrary
Library  Collections
Resource  PO/po_userprofile.robot
Resource  PO/po_tempmail.robot
Resource  PO/po_mymenu.robot
Resource  PO/po_partners.robot

