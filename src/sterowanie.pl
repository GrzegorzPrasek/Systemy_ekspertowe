% Moduł sterowania i wnioskowania

% Uzasadnienia rekomendacji na podstawie kluczowych przesłanek.
uzasadnienie_rekomendacji(informatyka, [
	'wysoki profil analityczny',
	'wysoka zgodnosc informatyczna',
	'ulubiony styl pracy indywidualny'
]).

uzasadnienie_rekomendacji(psychologia, [
	'wysoki profil spoleczny',
	'wysoka zgodnosc spoleczna',
	'wysoka chec pracy z ludzmi'
]).

uzasadnienie_rekomendacji(grafika, [
	'wysoki profil kreatywny',
	'wysoka zgodnosc kreatywna',
	'preferowany styl uczenia projektowy'
]).

uzasadnienie_rekomendacji(matematyka, [
	'wysoki profil analityczny',
	'wysoka zgodnosc scisla',
	'zainteresowanie matematyka'
]).

uzasadnienie_rekomendacji(prawo, [
	'wysoka zgodnosc prawno-administracyjna',
	'wysoka gotowosc do dlugiej nauki'
]).

uzasadnienie_rekomendacji(medycyna, [
	'wysoka zgodnosc medyczna',
	'zainteresowanie biologia',
	'wysoka tolerancja stresu'
]).

uzasadnienie_rekomendacji(ekonomia, [
	'wysoka zgodnosc ekonomiczna',
	'wysoka motywacja finansowa'
]).

uzasadnienie_rekomendacji(kognitywistyka, [
	'wysoka zgodnosc interdyscyplinarna',
	'mieszany profil analityczno-spoleczny lub kreatywny'
]).

uzasadnienie_rekomendacji(biotechnologia, [
	'wysoka zgodnosc przyrodniczo-laboratoryjna',
	'zainteresowanie biologia',
	'wysoka preferencja praktycznosci'
]).

uzasadnienie_rekomendacji(filologia_obce, [
	'wysoka zgodnosc humanistyczna',
	'zainteresowanie jezykami',
	'wysoka komunikatywnosc'
]).

uzasadnienie_rekomendacji(turystyka_i_rekreacja, [
	'wysoka zgodnosc uslugowa',
	'wysoka preferencja praktycznosci',
	'wysoka komunikatywnosc'
]).

uzasadnienie_rekomendacji(automatyka_i_robotyka, [
	'wysoki profil analityczny',
	'wysoka zgodnosc techniczna',
	'zainteresowanie informatyka lub matematyka',
	'preferowany styl pracy praktyczny'
]).

uzasadnienie_rekomendacji(informatyka_stosowana, [
	'wysoki profil analityczny',
	'wysoka zgodnosc techniczna',
	'zainteresowanie informatyka',
	'preferencja zastosowan praktycznych'
]).

uzasadnienie_rekomendacji(pedagogika, [
	'wysoki profil spoleczny',
	'wysoka chec pracy z ludzmi',
	'wysoka zgodnosc spoleczna',
	'zainteresowanie psychologia lub edukacja'
]).

% --- Wnioskowanie klasyczne ---
% Reguły prowadzą od odpowiedzi użytkownika do wniosków pośrednich i końcowych
wnioskuj_klasycznie(Wynik) :-
	setof(Kierunek, rekomendacja(Kierunek), Wyniki),
	member(Wynik, Wyniki).

lista_wnioskow_klasycznych(Wyniki) :-
	setof(Kierunek, rekomendacja(Kierunek), Wyniki).

lista_wnioskow_klasycznych([]) :-
	\+ rekomendacja(_).

% --- Wnioskowanie przybliżone ---
% Stosowane, gdy użytkownik nie spełnia wszystkich przesłanek
wnioskuj_przyblizone(Wynik) :-
	przyblizona_rekomendacja(Wynik, _Punkty).

lista_wnioskow_przyblizonych(Wyniki) :-
	findall(wynik(Kierunek, Punkty), przyblizona_rekomendacja(Kierunek, Punkty), Surowe),
	sort(Surowe, Wyniki).

% --- Wnioskowanie rozmyte ---
% Dla pojęć nieostrych (np. wysoka kreatywność)
wnioskuj_rozmycie(Wynik) :-
	rozmyta_rekomendacja(Wynik, _Stopien).

lista_wnioskow_rozmytych(Wyniki) :-
	findall(wynik(Kierunek, Stopien), rozmyta_rekomendacja(Kierunek, Stopien), Surowe),
	sort(Surowe, Wyniki).

