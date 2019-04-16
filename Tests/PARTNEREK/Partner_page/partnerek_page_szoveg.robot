*** Settings ***
Resource  ../../../Resources/partnerek_page_szoveg_resource.robot

Suite Setup  Open browser and Login and after go to the partners page  ${OLDAL_URL}  ${bogeszo}  ${box_office1_email_ok}  ${box_office1_password_ok}
Suite Teardown  common.End web test

*** Variables ***
${LAN} =  Hun

*** Test Cases ***
Test the allapot valaszto first item-osszes text
    [Documentation]  A teszt során megnézzük, hogy az állapot választóban lévő
                ...  első elem szövege megfelelő-e.
    [Tags]  szoveg  most
    Checkt the allapot valaszto elso elem szovege  ${PP_VARIABLE_PARTNER_STATUS_LISTBOX_FIRTS_ITEM_TEXT.${LAN}}

Test the allapot valaszto second item-uj text
    [Documentation]  A teszt során megnézzük, hogy az állapot választóban lévő
                ...  második elem szövege megfelelő-e.
    [Tags]  szoveg
    Checkt the allapot valaszto masodik elem szovege  ${PP_VARIABLE_PARTNER_STATUS_LISTBOX_SECOND_ITEM_TEXT.${LAN}}

Test the allapot valaszto third item-uj text
    [Documentation]  A teszt során megnézzük, hogy az állapot választóban lévő
                ...  harmadik elem szövege megfelelő-e.
    [Tags]  szoveg
    Check the allapot valaszto harmadik elem szovege  ${PP_VARIABLE_PARTNER_STATUS_LISTBOX_THIRD_ITEM_TEXT.${LAN}}

Test the allapot valaszto 4 item-uj text
    [Documentation]  A teszt során megnézzük, hogy az állapot választóban lévő
                ...  negyedik elem szövege megfelelő-e.
    [Tags]  szoveg
    Check the allapot valaszto negyedik elem szovege  ${PP_VARIABLE_PARTNER_STATUS_LISTBOX_FOURTH_ITEM_TEXT.${LAN}}

Test the allapot valaszto 5 item-uj text
    [Documentation]  A teszt során megnézzük, hogy az állapot választóban lévő
                ...  ötödik elem szövege megfelelő-e.
    [Tags]  szoveg
    Check the allapot valaszto otodik elem szovege  ${PP_VARIABLE_PARTNER_STATUS_LISTBOX_FIFTH_ITEM_TEXT.${LAN}}

Test the allapot valaszto 6 item-uj text
    [Documentation]  A teszt során megnézzük, hogy az állapot választóban lévő
                ...  hatodik elem szövege megfelelő-e.
    [Tags]  szoveg1
    Check the allapot valaszto hatodik elem szovege  ${PP_VARIABLE_PARTNER_STATUS_LISTBOX_SIXTH_ITEM_TEXT.${LAN}}

Test the allapot valaszto darabszam
    [Documentation]  A teszt során azt nézzük meg, hogy az állapotválasztoban
                ...  csak 6db elem található meg.
    [Tags]  szoveg
    Check the allapot valaszto elemszama  6

Test the partner meghivasa gomb szovege hun
    [Documentation]  Megnézzük, hogy a partner meghívása gomb szövege megfelelő-e.
    [Tags]  szoveg
    Check the partner meghivasa gomb text  ${PP_VARIABLE_INVITE_BUTTON_TEXT.${LAN}}

Test the uj letrehozasa button text
    [Documentation]  A teszt során az új létrehozása gomb szövegét nézzük meg,
                ...  hogy az adott nyelven megfelelően jelenik-e meg.
    [Tags]  szoveg
    Check the uj letrehozasa button text  ${PP_VARIABLE_NEW_PARTNER_BUTTON_TEXT.${LAN}}

Test the partner page head
    [Documentation]  A teszt soránt azt nézzük meg, hogy a partner Page címe
                ...  az megfelelően jelenik-e meg.
    [Tags]  szoveg
    Check the title of partner page  ${PP_VARIABLE_TITLE_TEXT.${LAN}}

Test the "partner neve" text in the partner page
    [Tags]  szoveg
    Check the partner neve text in partner page  ${PP_VARIABLE_PARTNER_NAME_TEXT.${LAN}}

Test the E-mail cim text in the partner page
    [Tags]  szoveg
    Check the email cim text in partner page  ${PP_VARIABLE_EMAIL_ADDRESS_TEXT.${LAN}}

Test the allapot text in the partner page
    [Documentation]  A teszt során azt nézzük meg, hogy az allapot szöveg
                ...  az adott nyelven megfelelően megjelenik-e.
    [Tags]  szoveg
    Check the allapot text in partner page  ${PP_VARIABLE_STATUS_TEXT.${LAN}}

Test the visszallitas button text in the partner page
    [Documentation]  A teszt során azt nézzük meg, hogy a visszállítás
                ...  gomb szövege az adaott nyelven megfelelően jelenik-e meg.
    [Tags]  szoveg
    Check the visszaallit button text in partner page  ${PP_VARIABLE_RESET_BUTTON_TEXT.${LAN}}

Test the Kereses button text in the partner page
    [Documentation]  A teszt során azt nézzük meg, hogy a Keresés gomb
                ...  szövege az adott nyelven megfelelően jelenik-e meg.
    [Tags]  szoveg
    Check the kereses button text in partner page  ${PP_VARIABLE_SEARCH_BUTTON_TEXT.${LAN}}

Text the partner neve text in the table header
    [Documentation]  A teszt soránt azt nézzük meg, hogy partner neve
                ...  szöveg a táblázat címsorában megfelelően jelenik-e meg.
    [Tags]  szoveg
    Check the partner neve text in the table header  ${PP_VARIABLE_PARTNER_NAME_IN_TABLE_HEADER_TEXT.${LAN}}

Test the email cim text in the table header
    [Documentation]  A teszt soránt azt nézzük meg, hogy az email cím
                ...  szöveg a táblázat címsorában megfelelően jelenik-e meg.
    [Tags]  szoveg
    Check the email text in the table header  ${PP_VARIABLE_PARTNER_EMAILCIM_IN_TABLE_HEADER_TEXT.${LAN}}

Test the cim text in the table header
    [Documentation]  A teszt soránt azt nézzük meg, hogy a cím szöveg
                ...  a táblázat címsorában megfelelően jelenik-e meg.
    [Tags]  szoveg
    Check the cim text in the table header  ${PP_VARIABLE_PARTNER_CIM_IN_TABLE_HEADER_TEXT.${LAN}}

Test the allapot text in the table header
    [Documentation]  A teszt soránt azt nézzük meg, hogy az allapot szöveg
                ...  a táblázat címsorában megfelelően jelenik-e meg.
    [Tags]  szoveg
    Check the allapot text in the table header  ${PP_VARIABLE_PARTNER_STATUS_IN_TABLE_HEADER_TEXT.${LAN}}

Test the lehetosegek text in the table header
    [Documentation]  A teszt soránt azt nézzük meg, hogy a lehetosegek szöveg
                ...  a táblázat címsorában megfelelően jelenik-e meg.
    [Tags]  szoveg
    Check the lehetosegek text in the table header  ${PP_VARIABLE_PARTNER_FEATURE_IN_TABLE_HEADER_TEXT.${LAN}}