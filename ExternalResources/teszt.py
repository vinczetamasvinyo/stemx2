lista = [1,2,3,4,5]
lista2 = [2,1,3,4,5]
print(lista)
print(lista2)
lista2.sort()
rendezett = lista2
print(rendezett)
if lista == rendezett:
    print("két lista egyezik")
else:
    print("Nem egyezik a két lista")