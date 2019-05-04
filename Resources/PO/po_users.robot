*** Settings ***
Library  SeleniumLibrary
Resource  po_menu.robot

*** Variables ***
${PO_USERS_SEARCH_INPUT} =  xpath=//*[@formcontrolname="fullName"]
${PO_USERS_SEARCH_BUTTON} =  xpath=//search-button
${PO_USERS_NEW_BUTTON} =  xpath=//*[@id="new_button"]
${PO_USERS_INVITE_BUTTON_ID} =  xpath=//*[@ng-reflect-router-link="invite"]
${PO_USERS_INVITE_FIRSTNAME_INPUT_ID} =  xpath=//*[@formcontrolname="firstName"]

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