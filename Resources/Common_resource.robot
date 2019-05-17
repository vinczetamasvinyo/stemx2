*** Settings ***
Resource  partner_invite_common_resource.robot
Library  ../ExternalResources/mylibrary.py
Resource  partner_adat_szerk_resource.robot
Resource  PO/po_users.robot
Resource  menu_resource.robot
Library    robot.libraries.String


*** Keywords ***
Full logout
    [Documentation]  Elvégzi a logout-t az alkalmazásban, illetve csharp részen is.
    Logout
    run keyword if  "${DE}" == "stemx"  Logout on the csharp page

Get listbox item xpath
    [Documentation]  A kiválaszott paraméterben megadott elem xpath értéket visszaadja.
                ...  1. xpath paraméterben annak az elemnek az elérését kell megadni ami
                ...  a lista id-kat tartalmazza.
                ...  2. a class-ban pedig az elemet ami az id-kat tartalmazza.
    [Arguments]  ${kivlasztott}  ${xpath}  ${class}
    ${valami} =  get element attribute  ${xpath}  ${class}
    log  ${valami}
    @{elemek} =  mylibrary.split the text  ${valami}  ${SPACE}
    log  ${elemek}[0]
    log  ${elemek}
    ${szotar} =  create dictionary
    :FOR  ${valt}  IN  @{elemek}
    \  ${resz} =  set variable  //*[@id="${valt}"]/span
    \  ${text} =  get text  ${resz}
    \  set to dictionary  ${szotar}  ${text}  ${resz}
    log  ${szotar}
    ${el} =  get from dictionary  ${szotar}  ${kivlasztott}
    [Return]  ${el}

Check text apper above the i icon
    [Documentation]  Megnézi, hogy a partnerek oldalon a i con mögötti szöveg megfelelően jelenik-e meg.
    [Arguments]  ${text}  ${elem1}  ${elem2}
    ${szoveg0} =  po_partners.Get the first text of i icon  ${elem1}
    ${hossz_szoveg0} =  get length  ${szoveg0}
    ${szoveg1} =  po_partners.Get the full text of i icon  ${elem2}
    ${hossz} =  get length  ${szoveg1}
    ${fo_szoveg} =  string of other_string  ${szoveg1}   ${hossz_szoveg0}  ${hossz}
    log  ${szoveg1}
    should be true  "${fo_szoveg}" == "${text}"

Finish the registration the stemx or stemc page
    [Documentation]  Elvégzi a regisztráció véglegesítését a stemx vagy stemc felületeken.
    [Arguments]  ${password1}
    run keyword if  "${DE}" == "stemc"  Finish the registration in the token page  ${password1}
      ...  ELSE IF  "${DE}" == "stemx"  Give tha password and push the reset button on the csharp login page  ${password1}


Finish the registration in the token page
    [Documentation]  A token oldalon befejezi a regisztrációt.
                ...  A folyamatban megadja a két megfelelő jelszót,
                ...  majd megvárja amíg a belépési oldal betöltődik.
                ...  A jelszót paraméterben kapja meg.
    [Arguments]  ${jelszo}
    Wait the token page is loaded
    PO_login.Give the password  ${jelszo}
    PO_login.Give the same password  ${jelszo}
    po_login.Push the regisztracio megerositese button
    Wait the succes message and click
    po_login.Waiting the login pager loaded

Login and go to partner details page
    [Arguments]  ${old}  ${bong}  ${em}  ${pas}
    login_resource.Open Vk login page  ${old}  ${bong}
    Give login date and login  ${em}  ${pas}
    Go to the partners page via menu

Login and go to the partners page
    [Arguments]  ${old}  ${bong}  ${login_data}
    Open browser and login to stemx or stemxcity  ${old}  ${bong}  ${login_data}
    #login_resource.Open Vk login page  ${old}  ${bong}
    #Give login date and login  ${em}  ${pas}
    Go to the partners page via menu

Login and go the new partner page
    [Arguments]  ${login_data}
    Login to stemx or stemxcity  ${login_data}
    #Give login date and login  ${em}  ${pas}
    Go to the partners page via menu

