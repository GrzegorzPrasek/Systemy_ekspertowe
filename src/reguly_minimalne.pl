% Moduł wyznaczania reguł minimalnych, reduktów, rdzenia

% --- Wyznaczanie reguł minimalnych ---
% Celem jest wskazanie minimalnego zbioru atrybutów potrzebnych do uzyskania rekomendacji,
% identyfikacja reguł kluczowych oraz zwiększenie przejrzystości systemu.

% --- Definicje ---
% Redukt: najmniejszy zbiór atrybutów pozwalający na te same decyzje co pełny zestaw.
% Rdzeń: zbiór wszystkich niezbędnych atrybutów (występujących w każdym redukcie).

% --- Przykładowa tablica decyzyjna (do testów) ---
% obiekt(Id, PoziomAnalityczny, Kreatywnosc, Komunikatywnosc, LubiMatematyke, Rekomendacja).
obiekt(u1, wysoki, niska, niska, tak, informatyka).
obiekt(u2, wysoki, niska, srednia, tak, informatyka).
obiekt(u3, niski, wysoka, wysoka, nie, pedagogika).
obiekt(u4, sredni, wysoka, srednia, nie, grafika).
obiekt(u5, niski, niska, wysoka, nie, pedagogika).

atrybuty_warunkowe([poziom_analityczny, kreatywnosc, komunikatywnosc, lubi_matematyke]).

minimalne_atrybuty_rekomendacji(informatyka,
	[zainteresowania_przedmiotowe, poziom_analityczny, ulubiony_styl_pracy]).
minimalne_atrybuty_rekomendacji(psychologia,
	[chec_pracy_z_ludzmi, komunikatywnosc, tolerancja_stresu]).
minimalne_atrybuty_rekomendacji(grafika,
	[kreatywnosc, zainteresowania_przedmiotowe, preferowany_styl_uczenia_sie]).

kluczowe_reguly_dla_rekomendacji(informatyka,
	[profil_analityczny_wysoki, zainteresowanie_informatyka, styl_pracy_indywidualny]).
kluczowe_reguly_dla_rekomendacji(psychologia,
	[profil_spoleczny_wysoki, zainteresowanie_psychologia, chec_pracy_z_ludzmi_wysoka]).
kluczowe_reguly_dla_rekomendacji(grafika,
	[profil_kreatywny_wysoki, zainteresowanie_sztuka, styl_uczenia_projektowy]).

wyjasnij_rekomendacje(Kierunek, Atrybuty, Reguly) :-
	minimalne_atrybuty_rekomendacji(Kierunek, Atrybuty),
	kluczowe_reguly_dla_rekomendacji(Kierunek, Reguly).

identyfikatory_obiektow(Ids) :-
	findall(Id, obiekt(Id, _, _, _, _, _), Ids).

decyzja_obiektu(Id, Decyzja) :-
	obiekt(Id, _, _, _, _, Decyzja).

wartosc_atrybutu(Id, poziom_analityczny, Wartosc) :-
	obiekt(Id, Wartosc, _, _, _, _).
wartosc_atrybutu(Id, kreatywnosc, Wartosc) :-
	obiekt(Id, _, Wartosc, _, _, _).
wartosc_atrybutu(Id, komunikatywnosc, Wartosc) :-
	obiekt(Id, _, _, Wartosc, _, _).
wartosc_atrybutu(Id, lubi_matematyke, Wartosc) :-
	obiekt(Id, _, _, _, Wartosc, _).

wektor_atrybutow(Id, Atrybuty, Wektor) :-
	findall(Wartosc,
		(member(Atrybut, Atrybuty), wartosc_atrybutu(Id, Atrybut, Wartosc)),
		Wektor).

% --- Klasy nierozroznialnosci i relacja IND(B) ---
rozroznialnosc(Atrybuty, Klasy) :-
	identyfikatory_obiektow(Ids),
	findall(Wektor-Id,
		(member(Id, Ids), wektor_atrybutow(Id, Atrybuty, Wektor)),
		Pary),
	klucze_par(Pary, Klucze),
	sort(Klucze, UnikalneKlucze),
	findall(Klasa,
		(member(Klucz, UnikalneKlucze), znajdz_klase(Pary, Klucz, Klasa)),
		KlasyNieuporzadkowane),
	sort_klasy(KlasyNieuporzadkowane, Klasy).

klucze_par([], []).
klucze_par([Klucz-_|Reszta], [Klucz|Klucze]) :-
	klucze_par(Reszta, Klucze).

znajdz_klase(Pary, Klucz, Klasa) :-
	findall(Id, member(Klucz-Id, Pary), Ids),
	sort(Ids, Klasa).

sort_klasy(Klasy, Posortowane) :-
	maplist(sort, Klasy, WstepniePosortowane),
	sort(WstepniePosortowane, Posortowane).

