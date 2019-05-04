*** Settings ***
Library  SeleniumLibrary
Resource   login_resource.robot
Resource  variables.robot
Variables  variable.py
Resource  PO/po_menu.robot
Resource  PO/po_partners.robot
#Library  Collections
Resource  Common_resource.robot
Resource  variables/partner_megtekintese_variable.robot
Resource  partner_letre_folyamat_resource.robot
Resource  variables/partner_page_variable.robot
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
    #Login and go to partner details page  ${old}  ${bong}  ${login.email}  ${login.password}
    Open browser and login to stemx or stemxcity  ${old}  ${bong}  ${login}
    Go to the partners page via menu
    Choose and open one partners details
    Wait the partner details page loaded

Login go partners page choose one partner change english
    [Arguments]  ${old}  ${bong}  ${login}
    Login go partners page and choose one partner details  ${old}  ${bong}  ${login}
    #Login and go to partner details page  ${old}  ${bong}  ${login.email}  ${login.password}
    #Choose and open one partners details
    #Wait the partner details page loaded
    change the language to english via mymenu

Choose and open one partners details
    ${ikon} =  get element count  xpath=//*[@class="material-icons action-primary"]
    #${ikon} =  get element count  css=a.link-action-icon.link-icon
    log  ${ikon}
    @{ikon2} =  SeleniumLibrary.Get WebElementS  xpath=//*[@class="material-icons action-primary"]
    #${ikon2} =  SeleniumLibrary.Get WebElementS  css=a.link-action-icon.link-icon
    ${random} =  Evaluate  random.randint(1, ${ikon})  modules=random
    log  ${random}
    #click element  ${ikon2}[0]
    #click element  ${ikon2}[${random}]
    ${h} =  Evaluate  ${random}-1
    ${elem} =  get from list  ${ikon2}  ${h}
    scroll to element  ${elem}  100
    click element  ${elem}
    Wait the partner details page loaded

Create cim
    [Arguments]  ${da}
    ${address} =  create dictionary
    ${country} =  szotarban van e  ${da}  Companycountry
    run keyword if  ${country}==${TRUE}  set to dictionary  ${address}  country  ${da.Companycountry}
    ${zip} =  szotarban van e  ${da}  Companyzipcode
    run keyword if  ${zip}==${TRUE}  set to dictionary  ${address}  zipcode  ${da.Companyzipcode}
    ${county} =  szotarban van e  ${da}  Companycounty
    run keyword if  ${county}==${TRUE}  set to dictionary  ${address}  county  ${da.Companycounty}
    ${city} =  szotarban van e  ${da}  Companycity
    run keyword if  ${city}==${TRUE}  set to dictionary  ${address}  city  ${da.Companycity}
    ${street} =  szotarban van e  ${da}  Companystreet
    run keyword if  ${street}==${TRUE}  set to dictionary  ${address}  street  ${da.Companystreet}
    ${housenumber} =  szotarban van e  ${da}  Companyhousenumber
    run keyword if  ${housenumber}==${TRUE}  set to dictionary  ${address}  housenumber  ${da.Companyhousenumber}
    ${door} =  szotarban van e  ${da}  Companydoor
    run keyword if  ${door}==${TRUE}  set to dictionary  ${address}  door  ${da.Companydoor}
    ${floor} =  szotarban van e  ${da}  Companyfloor
    run keyword if  ${floor}==${TRUE}  set to dictionary  ${address}  floor  ${da.Companyfloor}
    set suite variable  ${address}
    log  ${address}
    #log to console  ${address}

Create billingaddress
    [Arguments]  ${da}
    ${baddress} =  create dictionary
    ${country} =  szotarban van e  ${da}  Billingcountry
    run keyword if  ${country}==${TRUE}  set to dictionary  ${baddress}  country  ${da.Billingcountry}
    ${zip} =  szotarban van e  ${da}  Billingzipcode
    run keyword if  ${zip}==${TRUE}  set to dictionary  ${baddress}  zipcode  ${da.Billingzipcode}
    ${county} =  szotarban van e  ${da}  Billingcounty
    run keyword if  ${county}==${TRUE}  set to dictionary  ${baddress}  county  ${da.Billingcounty}
    ${city} =  szotarban van e  ${da}  Billingcity
    run keyword if  ${city}==${TRUE}  set to dictionary  ${baddress}  city  ${da.Billingcity}
    ${street} =  szotarban van e  ${da}  Billingstreet
    run keyword if  ${street}==${TRUE}  set to dictionary  ${baddress}  street  ${da.Billingstreet}
    ${housenumber} =  szotarban van e  ${da}  Billinghousenumber
    run keyword if  ${housenumber}==${TRUE}  set to dictionary  ${baddress}  housenumber  ${da.Billinghousenumber}
    ${door} =  szotarban van e  ${da}  Companydoor
    run keyword if  ${door}==${TRUE}  set to dictionary  ${baddress}  door  ${da.Billingdoor}
    ${floor} =  szotarban van e  ${da}  Companyfloor
    run keyword if  ${floor}==${TRUE}  set to dictionary  ${baddress}  floor  ${da.Billingfloor}
    set suite variable  ${baddress}
    log  ${baddress}
    #log to console  ${baddress}



Login and create partners data
    [Arguments]  ${login_data}
    Create cim  ${Partner_data2}
    create billingaddress  ${Partner_data2}
    ${email} =  po_tempmail.Get the email address from the tempmail  ${bogeszo}
    ${Partner_data2.Email} =  set variable  ${email}
    go to  ${OLDAL_URL}
	Login and go the new partner page  ${login_data}
	Create new partner  ${Partner_data2}
	give the email for the search input  ${email}
    po_partners.Click the search button
    sleep  4s
    Choose and open one partners details
    Wait the partner details page loaded

Login and create partners data and change english
    [Arguments]  ${em}  ${password}
    Login and create partners data  ${em}  ${password}
    change the language to english via mymenu

Ellenorzes
    [Arguments]  ${lan}  ${type}  ${adat}  ${index}
    log  ${adat}
    Run keyword if  "${type}" == "szoveg"  Check value of partner details common  ${adat}  ${index}
    ...  ELSE IF  "${type}" == "cim"  Check address value of partner details  ${lan}  ${adat}  ${index}
    #${szoveg} =  run keyword if  "${type}" == "szoveg"  Run Keywords
    #...  Check value of partner details common  ${adat}  ${index}
    #${szoveg} =  Check value of partner details common  ${adat}  ${index}

Ellenorzes2
    [Arguments]  ${lan}  ${type}  ${adat}  ${index}
    Run keyword if  "${type}" == "szoveg"  run keywords
    ...   ${szoveg2} =  set variable  valami

Check value of partner details common2
    [Arguments]  ${szoveg}  ${index}
    ${ertek} =  Get common value from partner details page  ${index}
    [Return]  ${ertek}


Check value of partner details common
    [Arguments]  ${szoveg}  ${index}
    ${ertek} =  Get common value from partner details page  ${index}
    should be equal  ${szoveg}  ${ertek}
    #[Return]  ${ertek}
    #should be equal  ${szoveg}  ${ertek}

Check address value of partner details
    [Arguments]  ${lan}  ${data}  ${index}
     ${cim} =  create address string  ${lan}  ${data}
     ${ertek} =  Get common value from partner details page  ${index}
     should be equal  ${ertek}  ${cim}