Open browser and login to stemx or stemxcity and go to invite partner page
    [Arguments]  ${old}  ${bong}  ${logindata}
    Open browser and login to stemx or stemxcity  ${old}  ${bong}  ${logindata}
    Go to the users invite page

Open browser and login to stemx or stemxcity and go to invite partner page and change language
    [Arguments]  ${old}  ${bong}  ${logindata}
    Open browser and login to stemx or stemxcity and go to invite partner page  ${old}  ${bong}  ${logindata}
    change the language to english via mymenu

Open browser and Login and after go to the partners page
    [Arguments]  ${old}  ${bong}  ${em}  ${pas}
    login_resource.Open Vk login page  ${old}  ${bong}
    Give login date and login  ${em}  ${pas}
    Go to the partners page via menu

Open browser and login and after go to the venues page
    [Documentation]  Nyit egy új böngészőt. Belép, majd elmegy a Venus oldalra.
    [Arguments]  ${old}  ${bon}  ${login}
    Open browser and login to stemx or stemxcity  ${old}  ${bon}  ${login}
    Go to the venues page


Open browser and login and after go to the venues page and get listbox
    [Documentation]  Megnyitja a böngészőt elmegy a venu oldalra és lekéri a lapozó fájlban
                ...  lévő elemek szövegét, majd visszaadja egy szótárban. A szótár első eleme az index, utána jön a szöveg
    [Arguments]  ${old}  ${bon}  ${login}
    Open browser and login and after go to the venues page  ${old}  ${bon}  ${login}
    sleep  3s
    ${lista_elemek_alja} =  Get the page listbox item from the venue page
    log  ${lista_elemek_alja}
    set suite variable  ${lista_elemek_alja}

Open browser and login and after go to the venues page change hungarian language and get listbox
    [Documentation]  Megnyitja a böngészőt elmegy a venu oldalra és lekéri a lapozó fájlban
                ...  lévő elemek szövegét, majd visszaadja egy szótárban. A szótár első eleme az index, utána jön a szöveg
    [Arguments]  ${old}  ${bon}  ${login}
    Open browser and login and after go to the venues page  ${old}  ${bon}  ${login}
    Change the language to hungarian via mymenu
    sleep  3s
    ${lista_elemek_alja} =  Get the page listbox item from the venue page
    log  ${lista_elemek_alja}
    set suite variable  ${lista_elemek_alja}


Open browser and login and after go to the auditoriums page
    [Documentation]  Nyit egy új böngészőt. Belép, majd elmegy az auditoriums oldalra.
    [Arguments]  ${old}  ${bon}  ${login}
    Open browser and login to stemx or stemxcity  ${old}  ${bon}  ${login}
    Go to the auditoriums page

Open browser and login and after go to the auditoriums page and change hu language
    [Documentation]  Nyit egy új böngészőt. Belép, majd elmegy az auditoriums oldalra.
    [Arguments]  ${old}  ${bon}  ${login}
    Open browser and login to stemx or stemxcity  ${old}  ${bon}  ${login}
    Go to the auditoriums page
    Change the language to hungarian via mymenu



Open browser and login go auditoriums page and click the delete
    [Documentation]  Nyit egy új böngészőt. Belép, majd elmegy az auditoriums oldalra.
                ...  Bekapcsolva a törölt nézőterek megjelenítését.
    [Arguments]  ${old}  ${bon}  ${login}
    Open browser and login and after go to the auditoriums page  ${old}  ${bon}  ${login}
    Click the show deleted checkbox
    po_auditoriums.Click the search button
    run keyword and ignore error  Wait until the deleted row visible

Open browser and login and after go to the auditoriums page and change language
    [Documentation]  Nyit egy új böngészőt. Belép, majd elmegy az auditoriums oldalra.
                ...  Majd átváltja a nyelvet.
    [Arguments]  ${old}  ${bon}  ${login}
    Open browser and login and after go to the auditoriums page  ${old}  ${bon}  ${login}
    Change the language to English via mymenu

