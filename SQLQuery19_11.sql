select imie as [Imiê], count(*) as [Liczba] from pracownik 
group by imie
order by imie

select imie+' '+nazwisko as [Imiê i nazwisko],id_pracownika as [ID], count(id_stanowiska) as [Liczba stanowisk]
from pracownik inner join stanowisko_pracownik on id_pracownika=pracownik.id
group by id_pracownika, imie,nazwisko
order by imie, nazwisko

select imie+' '+nazwisko as [Imiê i nazwisko], count(id_stanowiska) as [Liczba stanowisk]
from pracownik left join stanowisko_pracownik on id_pracownika=pracownik.id
group by id_pracownika, imie,nazwisko
order by [Liczba stanowisk]

select imie+' '+nazwisko as [imie i nazwisko], count(id_stanowiska) as [liczba stanowisk]
from pracownik
inner join stanowisko_pracownik on pracownik.id=id_pracownika
group by imie+' '+nazwisko

select imie+' '+nazwisko as [Imiê i nazwisko], count(centralka.id) as [Liczba rozmów], 
sum(koszt_rozmowy) as [Koszt] from pracownik left join centralka on numer_wewnetrzny=numer_wewnetrzny_pracownika 
group by pracownik.id, imie+' '+nazwisko order by imie+' '+nazwisko

select imie+' '+nazwisko as [Imiê i nazwisko], nazwa_operatora as [operator],
count(liczba_impulsow) as [Liczba rozmów], sum(koszt_rozmowy) as [Koszt]
from pracownik
left join centralka on numer_wewnetrzny = numer_wewnetrzny_pracownika
left join operator on centralka.numer_lini_od_operatora = operator.id
group by pracownik.id, imie+' '+nazwisko, nazwa_operatora, numer_lini_od_operatora
order by imie+' '+nazwisko

select imie+' '+nazwisko as [Imiê i nazwisko], nazwa_operatora as [operator],
count(liczba_impulsow) as [Liczba rozmów], sum(koszt_rozmowy) as [Koszt]
from pracownik
left join centralka on numer_wewnetrzny = numer_wewnetrzny_pracownika
left join operator on centralka.numer_lini_od_operatora = operator.id
group by pracownik.id, imie+' '+nazwisko, nazwa_operatora
order by imie+' '+nazwisko