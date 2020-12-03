select imie, nazwisko, id_stanowiska 
from pracownik, stanowisko_pracownik 
where pracownik.id = stanowisko_pracownik.id_pracownika
order by imie, nazwisko

select imie+' '+nazwisko as [Imiê i nazwisko], id_stanowiska 
from pracownik, stanowisko_pracownik 
where pracownik.id = stanowisko_pracownik.id_pracownika
order by imie, nazwisko

select imie+' '+nazwisko as [Imiê i nazwisko], nazwa_stanowiska as [Stanowisko], id_stanowiska as [Numer stanowiska]
from pracownik, stanowisko_pracownik, stanowisko 
where pracownik.id = stanowisko_pracownik.id_pracownika and stanowisko_pracownik.id_stanowiska = stanowisko.id
order by imie, nazwisko

select count(*) from stanowisko_pracownik

select id as [Numer Pracownika],
(
 select count(*) from stanowisko_pracownik as B
 where B.id_pracownika = A.id
)
as [Liczba stanowisk]
from pracownik as A

select imie, nazwisko,
(
 select count(*) from stanowisko_pracownik as B
 where B.id_pracownika = A.id
)
as [Liczba stanowisk]
from pracownik as A

select nazwa_stanowiska as [nazwa stanowska],
(
select count(*) from stanowisko_pracownik as B
where B.id_stanowiska=A.id
)
as [Liczba ludzi]
from stanowisko as A


select distinct imie as [Imiê],
(
select count(*) from pracownik as B
where B.imie = A.imie
)
as [Liczba osób]
from pracownik as A


select imie+' '+nazwisko as [Imiê i nazwisko],
(
select count(*) from centralka as B
where B.numer_wewnetrzny_pracownika = A.numer_wewnetrzny
)
as [Liczba rozmów]
from pracownik as A


select imie+' '+nazwisko as [Imiê i nazwisko]
from pracownik as A
where 
(
select count(*) from stanowisko_pracownik as B
where B.id_pracownika = A.id
) = 0


select nazwa_stanowiska as [Stanowisko]
from stanowisko as A
where (
select count(*) from stanowisko_pracownik as B
where B.id_stanowiska = A.id
) = 0