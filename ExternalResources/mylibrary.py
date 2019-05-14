from robot.libraries.BuiltIn import BuiltIn
from selenium import webdriver
import csv
import locale
from datetime import date, datetime, time
import time

import random

def read_from_file(path):
    file = open(path, encoding='utf-8')
    text = file.read()
    return text

def read_csv_file(filename):
    data = []
    with open(filename,'r') as csvfile:
        reader = csv.reader(csvfile)
        for row in reader:
            data.append(row)
    csvfile.close()
    return data

def get_current_browser():
    browser = BuiltIn().get_library_instance('SeleniumLibrary')._current_browser()
    return browser

def get_tittle_via_python():
    driver = get_current_browser()
    title = driver.title
    return title

def click_hirlevel_via_python():
    driver = get_current_browser()
    driver.find_element_by_id('newsletterLink').click()

def szabad_jegyek():
    driver = get_current_browser()
    helyek = driver.find_elements_by_xpath("//*[@status='0']")
    return helyek

def jegy_kijeloles():
    driver = get_current_browser()
    helyek = driver.find_elements_by_xpath("//*[@status='0']")
    webdriver.ActionChains(driver).move_to_element(helyek[0]).click().perform()

def menukattintas():
    driver = get_current_browser()
    helyek = driver.find_element_by_xpath("//mat-option[@id='mat-option-3']")
    webdriver.ActionChains(driver).move_to_element(helyek).click().perform()

def get_time_in_string():
    import datetime
    now = datetime.datetime.now()
    szoveg = now.strftime("%m%d%H%M%S")
    return szoveg


def actionchangesajat(xpath):
    driver = get_current_browser()
    helyek = driver.find_element_by_xpath(xpath)
    webdriver.ActionChains(driver).move_to_element(helyek).click().perform()

def venu_nev():
    driver = get_current_browser()
    venue_lista = driver.find_elements_by_xpath("//boxoffice-sales-product-list-item")
    venunev = venue_lista[0].find_element_by_xpath("//div[@class='title']")
    return venunev.text

def venu_nev2():
    driver = get_current_browser()
    venue_lista = driver.find_elements_by_xpath("//boxoffice-sales-product-list-item")
    venunev = venue_lista[0].find_element_by_xpath("//div[@class='title']")
    return venunev.text

def audit_name():
    driver = get_current_browser()
    venue_lista = driver.find_elements_by_xpath("//boxoffice-sales-product-list-item")
    auditname = venue_lista[0].find_element_by_xpath("//*[@class='auditorium-name']")
    return auditname.text, auditname

def get_parent_child_object(parent_xpath, child_xpath):
    driver = get_current_browser()
    parent = driver.find_elements_by_xpath(parent_xpath)
    child = parent[0].find_element_by_xpath(child_xpath)
    return child

def get_child_object(parent, child_xpath):
    driver = get_current_browser()
    child = parent.find_element_by_xpath(child_xpath)
    return child

def check_the_elem_contain_in_parent(parent, child_xpath):
    driver = get_current_browser()
    child = parent.find_element_by_xpath(child_xpath)
    return child

def check_the_elem_contain_in_parent2(parent, child_xpath):
    driver = get_current_browser()
    try:
        child = parent.find_element_by_xpath(child_xpath)
        visszaad = True
    except:
        visszaad = False
    finally:
        if visszaad==False:
            child = None
    return visszaad, child

def date_string_hu_to_date(datestring):
    import locale
    from datetime import date, datetime, time
    # locale.setlocale(locale.LC_ALL, 'hu_HU')
    eredmeny = True
    dateobject = datetime.strptime('2019. január 30., szerda', "%Y. %B %d., %A")
    try:
        print('valami')
        dateobject = datetime.strptime(datestring, "%Y. %B %d., %A")
    except:
        eredmeny = False
    return eredmeny

def return_date_text(text_date):
    from datetime import date, datetime, time
    from babel.dates import format_date, format_datetime, format_time
    honapok = {'január': 1, 'február': 2, 'március': 3, 'április': 4, 'május': 5, 'június': 6, 'július': 7, 'augusztus': 8, 'szeptember': 9, 'október': 10, 'november': 11, 'december': 12}
    cut_string = text_date.split(' ')
    honap = cut_string[1]
    nap = cut_string[2].split('.')
    evs = cut_string[0][0:4]
    honapszama = honapok[honap]
    naps = nap[0]
    d = date(int(evs), honapszama, int(naps))
    return format_date(d, format='full', locale='hu')

def elem_keresese(elemkeres):
    driver = get_current_browser()
    #helyek = driver.find_element_by_class_name(elemkeres)
    helyek = driver.find_element_by_css_selector(elemkeres)
    #return helyek

def string_of_other_string(string, start, end):
    start2 = int(start)
    end2 = int(end)
    szoveg = string[start2:end2]
    return szoveg