Open browser and login and go to auditoriums and choose one
    [Arguments]  ${old}  ${bong}  ${login}
    Open browser and login and after go to the auditoriums page  ${old}  ${bong}  ${login}
    ${lista} =  Get the all eyes from the page
    ${elem} =  Get random item from the list  ${lista}
    click element  ${elem}
    Waiting the details of auditorium loaded

Open browser and login and go to auditoriums and choose one and change hungarian language
    [Arguments]  ${old}  ${bong}  ${login}
    Open browser and login and go to auditoriums and choose one  ${old}  ${bong}  ${login}
    Change the language to hungarian via mymenu
    Waiting the details of auditorium loaded

Login and go to the partners page and change lan
    [Arguments]  ${old}  ${bong}  ${em}  ${pas}
    login_resource.Open Vk login page  ${old}  ${bong}
    Give login date and login  ${em}  ${pas}
    Go to the partners page via menu
    Change the language to English via mymenu

Login and go to partner edit page
    [Arguments]  ${old}  ${bong}  ${login_data}
    Open browser and login to stemx or stemxcity  ${oldal_url}  ${bogeszo}  ${login_data}
    Go to the partners page via menu
    Choose item from the status of partner listbox  Aktív
    sleep  3s
    Chose elem and go the the edit page

Login and go to partner edit page and change language
    [Arguments]  ${old}  ${bong}  ${login_data}
    Login and go to partner edit page  ${old}  ${bong}  ${login_data}
    #login_resource.Open Vk login page  ${old}  ${bong}
    #Give regeistration data and click the login button  ${em}  ${pas}
    #Check the login succes or not
    #Go to the partners page via menu
    #Chose elem and go the the edit page
    Change the language to English via mymenu


Login and go to the new partner page and give all data
    [Arguments]  ${oldal}  ${bong}   ${login_data}  ${adat}
    log  ${login_data}
    Login and go to the new partner page  ${oldal}  ${bong}  ${login_data}
    Give the all partner data  ${adat}

Login and go new partner page and give data and change language
    [Arguments]  ${oldal}  ${bong}  ${email}  ${jelszo}  ${adat}
    Login and go to the new partner page  ${oldal}  ${bong}  ${email}  ${jelszo}
    Change the language to English via mymenu
    Give the all partner data  ${adat}
    Click the firstanme input
    sleep  2s


Login and go to the new partner page
    [Arguments]  ${oldal}  ${bong}  ${login_data}
    Login and go to the partners page  ${oldal}  ${bong}  ${login_data}
    Click the new partner
    Waiting the new partner page loaded

Login and go to the new paratner page and change language to english
    [Arguments]  ${oldal}  ${bong}  ${email}  ${jelszo}
    Login and go to the partners page  ${oldal}  ${bong}  ${email}  ${jelszo}
    Click the new partner
    Waiting the new partner page loaded
    Change the language to English via mymenu

Check the error message appear and the error text value
    [Documentation]  Megnézzük, hogy megjelenik-e a hibaüzenet,
                ...  illetve az error hibaüzenet megfelelőe.
    [Arguments]  ${veznev}  ${hibaszoveg}
    ${van3}  ${van4} =  check the elem contain in parent2  ${veznev}  .//app-show-errors/ul/li
    should be true  ${van3}
    ${hibaszoveg2} =  get text  ${van4}
    #element should be visible  ${van4}
    log  ${hibaszoveg2}
    should be true  "${hibaszoveg}" == "${hibaszoveg2}"

Check error message appear on the page
    [Documentation]  Megnézi, hogy az path által azonosított elemen belül
                ...  megjeleneik-e az error hibaüzenet.
    [Arguments]  ${path}  ${index}  ${text}
    @{elem} =  SeleniumLibrary.Get WebElements  ${path}
    ${egye_elem} =  get from list  ${elem}  ${index}
    Check the error message appear and the error text value  ${egye_elem}  ${text}

Reload the page
    [Documentation]  Újratölti az aktuális oldalt és megvárja amig az betöltődik.
    reload page
    po_mymenu.Waiting the page loaded

