*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Common.robot

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