% --- Wyznaczanie jądra (rdzenia) ---
% Krok 1: znajdź atrybuty, których usunięcie zmienia rozróżnialność obiektów
jadro(Atrybuty, Jadro) :-
	findall(A, (member(A, Atrybuty), niezbedny(A, Atrybuty)), Jadro).

% niezbędny(Atrybut, WszystkieAtrybuty):- usunięcie Atrybutu zmienia rozróżnialność
niezbedny(A, Atrybuty) :-
	rozroznialnosc(Atrybuty, KlasyPelne),
	subtract(Atrybuty, [A], AtrybutyBez),
	rozroznialnosc(AtrybutyBez, KlasyBez),
	KlasyPelne \= KlasyBez.

% --- Macierz i funkcja rozroznialnosci ---
macierz_rozroznialnosci(Atrybuty, Macierz) :-
	identyfikatory_obiektow(Ids),
	findall(para(Id1, Id2, Roznice),
		(wybierz_pary(Ids, Id1, Id2),
		 decyzja_obiektu(Id1, Decyzja1),
		 decyzja_obiektu(Id2, Decyzja2),
		 Decyzja1 \= Decyzja2,
		 atrybuty_rozrozniajace(Id1, Id2, Atrybuty, Roznice),
		 Roznice \= []),
		Macierz).

wybierz_pary(Ids, Id1, Id2) :-
	append(_, [Id1|Reszta], Ids),
	member(Id2, Reszta).

atrybuty_rozrozniajace(Id1, Id2, Atrybuty, Roznice) :-
	findall(Atrybut,
		(member(Atrybut, Atrybuty),
		 wartosc_atrybutu(Id1, Atrybut, W1),
		 wartosc_atrybutu(Id2, Atrybut, W2),
		 W1 \= W2),
		Roznice).

funkcja_rozroznialnosci(Atrybuty, Funkcja) :-
	macierz_rozroznialnosci(Atrybuty, Macierz),
	findall(Roznice, member(para(_, _, Roznice), Macierz), Funkcja).

% --- Wyznaczanie reduktow metoda z definicji ---
wszystkie_redukty(Atrybuty, Redukty) :-
	jadro(Atrybuty, Jadro),
	sort(Jadro, PosortowaneJadro),
	znajdz_kandydatow(Atrybuty, PosortowaneJadro, Kandydaci),
	findall(Redukt,
		(member(Redukt, Kandydaci), jest_reduktem(Atrybuty, Redukt)),
		SuroweRedukty),
	sort_klasy(SuroweRedukty, Redukty).

redukt(Atrybuty, Redukt) :-
	wszystkie_redukty(Atrybuty, [Redukt|_]).

rdzen(Atrybuty, Rdzen) :-
	wszystkie_redukty(Atrybuty, [Pierwszy|Reszta]),
	foldl(przeciecie_list, Reszta, Pierwszy, Rdzen).

rdzen(Atrybuty, Rdzen) :-
	jadro(Atrybuty, Rdzen),
	Rdzen \= [].

znajdz_kandydatow(Atrybuty, Jadro, Kandydaci) :-
	subtract(Atrybuty, Jadro, Pozostale),
	findall(Kandydat,
		(podzbior(Pozostale, Dodatek),
		 append(Jadro, Dodatek, Kandydat),
		 sort(Kandydat, Posortowany),
		 Posortowany \= []),
		SurowiKandydaci),
	sort_klasy(SurowiKandydaci, Kandydaci).

podzbior([], []).
podzbior([Glowa|Ogon], [Glowa|Reszta]) :-
	podzbior(Ogon, Reszta).
podzbior([_|Ogon], Reszta) :-
	podzbior(Ogon, Reszta).

jest_reduktem(PelnyZbior, Kandydat) :-
	rozroznialnosc(PelnyZbior, PelneKlasy),
	rozroznialnosc(Kandydat, KlasyKandydata),
	PelneKlasy = KlasyKandydata,
	niezalezny_zbior(Kandydat).

niezalezny_zbior([_]).
niezalezny_zbior(Atrybuty) :-
	forall(
		member(Atrybut, Atrybuty),
		(subtract(Atrybuty, [Atrybut], BezAtrybutu),
		 rozroznialnosc(Atrybuty, KlasyPelne),
		 rozroznialnosc(BezAtrybutu, KlasyBez),
		 KlasyPelne \= KlasyBez)
	).

przeciecie_list(Lista, Akumulator, Wynik) :-
	intersection(Akumulator, Lista, Wynik).

% --- Przykład użycia ---
% ?- atrybuty_warunkowe(A), jadro(A, Jadro).
% ?- atrybuty_warunkowe(A), wszystkie_redukty(A, Redukty).
% ?- atrybuty_warunkowe(A), macierz_rozroznialnosci(A, Macierz).
% ?- wyjasnij_rekomendacje(informatyka, Atrybuty, Reguly).
