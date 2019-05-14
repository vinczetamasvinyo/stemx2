*** Settings ***
Library  SeleniumLibrary
Library  ../ExternalResources/alap.py
Library  ../ExternalResources/mylibrary.py
Library  Collections

*** Variables ***
#${BROWSER}  chrome
#${OLDAL} =  https://www.jegy.hu/
${COMMON_SUCCES_MESSAGE_ID} =  xpath=//*[contains(@class,'toast-success')]
${COMMON_WAITING_TIME_IN_SUCCES_MESSAGE} =  10

*** Keywords ***
Begin web test
    [Documentation]  Megnyit egy adott weboldalt a browserrel
    [Arguments]  ${oldal}  ${browser}
    open browser  about:blank  ${browser}
    # TODO: felvenni, hogy text kifejezés ellenőrzése így működik.
    run keyword if  '${browser}' == 'chrome'  maximize browser window
    go to  ${oldal}

End web test
    close all browsers

Wait the succes message and click
    [Documentation]
    wait until element is visible  ${COMMON_SUCCES_MESSAGE_ID}  ${COMMON_WAITING_TIME_IN_SUCCES_MESSAGE}
    sleep  1s
    click element  ${COMMON_SUCCES_MESSAGE_ID}
    wait until element is not visible  ${COMMON_SUCCES_MESSAGE_ID}  ${COMMON_WAITING_TIME_IN_SUCCES_MESSAGE}

add two string
    [Arguments]  ${string1}  ${string2}
    ${b} =  osszead string  ${string1}  ${string2}
    [Return]  ${b}

Check Page Url
    [Documentation]  Ellenőrzi egy adott oldal url-jét.
    [Arguments]  ${oldal}  ${part_oldal}
    ${d} =  osszead string  ${oldal}   ${part_oldal}
    ${c} =  get location
    Log  ${c}
    should be equal as strings  ${c}  ${d}

Scroll to element
    [Arguments]  ${element}  ${y}
    ${x} =  get vertical position  ${element}
    ${x2} =  windows scroll  ${x}  ${y}
    log  ${x2}
    Execute JavaScript  ${x2}

Check the two text is same
    [Documentation]  Megnézi, hogy a két szöveg egyezik-e.
    [Arguments]  ${szoveg1}  ${szoveg2}
    should be true  "${szoveg1}" == "${szoveg2}"

Elem from list
    [Documentation]  Több elemből visszaadja a megadott x. sorszámú elemet.
                ...  Két paramétert kap meg. Az egyik hogy milye elemeket keresen.
                ...  A második, hogy hanyadik elemet adja vissza.
    [Arguments]  ${keres_elem}  ${visszaad_elem}
    @{elem} =  SeleniumLibrary.Get WebElements  ${keres_elem}
    ${elem} =  get from list  ${elem}  ${visszaad_elem}
    [Return]  ${elem}

Check the item appear in the row
    [Documentation]  Megnézi, hogy a paraméterként megadott elem megjelenik-e
                ...  az adott listában.
    [Arguments]  ${lista}  ${path}
    :FOR  ${elem}  IN  @{lista}
    \  ${vane}  ${elemertek} =  check_the_elem_contain_in_parent2  ${elem}  ${path}
    \  should be true  ${vane}==${True}

Check the item not apper in the row
    [Documentation]  Megnézi, hogy a paraméterként megadott elem nem
                ...  megjelenik-e az adott listában.
    [Arguments]  ${lista}  ${path}
    :FOR  ${elem}  IN  @{lista}
    \  ${vane}  ${elemertek} =  check_the_elem_contain_in_parent2  ${elem}  ${path}
    \  should be true  ${vane}==${False}

Get CSS Attribute Value
    [Arguments]    ${locator}    ${attribute}
    # Get element using Xpath in JavaScript.
    # Note there are other options like getElementById/Class/Tag
    ${element}=    Set Variable    document.evaluate("${locator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
    # Get css attribute value using getComputedStyle()
    ${attribute_value}=    Execute Javascript    return window.getComputedStyle(${element},null).getPropertyValue('${attribute}');
    Log   ${attribute_value}