def check_the_page_finish_loaded():
    import datetime
    import time
    #driver = get_current_browser()
    starttime = datetime.datetime.now()
    timeout = False
    if driver.execute_script('return document.readyState;') == 'complete':
        betoltve = True
        print("elso betöltes sikeres")
    else:
        betoltve = False
    while (betoltve==False) and (timeout==False):
        time.sleep(0.2)
        if driver.execute_script('return document.readyState;') == 'complete':
            betoltve = True
            #print("betoltes vege")
        else:
            most = datetime.datetime.now()
            ido = most - starttime
            print(ido.total_seconds())
            if ido.total_seconds() > 30:
                timeout = True
def split_the_text(szoveg,karakter):
    lista = szoveg.split(karakter)
    return lista

def  szotarban_van_e(szotar, elem):
    benne_van = False
    if elem in szotar:
        benne_van = True
    else:
        print("nincs benne")
    return benne_van

def create_address_string(lan,data):
    floor = ""
    door = ""
    szoveg = ""
    if lan == "Hun":
        szoveg = data["zipcode"] + ' ' + data["city"] + ", " + data["street"] \
                 + " " + data["housenumber"]
        if "floor" in data:
            floor = " "+data["floor"]+". Emelet"
        if "door"  in data:
            door = " "+data["door"]
        szoveg = szoveg + floor + door
    elif lan == "En":
        szoveg = data["door"]+" "+data["floor"]+". Floor "+data["housenumber"]+" "\
                 +data["street"]+", "+data["city"]+" "+data["zipcode"]
    return szoveg

def almenu_id_szoveg(szoveg):
    szoveg2=szoveg[12:len(szoveg)]
    szam = int(szoveg2)+1
    ujszoveg = "cdk-overlay-"+str(szam)
    return ujszoveg

""""
def create_address_string(lan,data):
    if lan == "Hun":
        floor = ""
        door  = ""        
        szoveg = data["Companyzipcode"] + ' ' + data["Companycity"] + ", " + data["Companystreet"] \
                 + " " + data["Companyhousenumber"]
        if "Companyfloor" in data:
            floor = " "+data["Companyfloor"]+". Emelet"
        if "Companydoor"  in data:
            door = " "+data["Companydoor"]
        szoveg = szoveg + floor + door
    elif lan == "En":
        szoveg = data["Companydoor"]+" "+data["Companyfloor"]+". Floor "+data["Companyhousenumber"]+" "\
                 +data["Companystreet"]+", "+data["Companycity"]+" "+data["Companyzipcode"]
    return szoveg
"""
"""    
cim = {"Zipcode": "1144", "Companycity": "Budapest","Companystreet":"Füredi utca",
       "Companyhousenumber":"11/D","Companyfloor": "10","Companydoor":"41"
       }
print(create_address_string("En",cim))
"""
#driver = webdriver.Chrome('chromedriver.exe')
#driver.get('http://dev.varoskartya.com')
#check_the_page_finish_loaded()
"""
email = driver.find_element_by_xpath("//input[@formcontrolname='username']")
jelszo = driver.find_element_by_xpath("//input[@formcontrolname='password']")
email.send_keys("admin@interticket.hu")
jelszo.send_keys("Password123")
gomb = driver.find_element_by_xpath("//button[@type='submit']")
gomb.click()
time.sleep(3)
driver.get("https://dev.varoskartya.com/#/admin/user-management/partners/invite")
time.sleep(3)
elem = driver.find_elements_by_xpath(".//div[@class='columns small-12 medium-6']")
#elem = driver.find_elements_by_xpath("//*[@id='mainContent']/app-page-content/section/div[2]/div/div/app-user-management/user-management-partners/app-partner-invite/form/div[1]/div/div/div/div/div[2]/div[1]")
time.sleep(1)
kereszt = elem[0]
mezo = kereszt.find_element_by_xpath("//input[@formcontrolname='firstName']")
time.sleep(2)
#driver.find_element_by_id('newsletterLink').click()
"""

#from datetime import date, datetime, time
# from babel.dates import format_date, format_datetime, format_time
"""
import locale
locale.setlocale(locale.LC_ALL,'hu_HU')
# ez működik
# dateobject = datetime.strptime('2019.január.01',"%Y.%B.%d")
# ez is működik
# dateobject = datetime.strptime('2019. január 30., szerda',"%Y. %B %d., %A")
"""
"""
d = date(2007, 4, 1)
print(format_date(d, format='full', locale='hu'))
print(datetime.now().strftime("%Y. %b %d., %A"))


string = '2007. április 1., vasárnap'
dateobject = datetime.strptime(string,"%Y. %b %d., %a")
"""
# print(date_string_hu_to_date('2019. január 30., szerda'))
"""
string = '2007. április 1., vasárnap'
cut_string = string.split(' ')
print(cut_string)
honapok = {'Január': 01}
if 'Január' in honapok:
    print('Benne van')
else:
    print('Nincs benne')
"""
"""
d = date(2019, 3, 20)
print(format_date(d, "DD MMMM Y", locale='HU'))
print(format_date(d, format='full', locale='hu'))
cut_string = string.split(' ')
nap = cut_string[2].split('.')
print(nap)
print(cut_string)
"""
"""
string = '2019. február 12., vasárnap'
print(return_date_text(string))
"""