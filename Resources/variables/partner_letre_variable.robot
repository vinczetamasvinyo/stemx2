*** Variables ***
${PARTNER_INVITE_FOLYAMAT_TEMP_URL} =  https://temp-mail.org/
${PARTNER_INVITE_FOLYAMATA_SUBJECT_ID} =  Meghívás elfogadása
${PARTNER_INVITE_FOLYAMATA_MAIL_TIMEOUT} =  120
${PARTNER_INVITE_FOLYAMATA_SUBJECT_LINK_ID} =  link=Meghívás elfogadása
${PARTNER_INVITE_FOLYAMATA_JO_PASSWORD} =  Vinyo123456
${P_I_F_BODY_LINK} =  link=Regisztáció befejezése

&{Partner_data}  Firstname=Vincze
            ...  Lastname=Tamás
            ...  Email=${EMPTY}
            ...  Companyname=Valami cég
            ...  Companylongname=Valami cégnév hosszú név
            ...  Companyregnumber=12123121212
            ...  Companycountry=Magyarország
            ...  Companyzipcode=1139
            ...  Companycity=Budapest
            ...  Companycounty=Pest
            ...  Companystreet=Füredi utca
            ...  Companyhousenumber=11/D
            ...  Companydoor=41
            ...  Companyfloor=10
            ...  Billingname=Vinyó számlázás
            ...  Taxnumber=1201212121212
            ...  Bankname=OTP
            ...  Banknumber=11773111-11222222
            ...  Iban=Iban szám
            ...  Swift=Swift szám
            ...  Billingcountry=Magyarország
            ...  Billingzipcode=1139
            ...  Billingcity=Budapest
            ...  Billingcounty=Pest
            ...  Billingstreet=Váci út
            ...  Billinghousenumber=99
            ...  Billingdoor=10
            ...  Billingfloor=6.
            ...  Contactfirstname=Vincze
            ...  Contactlastname=Tomi
            ...  Contactphonenumber=+36209602628
            ...  Contactemail=tamas.vincze@interticket.hu
            ...  Jobdesctiption=Tesztelés

&{P_DATA_SMALL}  Firstname=Vincze
            ...  Lastname=Tamás
            ...  Email=${EMPTY}
            ...  Companyname=Valami cég
            ...  Companylongname=Valami cégnév hosszú név
            ...  Companyregnumber=12123121212
            ...  Companycountry=Magyarország
            ...  Companyzipcode=1139
            ...  Companycity=Budapest
            ...  Companystreet=Füredi utca
            ...  Companyhousenumber=11/D
            ...  Billingname=Vinyó számlázás
            ...  Taxnumber=1201212121212
            ...  Bankname=OTP
            ...  Banknumber=11773111-11222222
            ...  Billingcountry=Magyarország
            ...  Billingzipcode=1139
            ...  Billingcity=Budapest
            ...  Billingstreet=Váci út
            ...  Billinghousenumber=99
            ...  Contactfirstname=Vincze
            ...  Contactlastname=Tomi
            ...  Contactphonenumber=+36209602628
            ...  Contactemail=tamas.vincze@interticket.hu


&{Tempmail}  url=${PARTNER_INVITE_FOLYAMAT_TEMP_URL}
        ...  subject=Meghívás elfogadása
        ...  timeout=120
        ...  subjectlink=${PARTNER_INVITE_FOLYAMATA_SUBJECT_LINK_ID}
        ...  bodylink=${P_I_F_BODY_LINK}