% Glowny punkt sterowania: najpierw klasyczne, potem przyblizone, na koncu rozmyte.
uruchom_wnioskowanie(Wynik) :-
	wnioskuj_klasycznie(Wynik), !.
uruchom_wnioskowanie(Wynik) :-
	wnioskuj_przyblizone(Wynik), !.
uruchom_wnioskowanie(Wynik) :-
	wnioskuj_rozmycie(Wynik).

uruchom_i_przedstaw_wynik :-
	uruchom_wnioskowanie(Wynik),
	przedstaw_zgodnosci_grup,
	przedstaw_rekomendacje(Wynik),
	przedstaw_alternatywy.

uruchom_i_przedstaw_wynik :-
	write('Brak rekomendacji dla podanych odpowiedzi.'), nl.

% Prezentacja wyniku koncowego wraz z uzasadnieniem.
przedstaw_rekomendacje(Wynik) :-
	write('Rekomendacja: '), write(Wynik), nl,
	przedstaw_uzasadnienie(Wynik).

przedstaw_zgodnosci_grup :-
	write('Ocena zgodnosci z grupami kierunkow:'), nl,
	przedstaw_zgodnosc('techniczna', zgodnosc_techniczna),
	przedstaw_zgodnosc('scisla', zgodnosc_scisla),
	przedstaw_zgodnosc('informatyczna', zgodnosc_informatyczna),
	przedstaw_zgodnosc('ekonomiczna', zgodnosc_ekonomiczna),
	przedstaw_zgodnosc('spoleczna', zgodnosc_spoleczna),
	przedstaw_zgodnosc('humanistyczna', zgodnosc_humanistyczna),
	przedstaw_zgodnosc('kreatywna', zgodnosc_kreatywna),
	przedstaw_zgodnosc('prawno-administracyjna', zgodnosc_prawno_administracyjna),
	przedstaw_zgodnosc('medyczna', zgodnosc_medyczna),
	przedstaw_zgodnosc('przyrodniczo-laboratoryjna', zgodnosc_przyrodniczo_laboratoryjna),
	przedstaw_zgodnosc('uslugowa', zgodnosc_uslugowa),
	przedstaw_zgodnosc('interdyscyplinarna', zgodnosc_interdyscyplinarna),
	przedstaw_wykluczone_grupy.

przedstaw_wykluczone_grupy :-
	findall(Grupa, wyklucz(Grupa), SuroweWykluczone),
	sort(SuroweWykluczone, Wykluczone),
	(   Wykluczone = []
	->  true
	;   write('Grupy wykluczone na podstawie odpowiedzi:'), nl,
	    przedstaw_powody(Wykluczone)
	).

przedstaw_zgodnosc(Etykieta, Predykat) :-
	Poziom = wysoka,
	Goal =.. [Predykat, Poziom],
	call(Goal), !,
	write('- '), write(Etykieta), write(': '), write(Poziom), nl.
przedstaw_zgodnosc(Etykieta, Predykat) :-
	Poziom = srednia,
	Goal =.. [Predykat, Poziom],
	call(Goal), !,
	write('- '), write(Etykieta), write(': '), write(Poziom), nl.
przedstaw_zgodnosc(_, _).

przedstaw_alternatywy :-
	alternatywy_rekomendacji([]), !,
	write('Brak kierunkow alternatywnych.'), nl.
przedstaw_alternatywy :-
	alternatywy_rekomendacji(Alternatywy),
	write('Kierunki alternatywne:'), nl,
	przedstaw_powody(Alternatywy).

przedstaw_uzasadnienie(Wynik) :-
	uzasadnienie_rekomendacji(Wynik, Powody),
	write('Uzasadnienie:'), nl,
	przedstaw_powody(Powody).

przedstaw_uzasadnienie(Wynik) :-
	\+ uzasadnienie_rekomendacji(Wynik, _),
	write('Brak przygotowanego uzasadnienia dla tej rekomendacji.'), nl.

przedstaw_powody([]).
przedstaw_powody([Powod|Reszta]) :-
	write('- '), write(Powod), nl,
	przedstaw_powody(Reszta).

% Przykladowy wynik zgodny z instrukcja: dialog prowadzi do rekomendacji i uzasadnienia.
przykladowy_wynik_dialogu :-
	Wynik = informatyka,
	przedstaw_rekomendacje(Wynik).
