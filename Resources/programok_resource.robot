*** Settings ***
Resource  PO/po_programok.robot
Resource  Common_resource.robot

*** Keywords ***
Waiting the programs page loaded
    [Documentation]  Megvárja amíg a programok oldal betöltődik.
    po_alt.Waiting the page loaded finish
    wait the search input visiable in the programs page


Waiting the create new page loaded
    [Documentation]  Megvárja amíg az új program létrehozása oldal betöltődik.
    wait until the program name input field visiable

Waiting the tickets step page loaded
    [Documentation]  Megvárja amíg a tickets step page oldal betöltődik.
    wait the ticket group input filed visiable in the programs page

Give the picture for the program
    [Documentation]  Feltölti a képeket
    [Arguments]  ${data}
    Wait the gallery step page loaded
    Upload the picture for the program  ${data}

Give the picture for the program and click the next button
    [Documentation]  Feltölti a képeket és megnyomja a tovább gombot.
    [Arguments]  ${data}
    Give the picture for the program  ${data}
    Click the next button

Upload the picture for the program
    [Documentation]  Feltölt képeket
    [Arguments]  ${data}
    ${picture} =  szotarban van e  ${data}  picture
    run keyword if  ${picture}==${TRUE}  upload picture if dictionary incluade picture  ${data}[picture]

upload picture if dictionary incluade picture
    [Documentation]  kepfeltoltes
    [Arguments]  ${data}
    run keyword if  "${data}[upload]"=="true"  upload pictures for the program  ${data}[pictures]

Give the ticketes assigne data for events
    [Arguments]  ${data}
    Waiting the ticket assignment page loaded
    Assign the tickets for the events  ${data}[ticketassigns]

Give the ticketes assigne data for events and click the next button
    [Arguments]  ${data}
    Give the ticketes assigne data for events  ${data}
    po_alt.Click the next button

Assign the tickets for the events
    [Documentation]  A jegyeket hozzárendeli az eseményekez
    [Arguments]  ${ticketassign}
    :FOR  ${ticket}  IN  @{ticketassign}
    \  log  ${ticket}
    \  log  ${ticket}[tickets]
    \  Open the events panel in the tickets assigne  ${ticket}[id]
    \  Click the all ticket or others ticket  ${ticket}
    \  Close the events panel in the tickets assigne  ${ticket}[id]