*** Settings ***
Resource  ../../../../Resources/auditoriums_resource.robot
Library    robot.libraries.String
Library  Collections

Suite Setup  Open browser and login and after go to the auditoriums page  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
Suite Teardown  Common.End web test

*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}
${LAN} =  Hun

*** Test Cases ***
test0
    [Tags]  most
    Check and set language  en
    #Get the language
    #Click the Mymenu
    #po_mymenu.Click the language
    #sleep  2s
    #${nyelv} =  Get the language from language menu
    #log  ${nyelv}



Test1
    Give the search value  Valami
    Click the header row3 on the auditorium page
    Check error not apper the search fields on the auditorium page

Test2
    [Tags]  most3
    Give the search value  dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
    Click the header row3 on the auditorium page
    Check error message on the object  //label  0  Please enter no more than 127 characters

*** Keywords ***
Eger esemeny
    [Arguments]  ${path}
    mouse out  ${path}
    sleep  1s
    click element  //app-profile-menu

Check and set language
    [Arguments]  ${lan}
    log  ${lan}
    ${lannow} =  Get the language
    log  ${lannow}
    run keyword if  "${lan}" != "${lannow}"  Click the language on the menu  ${lan}
    ...  ELSE  Eger esemeny  //*[@class="cdk-overlay-backdrop cdk-overlay-transparent-backdrop cdk-overlay-backdrop-showing"]


Click the language on the menu
    [Arguments]  ${lan}
    run keyword if  "${lan}"=="hu"  po_mymenu.click the hungarian language
    po_mymenu.Waiting the page loaded

Get the language
    po_mymenu.Click the Mymenu
    po_mymenu.Click the language
    po_mymenu.Wait the language submenu appear
    ${lannow} =  Get the language from language menu
    [Return]  ${lannow}

Get the language from language menu
    ${valamien} =  get css attribute value2  //*[@id='menu_change_languageen']/span  color
    log  ${valamien}
    ${valamihu} =  get css attribute value2  //*[@id='menu_change_languagehu']/span  color
    log  ${valamihu}
    ${valamidk} =  get css attribute value2  //*[@id='menu_change_languagedk']/span  color
    log  ${valamidk}
    ${szotar} =  create dictionary
    set to dictionary  ${szotar}  en=${valamien}  hu=${valamihu}  dk=${valamidk}
    :FOR    ${key}    IN    @{szotar.keys()}
    \    ${value}=    Get From Dictionary    ${szotar}    ${key}
    \    Exit For Loop If  "${value}" == "rgb(57, 180, 227)"
    \    log  ${key}
    [Return]  ${key}

Get CSS Attribute Value2
    [Arguments]    ${locator}    ${attribute}
    # Get element using Xpath in JavaScript.
    # Note there are other options like getElementById/Class/Tag
    ${element}=    Set Variable    document.evaluate("${locator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
    # Get css attribute value using getComputedStyle()
    ${attribute_value}=    Execute Javascript    return window.getComputedStyle(${element},null).getPropertyValue('${attribute}');
    Log   ${attribute_value}
    [Return]    ${attribute_value}