Give the all partner data
    [Arguments]  ${ADATOK}
    #run keyword if  '${ADATOK}[Firstname][Required]'=='Y'  give the firstname  ${ADATOK}[Firstname][Value]
    ${vfirstname} =  szotarban van e  ${ADATOK}  Firstname
    run keyword if  ${vfirstname}==${TRUE}  give the firstname  ${ADATOK}[Firstname]
    ${vlastname} =  szotarban van e  ${ADATOK}  Lastname
    run keyword if  ${vlastname}==${TRUE}  give the lastname  ${ADATOK}[Lastname]
    ${vemail} =  szotarban van e  ${ADATOK}  Email
    run keyword if  ${vemail}==${TRUE}  give the email of partner  ${ADATOK}[Email]
    ${vcompanyname} =  szotarban van e  ${ADATOK}  Companyname
    run keyword if  ${vcompanyname}==${TRUE}  Give the company name in new partner page  ${ADATOK}[Companyname]
    #Give the company name in new partner page  ${ADATOK}[Companyname]
    ${vcompanylongname} =  szotarban van e  ${ADATOK}  Companylongname
    run keyword if  ${vcompanylongname}==${TRUE}  Give the copany long name  ${ADATOK}[Companylongname]
    #Give the copany long name  ${ADATOK}[Companylongname]
    ${companyregnumber} =  szotarban van e  ${ADATOK}  Companyregnumber
    run keyword if  ${companyregnumber}==${TRUE}  Give the registration number  ${ADATOK}[Companyregnumber]
    #Give the registration number  ${ADATOK}[Companyregnumber]
    ${vcompanycountry} =  szotarban van e  ${ADATOK}  Companycountry
    run keyword if  ${vcompanycountry}==${TRUE}  Give the country2  ${ADATOK}[Companycountry]
    #Give the country2  ${ADATOK}[Companycountry]
    ${companyzipcode} =  szotarban van e  ${ADATOK}  Companyzipcode
    run keyword if  ${companyzipcode}==${TRUE}  Give the zipcode  ${ADATOK}[Companyzipcode]
    #Give the zipcode  ${ADATOK}[Companyzipcode]
    ${companycity} =  szotarban van e  ${ADATOK}  Companycity
    run keyword if  ${companycity}==${TRUE}  Give the city  ${ADATOK}[Companycity]
    #Give the city  ${ADATOK}[Companycity]
    ${companycounty} =  szotarban van e  ${ADATOK}  Companycounty
    run keyword if  ${companycounty}==${TRUE}  Give the county  ${ADATOK}[Companycounty]
    #Give the county  ${ADATOK}[Companycounty]
    ${companystreet} =  szotarban van e  ${ADATOK}  Companystreet
    run keyword if   ${companystreet}==${TRUE}  Give the street  ${ADATOK}[Companystreet]
    #Give the street  ${ADATOK}[Companystreet]
    ${companyhousenumber} =  szotarban van e  ${ADATOK}  Companyhousenumber
    run keyword if  ${companyhousenumber}==${TRUE}  Give the housenumber  ${ADATOK}[Companyhousenumber]
    #Give the housenumber  ${ADATOK}[Companyhousenumber]
    ${companydoor} =  szotarban van e  ${ADATOK}  Companydoor
    run keyword if  ${companydoor}==${TRUE}  Give the door  ${ADATOK}[Companydoor]
    #Give the door  ${ADATOK}[Companydoor]
    ${companyfloor} =  szotarban van e  ${ADATOK}  Companyfloor
    run keyword if  ${companyfloor}==${TRUE}  Give the floor  ${ADATOK}[Companyfloor]
    #Give the floor  ${ADATOK}[Companyfloor]
    ${billingname} =  szotarban van e  ${ADATOK}  Billingname
    run keyword if  ${billingname}==${TRUE}  Give the billing name  ${ADATOK}[Billingname]
    #Give the billing name  ${ADATOK}[Billingname]
    ${taxnumber} =  szotarban van e  ${ADATOK}  Taxnumber
    run keyword if  ${taxnumber}==${TRUE}  Give the billing taxnumber  ${ADATOK}[Taxnumber]
    #Give the billing taxnumber  ${ADATOK}[Taxnumber]
    ${bankname} =  szotarban van e  ${ADATOK}  Bankname
    run keyword if  ${bankname}==${TRUE}  Give the billing bankname  ${ADATOK}[Bankname]
    ${banknumber} =  szotarban van e  ${ADATOK}  Banknumber
    run keyword if  ${banknumber}==${TRUE}   give the billing banknumber   ${ADATOK}[Banknumber]
    #Give the billing bankname   ${ADATOK}[Banknumber]
    ${iban} =  szotarban van e  ${ADATOK}  Iban
    run keyword if  ${iban}==${TRUE}  Give the billing iban number  ${ADATOK}[Iban]
    ${swift} =  szotarban van e  ${ADATOK}  Swift
    run keyword if  ${swift}==${TRUE}  Give the billing swift number  ${ADATOK}[Swift]
    #Give the billing swift number  ${ADATOK}[Swift]
    ${bcountry} =  szotarban van e  ${ADATOK}  Billingcountry
    run keyword if  ${bcountry}==${TRUE}  Give the billing country2  ${ADATOK}[Billingcountry]
    # Give the billing country2
    #Give the billing iban number  ${ADATOK}[Iban]
    ${billingzipcode} =  szotarban van e  ${ADATOK}  Billingzipcode
    run keyword if  ${billingzipcode}==${TRUE}  Give the billing zipcode  ${ADATOK}[Billingzipcode]

    ${billingcity} =  szotarban van e  ${ADATOK}  Billingcity
    run keyword if  ${billingcity}==${TRUE}  Give the billing city   ${ADATOK}[Billingcity]
    ${billingcounty} =  szotarban van e  ${ADATOK}  Billingcounty
    run keyword if  ${billingcounty}==${TRUE}  Give the billing county  ${ADATOK}[Billingcounty]
    # Give the billing county  ${ADATOK}[Billingcounty]
    ${billingstreet} =  szotarban van e  ${ADATOK}  Billingstreet
    run keyword if  ${billingstreet}==${TRUE}  Give the billing street  ${ADATOK}[Billingstreet]
    ${billinghousenumber} =  szotarban van e  ${ADATOK}  Billinghousenumber
    run keyword if  ${billinghousenumber}==${TRUE}  Give the billing housenumber  ${ADATOK}[Billinghousenumber]
    ${billingdoor} =  szotarban van e  ${ADATOK}  Billingdoor
    run keyword if  ${billingdoor}==${TRUE}  Give the billing door  ${ADATOK}[Billingdoor]
    ${billingfloor} =  szotarban van e  ${ADATOK}  Billingfloor
    run keyword if  ${billingfloor}==${TRUE}  Give the billing floor   ${ADATOK}[Billingfloor]
    ${contactfirstname} =  szotarban van e  ${ADATOK}  Contactfirstname
    run keyword if  ${contactfirstname}==${TRUE}  Give the contact firstname  ${ADATOK}[Contactfirstname]
    ${contactlastname} =  szotarban van e  ${ADATOK}  Contactlastname
    run keyword if  ${contactlastname}==${TRUE}  Give the contact lastname  ${ADATOK}[Contactlastname]
    ${contactphonenumber} =  szotarban van e  ${ADATOK}  Contactphonenumber
    run keyword if  ${contactphonenumber}==${TRUE}  Give the contact phone  ${ADATOK}[Contactphonenumber]
    ${contactemail} =  szotarban van e  ${ADATOK}  Contactemail
    run keyword if  ${contactemail}==${TRUE}  Give the contact email  ${ADATOK}[Contactemail]
    ${jobdescription} =  szotarban van e  ${ADATOK}  Jobdesctiption
    run keyword if  ${jobdescription}==${TRUE}  Give the jobdescription  ${ADATOK}[Jobdesctiption]
    #TODO: Ez még ki kell innen tenni.
    #click element  xpath=//*[@formcontrolname="firstName"]
    #sleep  2s

