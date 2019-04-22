def egyenlo():
    return False

def return_string():
    return "valami return string"

def egyenlo2(a, b):
    if a == b:
        return True
    else:
        return False

def osszead_string(a, b):
    return a+b

def windows_scroll(y,y2):
    if type(y2) == str:
        y3 = int(y2)
    else:
        y3 = y2
    return "window.scrollTo(0," + str(y-(y3))+")"

def split_the_text(szoveg,karakter):
    lista = szoveg.split(karakter)
    return lista

def lista(szotar, elem):
    elemek = list(szotar.keys())
    i =-1
    l = False
    while i<len(elemek)-1 and not l:
        i=i+1
        if szotar[elemek[i]] == elem:
            l=True
            print(szotar[elemek[i]])
    if l==False:
        return 1
    else:
        return 0, elemek[i]