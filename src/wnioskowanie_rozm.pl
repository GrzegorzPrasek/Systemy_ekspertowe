% Moduł wnioskowania rozmytego

% Wnioskowanie rozmyte jest oparte na prostych stopniach przynaleznosci.
% Zakladamy, ze odpowiedzi liczbowe sa podawane w skali 0..10.

rozmyta_rekomendacja(informatyka, Stopien) :-
	stopien_analityczny(StopienAnalityczny),
	stopien_zainteresowania(informatyka, StopienZainteresowania),
	stopien_praktycznosci(StopienPraktyczny),
	Stopien is (StopienAnalityczny + StopienZainteresowania + StopienPraktyczny) / 3,
	Stopien >= 0.6.

rozmyta_rekomendacja(psychologia, Stopien) :-
	stopien_spoleczny(StopienSpoleczny),
	stopien_zainteresowania(psychologia, StopienZainteresowania),
	stopien_stresu(StopienStresu),
	Stopien is (StopienSpoleczny + StopienZainteresowania + StopienStresu) / 3,
	Stopien >= 0.6.

rozmyta_rekomendacja(grafika, Stopien) :-
	stopien_kreatywny(StopienKreatywny),
	stopien_zainteresowania(sztuka, StopienZainteresowania),
	Stopien is (StopienKreatywny + StopienZainteresowania) / 2,
	Stopien >= 0.6.

stopien_analityczny(Stopien) :-
	cecha_rozmyta(poziom_analityczny, Stopien), !.
stopien_analityczny(1.0) :-
	odpowiedz_uzytkownika(uzytkownik, poziom_analityczny, wysoki), !.
stopien_analityczny(0.5) :-
	odpowiedz_uzytkownika(uzytkownik, poziom_analityczny, sredni), !.
stopien_analityczny(0.0).

stopien_spoleczny(Stopien) :-
	cecha_rozmyta(chec_pracy_z_ludzmi, Stopien), !.
stopien_spoleczny(1.0) :-
	odpowiedz_uzytkownika(uzytkownik, chec_pracy_z_ludzmi, wysoka), !.
stopien_spoleczny(0.5) :-
	odpowiedz_uzytkownika(uzytkownik, chec_pracy_z_ludzmi, umiarkowana), !.
stopien_spoleczny(0.0).

stopien_kreatywny(Stopien) :-
	cecha_rozmyta(kreatywnosc, Stopien), !.
stopien_kreatywny(1.0) :-
	odpowiedz_uzytkownika(uzytkownik, kreatywnosc, wysoka), !.
stopien_kreatywny(0.5) :-
	odpowiedz_uzytkownika(uzytkownik, kreatywnosc, srednia), !.
stopien_kreatywny(0.0).

stopien_praktycznosci(Stopien) :-
	cecha_rozmyta(preferencja_praktycznosci, Stopien), !.
stopien_praktycznosci(1.0) :-
	odpowiedz_uzytkownika(uzytkownik, preferencja_praktycznosci, wysoka), !.
stopien_praktycznosci(0.5) :-
	odpowiedz_uzytkownika(uzytkownik, preferencja_praktycznosci, srednia), !.
stopien_praktycznosci(0.0).

stopien_stresu(Stopien) :-
	cecha_rozmyta(tolerancja_stresu, Stopien), !.
stopien_stresu(1.0) :-
	odpowiedz_uzytkownika(uzytkownik, tolerancja_stresu, wysoka), !.
stopien_stresu(0.5) :-
	odpowiedz_uzytkownika(uzytkownik, tolerancja_stresu, srednia), !.
stopien_stresu(0.0).

stopien_zainteresowania(Dziedzina, 1.0) :-
	odpowiedz_uzytkownika(uzytkownik, zainteresowania_przedmiotowe, Dziedzina), !.
stopien_zainteresowania(_, 0.0).

cecha_rozmyta(Atrybut, Stopien) :-
	odpowiedz_uzytkownika(uzytkownik, Atrybut, Wartosc),
	number(Wartosc),
	Wartosc >= 0,
	Wartosc =< 10,
	Stopien is Wartosc / 10.
