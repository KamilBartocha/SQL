-- inner join
select imie,nazwisko, id, id_pracownika from pracownik inner join
stanowisko_pracownik on id_pracownika=id

select imie as [Imiê], nazwisko as [Nazwisko],liczba_impulsow as [Czas],
koszt_rozmowy as [Koszt] from pracownik inner join
centralka on numer_wewnetrzny=numer_wewnetrzny_pracownika
order by imie,nazwisko

select imie as [Imiê], nazwisko as [Nazwisko],liczba_impulsow as [Czas],
koszt_rozmowy as [Koszt], nazwa_operatora as [Operator] from pracownik
inner join
centralka on numer_wewnetrzny=numer_wewnetrzny_pracownika
inner join operator on numer_lini_od_operatora=operator.id
order by imie,nazwiskoselect imie as [Imiê], nazwisko as [Nazwisko], nazwa_stanowiska from
pracownik inner join
stanowisko_pracownik on id_pracownika=pracownik.id
inner join stanowisko on id_stanowiska=stanowisko.id
order by imie,nazwisko-- cross join
select imie+' '+nazwisko as [Imiê i nazwisko],nazwa_stanowiska as [Mo¿liwe
stanowisko] from pracownik cross join
stanowisko inner join stanowisko_pracownik on
id_stanowiska=stanowisko.id 

-- left outer join
-- Czy osoby w naszej firmie, które nie korzysta³y ze swojego telefonu s³u¿bowego.
select imie+' '+nazwisko as [Imiê i nazwisko],numer_wewnetrzny as [Numer
pracownika],numer_wychodzacy as [Wybierany numer] from pracownik
left join centralka on numer_wewnetrzny=numer_wewnetrzny_pracownika
order by [Imiê i nazwisko]

--insert into pracownik(id,numer_wewnetrzny,imie,nazwisko)
--values(238,1332,'Adam','Kolan');select imie+' '+nazwisko as [Imiê i nazwisko],numer_wewnetrzny as [Numer
pracownika],numer_wychodzacy as [Wybierany numer] from pracownik
inner join centralka on numer_wewnetrzny=numer_wewnetrzny_pracownika
order by [Imiê i nazwisko]

--Czy s¹ osoby w naszej firmie, które s¹ „bez stanowiska”.
select imie+' '+nazwisko as [Imiê i nazwisko],id as [Id
Pracownika],id_stanowiska as [Id stanowiska] from pracownik
left outer join stanowisko_pracownik on id_pracownika=id

--Czy jest w naszej firmie nieobsadzone stanowisko?

select nazwa_stanowiska as [Stanowisko],imie+' '+nazwisko as [Imiê i
nazwisko] from stanowisko
inner join stanowisko_pracownik on id_stanowiska=stanowisko.id
left outer join pracownik on pracownik.id=id_pracownika
order by nazwa_stanowiska

 select count(*) from stanowisko_pracownik as B
 where B.id_pracownika = A.id

select nazwa_stanowiska as [Stanowisko], liczba_impulsow as [Czas],
koszt_rozmowy as [Koszt] from stanowisko
inner join stanowisko_pracownik on id=id_stanowiska
inner join pracownik on id_pracownika=pracownik.id
inner join centralka on numer_wewnetrzny=numer_wewnetrzny_pracownika


select nazwa_stanowiska as [Stanowisko], 
	(
	select count(*) from centralka, pracownik, stanowisko_pracownik where numer_wewnetrzny=numer_wewnetrzny_pracownika and id_pracownika=pracownik.id and A.id=id_stanowiska
	) 
as [Ile rozmów], (select sum(koszt_rozmowy)
from centralka, pracownik, stanowisko_pracownik 
where numer_wewnetrzny=numer_wewnetrzny_pracownika and id_pracownika=pracownik.id and A.id=id_stanowiska) as [Koszt rozmów] from stanowisko as A

select nazwa_stanowiska as [Stanowisko], 
	(
	select count(*) from centralka inner join pracownik on numer_wewnetrzny=numer_wewnetrzny_pracownika 
	inner join stanowisko_pracownik on id_pracownika=pracownik.id and A.id=id_stanowiska
	) 
	as [Ile rozmów], (select sum(koszt_rozmowy) from centralka 
	inner join pracownik on numer_wewnetrzny=numer_wewnetrzny_pracownika 
	inner join stanowisko_pracownik on id_pracownika=pracownik.id and A.id=id_stanowiska) as [Koszt rozmów] from stanowisko as A