% Moduł wnioskowania przybliżonego

% Czastkowe dopasowanie do kierunku jest liczone punktowo.
% Rekomendacja alternatywna jest dopuszczona, gdy uzytkownik spelnia
% wiekszosc kluczowych przeslanek, ale nie wszystkie.

przyblizona_rekomendacja(informatyka, Punkty) :-
	cechy_przyblizone_informatyka(Punkty),
	Punkty >= 2.

przyblizona_rekomendacja(psychologia, Punkty) :-
	cechy_przyblizone_psychologia(Punkty),
	Punkty >= 2.

przyblizona_rekomendacja(grafika, Punkty) :-
	cechy_przyblizone_grafika(Punkty),
	Punkty >= 2.

przyblizona_rekomendacja(matematyka, Punkty) :-
	cechy_przyblizone_matematyka(Punkty),
	Punkty >= 2.

przyblizona_rekomendacja(ekonomia, Punkty) :-
	cechy_przyblizone_ekonomia(Punkty),
	Punkty >= 2.

przyblizona_rekomendacja(prawo, Punkty) :-
	cechy_przyblizone_prawo(Punkty),
	Punkty >= 2.

przyblizona_rekomendacja(medycyna, Punkty) :-
	cechy_przyblizone_medycyna(Punkty),
	Punkty >= 3.

przyblizona_rekomendacja(biotechnologia, Punkty) :-
	cechy_przyblizone_biotechnologia(Punkty),
	Punkty >= 2.

przyblizona_rekomendacja(filologia_obce, Punkty) :-
	cechy_przyblizone_filologia(Punkty),
	Punkty >= 2.

przyblizona_rekomendacja(turystyka_i_rekreacja, Punkty) :-
	cechy_przyblizone_turystyka(Punkty),
	Punkty >= 2.

przyblizona_rekomendacja(kognitywistyka, Punkty) :-
	cechy_przyblizone_kognitywistyka(Punkty),
	Punkty >= 2.

przyblizona_rekomendacja(automatyka_i_robotyka, Punkty) :-
	cechy_przyblizone_automatyka(Punkty),
	Punkty >= 2.

przyblizona_rekomendacja(informatyka_stosowana, Punkty) :-
	cechy_przyblizone_informatyka_stosowana(Punkty),
	Punkty >= 2.

przyblizona_rekomendacja(pedagogika, Punkty) :-
	cechy_przyblizone_pedagogika(Punkty),
	Punkty >= 2.

cechy_przyblizone_informatyka(Punkty) :-
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, lubi_matematyke, tak), P1),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, zainteresowania_przedmiotowe, informatyka), P2),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, ulubiony_styl_pracy, indywidualny), P3),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, poziom_analityczny, wysoki), P4),
	Punkty is P1 + P2 + P3 + P4.

cechy_przyblizone_psychologia(Punkty) :-
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, chec_pracy_z_ludzmi, wysoka), P1),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, zainteresowania_przedmiotowe, psychologia), P2),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, komunikatywnosc, wysoka), P3),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, tolerancja_stresu, wysoka), P4),
	Punkty is P1 + P2 + P3 + P4.

cechy_przyblizone_grafika(Punkty) :-
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, kreatywnosc, wysoka), P1),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, zainteresowania_przedmiotowe, sztuka), P2),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, preferowany_styl_uczenia_sie, projektowy), P3),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, preferowany_typ_zadan, tworcze), P4),
	Punkty is P1 + P2 + P3 + P4.

cechy_przyblizone_matematyka(Punkty) :-
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, lubi_matematyke, tak), P1),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, zainteresowania_przedmiotowe, matematyka), P2),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, poziom_analityczny, wysoki), P3),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, gotowosc_do_dlugiej_nauki, wysoka), P4),
	Punkty is P1 + P2 + P3 + P4.

cechy_przyblizone_ekonomia(Punkty) :-
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, zainteresowania_przedmiotowe, ekonomia), P1),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, motywacja_finansowa, wysoka), P2),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, komunikatywnosc, wysoka), P3),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, preferowany_typ_zadan, organizacyjne), P4),
	Punkty is P1 + P2 + P3 + P4.

cechy_przyblizone_prawo(Punkty) :-
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, gotowosc_do_dlugiej_nauki, wysoka), P1),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, komunikatywnosc, wysoka), P2),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, tolerancja_stresu, wysoka), P3),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, preferowany_typ_zadan, organizacyjne), P4),
	Punkty is P1 + P2 + P3 + P4.

cechy_przyblizone_medycyna(Punkty) :-
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, zainteresowania_przedmiotowe, biologia), P1),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, gotowosc_do_dlugiej_nauki, wysoka), P2),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, tolerancja_stresu, wysoka), P3),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, preferowany_typ_zadan, praktyczne), P4),
	Punkty is P1 + P2 + P3 + P4.

cechy_przyblizone_biotechnologia(Punkty) :-
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, zainteresowania_przedmiotowe, biologia), P1),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, preferencja_praktycznosci, wysoka), P2),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, preferowany_typ_zadan, badawcze), P3),
	Punkty is P1 + P2 + P3.

cechy_przyblizone_filologia(Punkty) :-
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, zainteresowania_przedmiotowe, jezyki), P1),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, komunikatywnosc, wysoka), P2),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, preferowany_typ_zadan, tworcze), P3),
	Punkty is P1 + P2 + P3.

cechy_przyblizone_turystyka(Punkty) :-
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, preferencja_praktycznosci, wysoka), P1),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, komunikatywnosc, wysoka), P2),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, preferowany_typ_zadan, organizacyjne), P3),
	Punkty is P1 + P2 + P3.

cechy_przyblizone_kognitywistyka(Punkty) :-
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, preferowany_typ_zadan, badawcze), P1),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, poziom_analityczny, wysoki), P2),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, kreatywnosc, srednia), P3),
	Punkty is P1 + P2 + P3.

cechy_przyblizone_automatyka(Punkty) :-
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, zainteresowania_przedmiotowe, informatyka), P1),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, preferencja_praktycznosci, wysoka), P2),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, poziom_analityczny, wysoki), P3),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, lubi_matematyke, tak), P4),
	Punkty is P1 + P2 + P3 + P4.

cechy_przyblizone_informatyka_stosowana(Punkty) :-
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, zainteresowania_przedmiotowe, informatyka), P1),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, preferencja_praktycznosci, wysoka), P2),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, preferowany_typ_zadan, praktyczne), P3),
	Punkty is P1 + P2 + P3.

cechy_przyblizone_pedagogika(Punkty) :-
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, chec_pracy_z_ludzmi, wysoka), P1),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, zainteresowania_przedmiotowe, psychologia), P2),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, ulubiony_styl_pracy, zespolowy), P3),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, preferowany_typ_zadan, praktyczne), P4),
	Punkty is P1 + P2 + P3 + P4.

warunek_punktowany(Warunek, 1) :-
	call(Warunek), !.
warunek_punktowany(_, 0).
