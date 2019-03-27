*** Settings ***
Library  SeleniumLibrary
Resource  PO/po_partners.robot
Library  ../ExternalResources/mylibrary.py
Library  Collections

*** Variables ***


*** Keywords ***
Check text apper above the i icon
    [Documentation]  Megnézi, hogy a partnerek oldalon a i con mögötti szöveg megfelelően jelenik-e meg.
    [Arguments]  ${text}
    ${szoveg0} =  po_partners.Get the first text of i icon
    ${hossz_szoveg0} =  get length  ${szoveg0}
    ${szoveg1} =  po_partners.Get the full text of i icon
    ${hossz} =  get length  ${szoveg1}
    ${fo_szoveg} =  string of other_string  ${szoveg1}   ${hossz_szoveg0}  ${hossz}
    log  ${szoveg1}
    should be true  "${fo_szoveg}" == "${text}"


Check the partner meghivasa gomb text
    [Documentation]  Megnézi, hogy a paraméterben megadott szöveggel
                     ...  egyezik-e a partner meghívása gomb.
    [Arguments]  ${szoveg}
    ${button_szoveg} =  Get the text of invite partner button
    Log  ${button_szoveg}
    should be true  '${button_szoveg}'=='${szoveg}'

Click the partner invite button
    Click invite button

Check the firstname error message is not visiable
    [Documentation]  Megnézzük, hogy hibaüzenet megjelenik-e az oldalon.
    Check the Error message not visiable


Give the input date for the firstname azt other field
    [Documentation]  Megadjuk a kívánt adatot a firstname-be és egy másik mezőbe
    [Arguments]  ${firstname}  ${lastname}
    po_partners.Give the firstname  ${firstname}
    po_partners.Give the lastname  ${lastname}

Check the error message text and is visiable
    [Documentation]  Megnézzük, hogy a paraméterként megadott error message megjelenik-e.
    [Arguments]  ${error_message}
    po_partners.Wait the error message is visible
    #wait until element is visible  xpath=//app-show-errors/ul/li
    po_partners.Check the error message visiable
    # element should be visible  xpath=//app-show-errors/ul/li
    ${valami3} =  po_partners.Get the error message text
    # ${valami3} =  get text  xpath=//app-show-errors/ul/li
    should be equal as strings  ${valami3}  ${error_message}

Waite the partner invite page loaded
    Check the first name field visiable on the page
    #wait until element is visible  xpath=//input[@formcontrolname="firstName"]

Get the cegnev div object from the page
    [Documentation]  A partners page-ből visszaadja azt a div részt ami a cégnevet tartalmazza.
    @{elemek} =  Get the all div element of input from partner page
    ${hossz} =  get length  ${elemek}
    log  ${hossz}
    ${cegn} =  Get the company div object  ${elemek}
    [Return]  ${cegn}

Check the div object contains the error message
    [Documentation]  Megnézzük, hogy az adott object tartalmaz-e error hibaüzenetet.
                ...  Nem szabad, hogy hibaüzenetet tartalmazzon.
    [Arguments]  ${div_object}
    ${van1}  ${van2} =  po_partners.Check the error message  ${div_object}
    #${van1}  ${van2} =  check the elem contain in parent2  ${div_object}  .//app-show-errors/ul/li
    should not be true  ${van1}

Check the partner meghivasa text is oke
    [Documentation]  Megnézi, hogy a partner meghívása szöveg megjelenik-e az oldalon,
                ...  és hogy a szövege megfelelő-e.
    [Arguments]  ${text}
    Check the cim appear on the page
    ${szoveg} =  Get the text of the cim
    log  ${szoveg}
    should be true  "${szoveg}" == "${text}"

Check the veznev text in the veznev div object
    [Documentation]  Megnézi, hogy Veznev labelje egyezik-e azzal amit itt paraméterben megadunk.
    [Arguments]  ${veznev_text}
    ${veznev} =  Get the veznev div object from the page
    ${van}  ${veznev_label} =  Get the label from div object in the partners page  ${veznev}
    log  ${van}
    ${label_szoveg} =  get text  ${veznev_label}
    log  ${label_szoveg}
    should be true  "${label_szoveg}" == "${veznev_text}"

Check the keresztnev text in the keresztnev div object
    [Documentation]  Megnézi, hogy a keresztnev labelje egyezik-e azzal amit itt paraméterben megadunk.
    [Arguments]  ${keresztnev_text}
    ${kereszt} =  Get the keresztnev div object from the page
    ${van}  ${keresztnev_label} =  Get the label from div object in the partners page  ${kereszt}
    log  ${van}
    ${label_szoveg} =  get text  ${keresztnev_label}
    log  ${label_szoveg}
    should be true  "${label_szoveg}" == "${keresztnev_text}"

Get the veznev div object from the page
    @{elemek} =  Get the all div element of input from partner page
    #@{elemek} =  SeleniumLibrary.Get WebElements  //div[@class="columns small-12 medium-6"]
    ${hossz} =  get length  ${elemek}
    ${veznev} =  Get From List  ${elemek}  1
    [Return]  ${veznev}

Get the keresztnev div object from the page
    @{elemek} =  Get the all div element of input from partner page
    ${hossz} =  get length  ${elemek}
    ${kereszt} =  Get From List  ${elemek}  0
    [Return]  ${kereszt}