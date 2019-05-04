*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Common.robot
Library  ../ExternalResources/mylibrary.py

*** Test Cases ***

Test oldal megnyit
    open browser  about:blank  chrome
    maximize browser window
    ${url} =  set variable  https://mobiletest.jegy.hu/ticket/E87AD86049C04805AA992E2BADA3DFEA-1015954/
    ${url2} =  set variable  zteua2q0gcuq
    ${url3} =  set variable  ${url}${url2}
    ${url4} =  set variable  .pdf
    ${osszeurl} =  set variable  ${url}${url2}${url4}
    go to  ${osszeurl}
    log  ${url}
    log  ${url2}
    log  ${url3}
    :FOR  ${valt}  IN RANGE  100  500
    \  ${url0} =  set variable  zteua2q0g
    \  ${url3} =  set variable  ${url0}${valt}
    \  ${osszeurl} =  set variable  ${url}${url3}${url4}
    \  log  ${osszeurl}
    \  go to  ${osszeurl}

MUPA
    open browser  about:blank  chrome
    maximize browser window
    go to  https://mupa:mupa@staging.mupa.hu/program/csaladi-es-ifjusagi-programok/szenvedelyem-a-regizene-vashegyi-gyorgy-2019-04-28_11-00-bbnh
    sleep  3s
    click element  xpath=//*[@class="cookie-alert__container"]/a
    sleep  2s
    click element  xpath=//*[@class="btn primary buy-ticket js-ticket-booking loading-btn expand-right"]
    sleep  10s
    actionchangesajat  //*[@id="map"]/svg/g/path[1]
    #click element  xpath=//*[@id="map"]/svg/g/path[1]
    sleep  3s
    click element  xpath=//*[@id="map"]/svg/g[2]/rect[762]
    sleep  6s

