*** Settings ***
Library  SeleniumLibrary
Library  ../ExternalResources/alap.py

*** Variables ***
${BROWSER}  chrome
${OLDAL} =  https://www.jegy.hu/

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