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

rozmyta_rekomendacja(matematyka, Stopien) :-
	stopien_analityczny(StopienAnalityczny),
	stopien_zainteresowania(matematyka, StopienZainteresowania),
	stopien_gotowosci_nauki(StopienNauki),
	Stopien is (StopienAnalityczny + StopienZainteresowania + StopienNauki) / 3,
	Stopien >= 0.6.

rozmyta_rekomendacja(ekonomia, Stopien) :-
	stopien_zainteresowania(ekonomia, StopienZainteresowania),
	stopien_motywacji_finansowej(StopienMotywacji),
	stopien_komunikatywnosci(StopienKomunikatywnosci),
	Stopien is (StopienZainteresowania + StopienMotywacji + StopienKomunikatywnosci) / 3,
	Stopien >= 0.6.

rozmyta_rekomendacja(prawo, Stopien) :-
	stopien_gotowosci_nauki(StopienNauki),
	stopien_komunikatywnosci(StopienKomunikatywnosci),
	stopien_stresu(StopienStresu),
	Stopien is (StopienNauki + StopienKomunikatywnosci + StopienStresu) / 3,
	Stopien >= 0.6.

rozmyta_rekomendacja(medycyna, Stopien) :-
	stopien_zainteresowania(biologia, StopienZainteresowania),
	stopien_gotowosci_nauki(StopienNauki),
	stopien_stresu(StopienStresu),
	stopien_praktycznosci(StopienPraktyczny),
	Stopien is (StopienZainteresowania + StopienNauki + StopienStresu + StopienPraktyczny) / 4,
	Stopien >= 0.6.

rozmyta_rekomendacja(biotechnologia, Stopien) :-
	stopien_zainteresowania(biologia, StopienZainteresowania),
	stopien_praktycznosci(StopienPraktyczny),
	Stopien is (StopienZainteresowania + StopienPraktyczny) / 2,
	Stopien >= 0.6.

rozmyta_rekomendacja(filologia_obce, Stopien) :-
	stopien_zainteresowania(jezyki, StopienZainteresowania),
	stopien_komunikatywnosci(StopienKomunikatywnosci),
	Stopien is (StopienZainteresowania + StopienKomunikatywnosci) / 2,
	Stopien >= 0.6.

rozmyta_rekomendacja(turystyka_i_rekreacja, Stopien) :-
	stopien_praktycznosci(StopienPraktyczny),
	stopien_komunikatywnosci(StopienKomunikatywnosci),
	Stopien is (StopienPraktyczny + StopienKomunikatywnosci) / 2,
	Stopien >= 0.6.

rozmyta_rekomendacja(kognitywistyka, Stopien) :-
	stopien_analityczny(StopienAnalityczny),
	stopien_kreatywny(StopienKreatywny),
	stopien_spoleczny(StopienSpoleczny),
	Stopien is (StopienAnalityczny + StopienKreatywny + StopienSpoleczny) / 3,
	Stopien >= 0.5.

rozmyta_rekomendacja(automatyka_i_robotyka, Stopien) :-
	stopien_analityczny(StopienAnalityczny),
	stopien_praktycznosci(StopienPraktyczny),
	stopien_zainteresowania(informatyka, StopienZainteresowania),
	Stopien is (StopienAnalityczny + StopienPraktyczny + StopienZainteresowania) / 3,
	Stopien >= 0.6.

rozmyta_rekomendacja(informatyka_stosowana, Stopien) :-
	stopien_analityczny(StopienAnalityczny),
	stopien_praktycznosci(StopienPraktyczny),
	stopien_zainteresowania(informatyka, StopienZainteresowania),
	Stopien is (StopienAnalityczny * 0.3 + StopienPraktyczny * 0.4 + StopienZainteresowania * 0.3),
	Stopien >= 0.6.

rozmyta_rekomendacja(pedagogika, Stopien) :-
	stopien_spoleczny(StopienSpoleczny),
	stopien_komunikatywnosci(StopienKomunikatywnosci),
	stopien_zainteresowania(psychologia, StopienZainteresowania),
	Stopien is (StopienSpoleczny + StopienKomunikatywnosci + StopienZainteresowania) / 3,
	Stopien >= 0.6.

% ====== Funkcje przynaleznosci ======

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

stopien_komunikatywnosci(Stopien) :-
	cecha_rozmyta(komunikatywnosc, Stopien), !.
stopien_komunikatywnosci(1.0) :-
	odpowiedz_uzytkownika(uzytkownik, komunikatywnosc, wysoka), !.
stopien_komunikatywnosci(0.5) :-
	odpowiedz_uzytkownika(uzytkownik, komunikatywnosc, srednia), !.
stopien_komunikatywnosci(0.0).

stopien_gotowosci_nauki(Stopien) :-
	cecha_rozmyta(gotowosc_do_dlugiej_nauki, Stopien), !.
stopien_gotowosci_nauki(1.0) :-
	odpowiedz_uzytkownika(uzytkownik, gotowosc_do_dlugiej_nauki, wysoka), !.
stopien_gotowosci_nauki(0.5) :-
	odpowiedz_uzytkownika(uzytkownik, gotowosc_do_dlugiej_nauki, srednia), !.
stopien_gotowosci_nauki(0.0).

stopien_motywacji_finansowej(1.0) :-
	odpowiedz_uzytkownika(uzytkownik, motywacja_finansowa, wysoka), !.
stopien_motywacji_finansowej(0.5) :-
	odpowiedz_uzytkownika(uzytkownik, motywacja_finansowa, srednia), !.
stopien_motywacji_finansowej(0.0).

stopien_zainteresowania(Dziedzina, 1.0) :-
	odpowiedz_uzytkownika(uzytkownik, zainteresowania_przedmiotowe, Dziedzina), !.
stopien_zainteresowania(_, 0.0).

cecha_rozmyta(Atrybut, Stopien) :-
	odpowiedz_uzytkownika(uzytkownik, Atrybut, Wartosc),
	number(Wartosc),
	Wartosc >= 0,
	Wartosc =< 10,
	Stopien is Wartosc / 10.
