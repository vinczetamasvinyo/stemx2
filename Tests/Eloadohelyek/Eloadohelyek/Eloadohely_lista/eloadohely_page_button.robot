*** Settings ***
Resource  ../../../../Resources/eloadohelyek_resource.robot

Suite Setup  Open browser and login and after go to the venues page  ${OLDAL_URL}  ${bogeszo}  ${LOGIN_DATA}
#Suite Teardown  Common.End web test

*** Variables ***
&{LOGIN_DATA}  email=${LOGIN_EMAIL.${DE}}  password=${LOGIN_PASSWORD.${DE}}  partner=${VARIABLES_PARTNER}  language=${LAN}
${LAN}=  Hun

*** Test Cases ***
Test the navigation first button inactive
    [Documentation]  Megnézzük, hogy az oldal betöltődésekor az első oldalra
                ...  ugrás gomb az inaktív-e.
    Check the first navigation button not active when first time arrive in the page

Test the navigation previous button inactive
    [Documentation]  Megnézzük, hogy az oldal betöltődésekor az egy oldallal vissza
                ...  gomb az inaktív-e.
    Check the previous button not active when first time arrive in the page

Test the navigation forward button active or not
    [Documentation]  Megnézzük, hogy az oldal betöltődésekor az következő oldalra
                ...  navigáló gomb megfelelően jelenik-e meg.
    Check the forward button active when first time arrive in the page

Test the navigation last button active or not
    [Documentation]  Megnézzük, hogy az oldal betöltődésekor az következő oldalra
                ...  navigáló gomb megfelelően jelenik-e meg.
    Check the last button active when first time arrive in the page

Test the click the next button
    [Documentation]  Megnézzük, hogy az oldal betöltődésekor működik-e
                ...  a következő oldalra navigáló gomb.
    Click the forward button when first time arrive in the page

Test the click the last page button
    [Documentation]  Megnézzük, hogy az oldal betöltődésekor működik-e
                ...  az utoló oldalra navigáló gomb.
    Click the last button when first time arrive in the page

Test when click tha last page and check the last button status
    [Documentation]  Megnézzük, hogyha elnavigálunk az utolsó oldalra
                ...  akkor az utolsó oldalra vezető gomb nem lesz aktív
    Click the last button and check the last button status

Test when click tha last page and check the next button status
    [Documentation]  Megnézzük, hogyha elnavigálunk az utolsó oldalra
                ...  akkor az utolsó oldalra vezető gomb nem lesz aktív
    Click the last button and check the next button status

Test when click tha last page and check the previous button status
    [Documentation]  Megnézzük, hogyha elnavigálunk az utolsó oldalra
                ...  akkor az egyel előre vezető vezető gomb nem lesz aktív
    Click the last button and check the previous button status

Test when click tha last page and check the first button status
    [Documentation]  Megnézzük, hogyha elnavigálunk az utolsó oldalra
                ...  akkor az egyel előre vezető vezető gomb nem lesz aktív
    Click the last button and check the first button status
    #comment