select * from pracownik

select * from pracownik, Centralka --iloczyn kartezjañski (?)

select * from pracownik, Centralka, stanowisko

select imie, nazwisko from pracownik
select imie, nazwisko from pracownik where imie like 'A%'

select * from pracownik, stanowisko_pracownik where pracownik.id=stanowisko_pracownik.id_pracownika order by imie, nazwisko

select imie from pracownik, stanowisko_pracownik, stanowisko where pracownik.id=stanowisko_pracownik.id_pracownika and stanowisko_pracownik.id_stanowiska = stanowisko.id 