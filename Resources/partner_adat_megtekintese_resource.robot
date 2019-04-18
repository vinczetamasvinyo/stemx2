*** Settings ***
Library  SeleniumLibrary
Resource   login_resource.robot
Resource  variables.robot
Variables  variable.py
Resource  PO/po_menu.robot
#Library  Collections
Resource  Common_resource.robot
Resource  variables/partner_adat_megtekintese_variable.robot

*** Keywords ***
Check the title of partner details
    [Documentation]  Leellenőrzi a partner oldal megtekintésének a címét.
    [Arguments]  ${szoveg}
    ${szoveg2} =  Get title of partner details
    should be equal  ${szoveg}  ${szoveg2}

Check the company info text
    [Arguments]  ${szoveg}
    ${elem1} =  Get first icon item
    ${elem2} =  Get first full icon item
    Check text apper above the i icon  ${szoveg}  ${elem1}  ${elem2}

Check the company name text
    [Arguments]  ${szoveg}
    [Documentation]  Megnézi a cégnéve title text-jét.
    ${ertek} =  Get company name text of partner details page
    should be equal  ${szoveg}  ${ertek}

Check the company long name text
    [Documentation]  Megnéz a cég hosszabb neve text-jét.
    [Arguments]  ${szoveg}
    ${ertek} =  Get company longname text of partner details page
    should be equal  ${szoveg}  ${ertek}

Check the company regnumber text on the partner details
    [Documentation]  Megnéz a cégjegyzékszám szövegét
    [Arguments]  ${szoveg}
    ${ertek} =  Get company regnumber text of partner details page
    should be equal  ${szoveg}  ${ertek}

Check the company address text on the partner details
    [Documentation]  Megnéz a cég címét
    [Arguments]  ${szoveg}
    ${ertek} =  Get company address text of partner details page
    should be equal  ${szoveg}  ${ertek}

Check the company status text on the partner details
    [Documentation]  Megnéz a cég státuszát
    [Arguments]  ${szoveg}
    ${ertek} =  Get company status text of partner details page
    should be equal  ${szoveg}  ${ertek}

Check common icon text on the partner details
    [Documentation]  Megnéz a Elérhetőségi tittle szövegét.
    [Arguments]  ${index}  ${szoveg}
    ${elem1} =  Get common icon item  ${index}
    ${elem2} =  Get common full icon item  ${index}
    Check text apper above the i icon  ${szoveg}  ${elem1}  ${elem2}


Check the billing tittle on the partner details
    [Documentation]  Megnéz a Elérhetőségi tittle szövegét.
    [Arguments]  ${szoveg}
    ${elem1} =  Get second icon item
    ${elem2} =  Get second full icon item
    Check text apper above the i icon  ${szoveg}  ${elem1}  ${elem2}

Check the billing name on the partner details
    [Documentation]  Megnéz a számlázási nevet
    [Arguments]  ${szoveg}
    ${ertek} =  Get billing name text of partner details page
    should be equal  ${szoveg}  ${ertek}

Check the back button text on the partner details
    [Documentation]  Megnéz a vissza gomb szövegét.
    [Arguments]  ${szoveg}
    ${ertek} =  Get the back button text
    should be equal  ${szoveg}  ${ertek}

Check the delet buton text on the partner details
    [Documentation]  Megnéz a törlés gomb szövegét.
    [Arguments]  ${szoveg}
    ${ertek} =  Get the delete button text
    should be equal  ${szoveg}  ${ertek}

#DATA DRIVEN RÉSZ
Check the text on the partner details
    [Documentation]  Megnéz a cég címét
    [Arguments]  ${type}  ${szoveg}  ${index}
    run keyword if  ${type} == 0  normal text  ${szoveg}  ${index}
    ...  ELSE IF  ${type} == 1  Check common icon text  ${szoveg}  ${index}
    ...  ELSE IF  ${type} == 2  Check the title of partner details  ${szoveg}
    ...  ELSE IF  ${type} == 3  Check the back button text on the partner details  ${szoveg}
    ...  ELSE IF  ${type} == 4  Check the delet buton text on the partner details  ${szoveg}
normal text
    [Arguments]  ${szoveg}  ${index}
    ${ertek} =  Get common text of partner details page  ${index}
    should be equal  ${szoveg}  ${ertek}

Check common icon text
    [Documentation]  Megnézi egy icon-os szövegét.
    [Arguments]  ${szoveg}  ${index}
    Check common icon text on the partner details  ${index}  ${szoveg}

Login go partners page and choose one partner details
    [Arguments]  ${old}  ${bong}  ${login}
    Login and go to partner details page  ${old}  ${bong}  ${login.email}  ${login.password}
    Choose and open one partners details
    Wait the partner details page loaded

Login go partners page choose one partner change english
    [Arguments]  ${old}  ${bong}  ${login}
    Login and go to partner details page  ${old}  ${bong}  ${login.email}  ${login.password}
    Choose and open one partners details
    Wait the partner details page loaded
    change the language to english via mymenu

Choose and open one partners details
    ${ikon} =  get element count  css=a.link-action-icon.link-icon
    log  ${ikon}
    ${ikon2} =  SeleniumLibrary.Get WebElementS  css=a.link-action-icon.link-icon
    ${random} =  Evaluate  random.randint(0, ${ikon}-1)  modules=random
    log  ${random}
    #click element  ${ikon2}[0]
    #click element  ${ikon2}[${random}]
    ${elem} =  get from list  ${ikon2}  ${random}
    scroll to element  ${elem}  100
    click element  ${elem}
    Wait the partner details page loaded