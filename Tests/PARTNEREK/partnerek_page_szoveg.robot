*** Settings ***
Resource  ../../Resources/partner_invite_resource.robot
Resource  ../../Resources/login_resource.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/PO/po_menu.robot
Library  ../../ExternalResources/mylibrary.py
Resource  ../../Resources/variables.robot
Variables  ../../Resources/variable.py
Library  SeleniumLibrary
Library  Collections
Library  robot.libraries.String  WITH NAME  SR
Resource  ../../Resources/partner_invite_common_resource.robot
Resource  ../../Resources/partnerek_page_szoveg_resource.robot

Suite Setup  Login and go to partners page
#Test Setup  login_resource.Open Vk login page  ${OLDAL_URL}  ${bogeszo}
#Test Teardown  common.End web test

*** Variables ***
${P_P_SZ_PARTNER_MEGHIVASA_BUTTON_TEXT} =  Partner meghívása
${P_P_SZ_TITLE_TEXT} =  Partnerek
${P_P_SZ_PARTNER_NEVE_TEXT} =  Partner neve
${P_P_SZ_EMAILCIM_TEXT} =  E-mail cím
${P_P_SZ_ALLAPOT_TEXT} =  Állapot
${P_P_SZ_VISSZAALLIT_BUTTON_TEXT} =  Visszaállítás
${P_P_SZ_SEARCH_BUTTON_TEXT} =  Keresés
${P_P_SZ_PARTNER_NAME_IN_TABLE_HEADER_TEXT} =  Partner neve
${P_P_SZ_PARTNER_EMAILCIM_IN_TABLE_HEADER_TEXT} =  E-mail cím
${P_P_SZ_PARTNER_CIM_IN_TABLE_HEADER_TEXT} =  Cím
${P_P_SZ_PARTNER_ALLAPOT_IN_TABLE_HEADER_TEXT} =  Állapot
${P_P_SZ_PARTNER_LEHETOSEGEK_IN_TABLE_HEADER_TEXT} =  Lehetőségek
${P_P_SZ_PARTNER_NEW_PARTNER_BUTTON_TEXT} =  Új létrehozása
${P_P_SZ_PARTNER_ALLAPOT_VALASZTO_FIRTS_ITEM_TEXT} =  Összes
${P_P_SZ_PARTNER_ALLAPOT_VALASZTO_SECOND_ITEM_TEXT} =  Új
${P_P_SZ_PARTNER_ALLAPOT_VALASZTO_THIRD_ITEM_TEXT} =  Jóváhagyásra vár
${P_P_SZ_PARTNER_ALLAPOT_VALASZTO_FOURTH_ITEM_TEXT} =  Aktív
${P_P_SZ_PARTNER_ALLAPOT_VALASZTO_FIFTH_ITEM_TEXT} =  Felfüggesztve
${P_P_SZ_PARTNER_ALLAPOT_VALASZTO_SIXTH_ITEM_TEXT} =  Törölt

*** Test Cases ***
Test the allapot valaszto first item-osszes text
    [Documentation]  A teszt során megnézzük, hogy az állapot választóban lévő
                ...  első elem szövege megfelelő-e.
    [Tags]  szoveg
    Checkt the allapot valaszto elso elem szovege  ${P_P_SZ_PARTNER_ALLAPOT_VALASZTO_FIRTS_ITEM_TEXT}

Test the allapot valaszto second item-uj text
    [Documentation]  A teszt során megnézzük, hogy az állapot választóban lévő
                ...  második elem szövege megfelelő-e.
    [Tags]  szoveg
    Checkt the allapot valaszto masodik elem szovege  ${P_P_SZ_PARTNER_ALLAPOT_VALASZTO_SECOND_ITEM_TEXT}

Test the allapot valaszto third item-uj text
    [Documentation]  A teszt során megnézzük, hogy az állapot választóban lévő
                ...  harmadik elem szövege megfelelő-e.
    [Tags]  szoveg
    Check the allapot valaszto harmadik elem szovege  ${P_P_SZ_PARTNER_ALLAPOT_VALASZTO_THIRD_ITEM_TEXT}

Test the allapot valaszto 4 item-uj text
    [Documentation]  A teszt során megnézzük, hogy az állapot választóban lévő
                ...  negyedik elem szövege megfelelő-e.
    [Tags]  szoveg
    Check the allapot valaszto negyedik elem szovege  ${P_P_SZ_PARTNER_ALLAPOT_VALASZTO_FOURTH_ITEM_TEXT}

Test the allapot valaszto 5 item-uj text
    [Documentation]  A teszt során megnézzük, hogy az állapot választóban lévő
                ...  ötödik elem szövege megfelelő-e.
    [Tags]  szoveg
    Check the allapot valaszto otodik elem szovege  ${P_P_SZ_PARTNER_ALLAPOT_VALASZTO_FIFTH_ITEM_TEXT}

Test the allapot valaszto 6 item-uj text
    [Documentation]  A teszt során megnézzük, hogy az állapot választóban lévő
                ...  hatodik elem szövege megfelelő-e.
    [Tags]  szoveg1
    Check the allapot valaszto hatodik elem szovege  ${P_P_SZ_PARTNER_ALLAPOT_VALASZTO_SIXTH_ITEM_TEXT}

