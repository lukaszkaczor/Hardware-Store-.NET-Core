# Sklep internetowy
#### Admin:
Email: admin@test.pl\
Hasło: qwertyuiop

#### Wymagania:
A.NET Core 3.0, MS Sql Server
\
\
Aplikacja sklepu internetowego.
Repozytorium zawiera także program wspomagający uzupełnianie bazy danych. 
Nasłuchuje on magazynu danych ze zdjęciami produktów i automatycznie tworzy w bazie danych galerie i dodaje do nich zdjęcia, 
tak aby admin nie musiał się tym zajmować z poziomu aplikacji. Została do tego użyta usługa "Azure Functions".\
\
Niżej kilka zdjęć z działającej aplikacji sklepu internetowego. 

## Strona główna
### Zawiera następujące elementy:
  1. Nowości - edytowane przez admina
  2. Okazja dnia
  3. Bestsellery - lista 8 najlepiej sprzedających się przedmiotów
  4. Strefa marek - lista marek, których produkty są dostępne w sklepie
  5. Informacje - lista postów edytowana przez admina -- niedokończone
  6. Polecane - lista polecanych produktów, edytowana przez admina
  
  ![Alt text](/HardwareStore/wwwroot/img/main1.png "main1")
  ![Alt text](/HardwareStore/wwwroot/img/main2.png "main2")
  
## Lista wyszukiwania
### Zawiera następujące elementy:
  1. Liste przefiltrowanych produktów
  2. Dodatkowe filtry, np. cena, kategoria, producent itp.

Wyszukiwać można po nazwach: produktów, kategorii, sekcji, producentów.
  
  ![Alt text](/HardwareStore/wwwroot/img/search.png "search")
  
 ## Strona produktu
### Zawiera następujące elementy:
  1. Informacje o produkcie
  2. Galerię zdjęć
  3. Specyfikację
  4. Możliwość oceny
  5. Przycisk dodania do koszyka i pole do ustawienia ilości

  ![Alt text](/HardwareStore/wwwroot/img/product.png "product")

 ## Koszyk
Można w nim dostosować swoje zamówienie. Z jego poziomu można przejść do finalizacji zamówienia. 
![Alt text](/HardwareStore/wwwroot/img/cart.png "cart")


## Szczegóły dostawy
Znajduję się tu forma do podania adresu wysyłki, jak i sposobu dostępnych opcji dostawy i płatności, które to odczytywane są z bazy danych.
![Alt text](/HardwareStore/wwwroot/img/summary.png "summary")

## Edycja profilu
### Zawiera następujące elementy:
  1. Forma do uaktualnienia danych kontaktowych
  2. Podgląd listy zamówień użytkownika
  3. Zmiana hasła
  
  ![Alt text](/HardwareStore/wwwroot/img/userpage.png "userpage")
  
  
## Panel admina
### Zawiera następujące elementy:
  1. Zarządzanie rolami użytkowników
    ![Alt text](/HardwareStore/wwwroot/img/admin.png "admin")
  2. Osługa zamówień
    ![Alt text](/HardwareStore/wwwroot/img/orders.png "admin")
    ![Alt text](/HardwareStore/wwwroot/img/orderdetails.png "admin")
  3. Zarządzanie bazą danych
    ![Alt text](/HardwareStore/wwwroot/img/crud.png "admin")
  
  