Choose item from listbox
    [Documentation]  Egy listboxból kiválaszt egy adott elemet.
    [Arguments]  ${kivlasztott}  ${xpath}
    scroll to element  ${xpath}  100
    click element  ${xpath}
    wait until element is visible  xpath=//div[@class="cdk-overlay-pane"]
    ${el} =  Common_resource.Get listbox item xpath  ${kivlasztott}  ${xpath}  aria-owns
    click element   ${el}

Go to listbox and get all items xpath
    [Documentation]  Visszaadja a listbox elemek nevét
    ...  például: {nevek} =  Go to listbox and get all items name  {elem_helye}  aria-owns
    [Arguments]  ${xpath}  ${class}
    scroll to element  ${xpath}  100
    click element  ${xpath}
    ${szotar} =  Get listbox item names2  ${xpath}  ${class}
    [Return]  ${szotar}

Get listbox item names
    [Documentation]  Visszaadja a listbox-ban lévő elemek index-ét,
                ...  illetve nevét egy szótárban.
                ...  A szótár kulcsa a sorszám a möggött lévő elem pedig az érték.
    [Arguments]  ${xpath}  ${class}
    ${valami} =  get element attribute  ${xpath}  ${class}
    log  ${valami}
    @{elemek} =  mylibrary.split the text  ${valami}  ${SPACE}
    log  ${elemek}[0]
    log  ${elemek}
    ${szotar} =  create dictionary
    ${i} =  set variable  0
    :FOR  ${valt}  IN  @{elemek}
    \  ${i} =  Evaluate  ${i} + 1
    \  ${resz} =  set variable  //*[@id="${valt}"]/span
    \  log  ${resz}
    \  ${a} =  convert to string  ${i}
    \  set to dictionary  ${szotar}  ${a}  ${resz}
    log  ${szotar}
    [Return]  ${szotar}

