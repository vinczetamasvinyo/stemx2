
def almenu_id_szoveg(szoveg):
    szoveg2=szoveg[12:len(szoveg)]
    szam = int(szoveg2)+1
    ujszoveg = "cdk-overlay-"+str(szam)
    return ujszoveg

szoveg = "cdk-overlay-1"
print(almenu_id_szoveg(szoveg))