Test the allapot vlaszto darabszam
    [Documentation]  A teszt során azt nézzük meg, hogy az állapotválasztoban
                ...  csak 6db elem található meg.
    [Tags]  szoveg
    Check the allapot valaszto elemszama  6

Test the partner meghivasa gomb szovege hun
    [Documentation]  Megnézzük, hogy a partner meghívása gomb szövege megfelelő-e.
    [Tags]  szoveg
    Log  valami
    #click element  id=mat-select-1
    #sleep  2st
    #${valami} =  get text  xpath=//mat-option[1]/span
    #log  ${valami}
    #click element  id=mat-option-7

    #@{elem} =  SeleniumLibrary.Get WebElements  xpath=//mat-option/span
    #log  @{elem}
    #log  ${elem}
    #${elemszam} =  get length  ${elem}
    #Give regeistration data and click the login button  ${box_office1_email_ok}  ${box_office1_password_ok }
    #Check the login succes or not
    #Go to the partners page via menu
    Check the partner meghivasa gomb text  ${P_P_SZ_PARTNER_MEGHIVASA_BUTTON_TEXT}

Test the uj letrehozasa button text
    [Documentation]  A teszt során az új létrehozása gomb szövegét nézzük meg,
                ...  hogy az adott nyelven megfelelően jelenik-e meg.
    [Tags]  szoveg
    Check the uj letrehozasa button text  ${P_P_SZ_PARTNER_NEW_PARTNER_BUTTON_TEXT}

Test the partner page head
    [Documentation]  A teszt soránt azt nézzük meg, hogy a partner Page címe
                ...  az megfelelően jelenik-e meg.
    [Tags]  szoveg
    Check the title of partner page  ${P_P_SZ_TITLE_TEXT}

Test the "partner neve" text in the partner page
    [Tags]  szoveg
    Check the partner neve text in partner page  ${P_P_SZ_PARTNER_NEVE_TEXT}

Test the E-mail cim text in the partner page
    [Tags]  szoveg
    Check the email cim text in partner page  ${P_P_SZ_EMAILCIM_TEXT}

Test the allapot text in the partner page
    [Documentation]  A teszt során azt nézzük meg, hogy az allapot szöveg
                ...  az adott nyelven megfelelően megjelenik-e.
    [Tags]  szoveg
    Check the allapot text in partner page  ${P_P_SZ_ALLAPOT_TEXT}

Test the visszallitas button text in the partner page
    [Documentation]  A teszt során azt nézzük meg, hogy a visszállítás
                ...  gomb szövege az adaott nyelven megfelelően jelenik-e meg.
    [Tags]  szoveg
    Check the visszaallit button text in partner page  ${P_P_SZ_VISSZAALLIT_BUTTON_TEXT}

Test the Kereses button text in the partner page
    [Documentation]  A teszt során azt nézzük meg, hogy a Keresés gomb
                ...  szövege az adott nyelven megfelelően jelenik-e meg.
    [Tags]  szoveg
    Check the kereses button text in partner page  ${P_P_SZ_SEARCH_BUTTON_TEXT}

Text the partner neve text in the table header
    [Documentation]  A teszt soránt azt nézzük meg, hogy partner neve
                ...  szöveg a táblázat címsorában megfelelően jelenik-e meg.
    [Tags]  szoveg
    Check the partner neve text in the table header  ${P_P_SZ_PARTNER_NAME_IN_TABLE_HEADER_TEXT}

Test the email cim text in the table header
    [Documentation]  A teszt soránt azt nézzük meg, hogy az email cím
                ...  szöveg a táblázat címsorában megfelelően jelenik-e meg.
    [Tags]  szoveg
    Check the email text in the table header  ${P_P_SZ_PARTNER_EMAILCIM_IN_TABLE_HEADER_TEXT}

Test the cim text in the table header
    [Documentation]  A teszt soránt azt nézzük meg, hogy a cím szöveg
                ...  a táblázat címsorában megfelelően jelenik-e meg.
    [Tags]  szoveg
    Check the cim text in the table header  ${P_P_SZ_PARTNER_CIM_IN_TABLE_HEADER_TEXT}

Test the allapot text in the table header
    [Documentation]  A teszt soránt azt nézzük meg, hogy az allapot szöveg
                ...  a táblázat címsorában megfelelően jelenik-e meg.
    [Tags]  szoveg
    Check the allapot text in the table header  ${P_P_SZ_PARTNER_ALLAPOT_IN_TABLE_HEADER_TEXT}

Test the lehetosegek text in the table header
    [Documentation]  A teszt soránt azt nézzük meg, hogy a lehetosegek szöveg
                ...  a táblázat címsorában megfelelően jelenik-e meg.
    [Tags]  szoveg
    Check the lehetosegek text in the table header  ${P_P_SZ_PARTNER_LEHETOSEGEK_IN_TABLE_HEADER_TEXT}