Get listbox item names2
    [Documentation]  Visszaadja a listbox-ban lévő elemek index-ét,
                ...  illetve nevét egy szótárban.
                ...  A szótár kulcsa a sorszám a möggött lévő elem pedig az érték.
    [Arguments]  ${xpath}  ${class}
    ${valami} =  get element attribute  ${xpath}  ${class}
    log  ${valami}
    @{elemek} =  mylibrary.split the text  ${valami}  ${SPACE}
    log  ${elemek}[0]
    log  ${elemek}
    ${szotar} =  create dictionary
    ${i} =  set variable  0
    :FOR  ${valt}  IN  @{elemek}
    \  ${i} =  Evaluate  ${i} + 1
    \  ${resz} =  set variable  //*[@id="${valt}"]/span
    \  ${szoveg} =  get text  ${resz}
    \  log  ${resz}
    \  ${a} =  convert to string  ${i}
    \  set to dictionary  ${szotar}  ${a}  ${szoveg}
    log  ${szotar}
    [Return]  ${szotar}


Get text from page common
    [Documentation]  Az adott oldalról visszaadja megadott index elem szövegét.
    [Arguments]  ${index}  ${path}
    Log  ${index}
    @{elem} =  SeleniumLibrary.Get WebElements  ${path}
    ${egye_elem} =  get from list  ${elem}  ${index}
    ${szoveg} =  get text  ${egye_elem}
    [Return]  ${szoveg}

Check text on the page
    [Documentation]  Az oldalon megnézi, hogy a szöveg az megfelelően jelenik-e meg.
    [Arguments]  ${type}  ${text}  ${index}  ${path}  ${normaltext}=${EMPTY}
    ${text_on_the_page} =  Run keyword if  "${type}" == "text"  Get text from page common  ${index}  ${path}
    ...  ELSE IF  "${type}" == "icon"  Get text from icon item common  ${index}
    ...  ELSE IF  "${type}" == "listbox"  Get text of listbox  ${index}  ${path}
    ...  ELSE IF  "${type}" == "pholder"  Get placeholder text of inputbox  ${index}  ${path}
    ...  ELSE IF  "${type}" == "listboxtext"  set variable  ${normaltext}
    should be equal  ${text}  ${text_on_the_page}

Get placeholder text of inputbox
    [Documentation]  Egy inputbox esetében visszaadja a megjelenő placeholder text-et.
    [Arguments]  ${index}  ${path}
    @{elem} =  SeleniumLibrary.Get WebElements  ${path}
    ${kivalasztott} =  get from list  ${elem}  ${index}
    ${szoveg} =  get element attribute  ${kivalasztott}   placeholder
    log  ${szoveg}
    [Return]  ${szoveg}

Get text from icon item common
    [Arguments]  ${index}
    ${elem1} =  Get icon item common  ${index}
    ${elem2} =  Get full icon item common  ${index}
    ${text_on_the_page} =  Get text of icon item  ${elem1}  ${elem2}
    [Return]  ${text_on_the_page}

Get icon item common
    [Documentation]  Vissza a icon nál lévő elemet.
    [Arguments]  ${index}
    @{elem} =  SeleniumLibrary.Get WebElements  ${BEFORE_ICON_TEXT_ID}
    ${egye_elem} =  get from list  ${elem}  ${index}
    [Return]  ${egye_elem}

Get full icon item common
    [Arguments]  ${index}
    @{elem} =  SeleniumLibrary.Get WebElements  ${FULL_ICON_TEXT_ID}
    ${egye_elem} =  get from list  ${elem}  ${index}
    [Return]  ${egye_elem}

Get text of icon item
    [Documentation]  Megnézi, hogy a partnerek oldalon a i con mögötti szöveg megfelelően jelenik-e meg.
    [Arguments]  ${elem1}  ${elem2}
    ${szoveg0} =  get text  ${elem1}
    ${hossz_szoveg0} =  get length  ${szoveg0}
    ${szoveg1} =  get text  ${elem2}
    ${hossz} =  get length  ${szoveg1}
    ${fo_szoveg} =  string of other_string  ${szoveg1}   ${hossz_szoveg0}  ${hossz}
    log  ${szoveg1}
    [Return]  ${fo_szoveg}

Get text of listbox
    [Arguments]  ${index}  ${path}
    [Documentation]  Visszadja a listbox címét
    @{elem} =  SeleniumLibrary.Get WebElements  ${path}
    ${company_country} =  get from list  ${elem}  ${index}
    ${szoveg1} =  get text  ${company_country}
    @{szoveg_lista} =  mylibrary.split the text  ${szoveg1}  ${SPACE}
    ${szoveg} =  set variable  ${szoveg_lista}[0]
    [Return]  ${szoveg}

Get list from items2
    [Documentation]  A megadott xpath elemekből összegyűjti a szöveget.
                ...  Ha szükséges, akkor a megadott karakternél szétvája
                ...  és a megadott indexűt adja vissza.
                ...  {vagas} változóban True, vagy false kell-e
                ...  {xpath}  az adott elemeknek az elérhetőségi listája
                ...  {split_text}  milyen karakternél történjen a vágás
                ...  {index}  hanyadik karaktert adja vissza.
    [Arguments]  ${vagas}  ${xpath}   ${split_text}  ${index}
    @{elemek} =  SeleniumLibrary.Get WebElements  ${xpath}
    @{lista} =  create list
    :FOR  ${elem}  IN   @{elemek}
    \  ${szoveg} =  get text  ${elem}
    \  ${vagott_szoveg} =  run keyword if  ${vagas}==${True}  cut string  ${szoveg}  ${split_text}  ${index}
    \  ...  ELSE  set variable  ${szoveg}
    \  append to list  ${lista}  ${vagott_szoveg}
    log  ${lista}
    [Return]  ${lista}

cut string
    [Documentation]  A megkapottt szöveget a split_text-nél kettévágja,
                ...  majd az index szerinti elemet visszaadja
    [Arguments]  ${text}  ${split_text}  ${index}
    ${szoveg} =  mylibrary.Split The Text  ${text}  ${split_text}
    ${vissza_szoveg} =  set variable  ${szoveg}[${index}]
    [Return]  ${vissza_szoveg}

Check the length is bigger in the list
    [Documentation]  Megnézi, hogy a listában az összes elem hossza nagyobb-e
                ...  mint a megadott érték.
    [Arguments]  ${lista}  ${value}
    :FOR  ${elem}  IN  @{lista}
    \  log  ${elem}
    \  ${hossz} =  get length  ${elem}
    \  should be true  ${hossz} > ${value}

Get random item from the list
    [Documentation]  random elemet visszaad a listából
    [Arguments]  ${lista}
    ${elemszam} =  get length  ${lista}
    ${random} =  Evaluate  random.randint(0, ${elemszam}-1)  modules=random
    log  ${random}
    ${kivlasztott} =  get from list  ${lista}  ${random}
    log  ${kivlasztott}
    [Return]  ${kivlasztott}

Check the result value
    [Documentation]  A kapott listában nézi meg, hogy az ertek paramter megtalalhato-e benne
                ...  ha ah equels==True, akkor teljesen meg kell egyeznie. Ha False, akkor
                ...  azt nézi, hogy az érték benne van-e.
    [Arguments]  ${lista}  ${ertek}  ${equels}
    :FOR  ${elem}  IN  @{lista}
    \  Run Keyword If  ${equels}==${True}  should be equal as strings  ${elem}  ${ertek}
    ...  ELSE  text in2  ${elem}  ${ertek}
    #\  ...  ELSE  should be true  "${ertek}" in "${elem}"
    #\  ...  ELSE  text in2  ${elem}  ${ertek}

text in2
    [Documentation]  Megnézi, hogy az egyik szöveg a másikban benne van-e.
                ...  A szöveget nagybetűsíti és így nézi meg az egyezést.
    [Arguments]  ${value1}  ${miben_keres1}
    ${value} =  robot.libraries.String.convert to uppercase  ${value1}
    ${miben_keres} =  robot.libraries.String.convert to uppercase  ${miben_keres1}
    #should be true  "${value}" in "${miben_keres}"

Check the div object not contains the error message2
    [Documentation]  Megnézzük, hogy az adott object tartalmaz-e error hibaüzenetet.
                ...  Nem szabad, hogy hibaüzenetet tartalmazzon.
    [Arguments]  ${div_object}
    ${van1}  ${van2} =  check the elem contain in parent2  ${div_object}  .//app-show-errors/ul/li
    should not be true  ${van1}

Check the div object contains the error message2
    [Documentation]  Megnézzük, hogy az adott object tartalmaz-e error hibaüzenetet.
                ...   Kell, hogy hibaüzenetet tartalmazzon.
    [Arguments]  ${div_object}  ${text}
    ${van1}  ${van2} =  check the elem contain in parent2  ${div_object}  .//app-show-errors/ul/li
    should be true  ${van1}
    ${szoveg} =  get text  ${van2}
    log  ${szoveg}
    should be equal  ${szoveg}   ${text}


Check error message not apper on the object
    [Documentation]  val
    [Arguments]  ${path}  ${index}
    @{elem} =  SeleniumLibrary.Get WebElements  ${path}
    ${egye_elem} =  get from list  ${elem}  ${index}
    Check the div object not contains the error message2  ${egye_elem}

Check error message on the object
    [Documentation]  Megnézi, hogy az azonosított objectumon belül a hibaüzenet megjelenik-e.
                ...  path változóban adjuk meg az azonosított objectumot.
                ...  index-ben, hogy hanyadik objectumot szeretnék majd megnézni.
                ...  text pedig a szöveg, hogy minek az egyezését kell megnézni.
    [Arguments]  ${path}  ${index}  ${text}
    @{elem} =  SeleniumLibrary.Get WebElements  ${path}
    ${egye_elem} =  get from list  ${elem}  ${index}
    Check the div object contains the error message2  ${egye_elem}  ${text}

Get random string of other string
    [Arguments]  ${kstring}
    ${hossz} =  get length  ${kstring}
    log  ${hossz}
    ${start} =  Evaluate  random.randint(0, ${hossz}-2)  modules=random
    log  ${start}
    ${marad} =  Evaluate  ${hossz}-${start}
    log  ${marad}
    ${mennyit} =  Evaluate  random.randint(1, ${marad})  modules=random
    ${max} =  Evaluate  ${start}+${mennyit}
    ${szoveg} =  String.Get Substring  ${kstring}  ${start}  ${max}
    log  ${szoveg}
    [Return]  ${szoveg}