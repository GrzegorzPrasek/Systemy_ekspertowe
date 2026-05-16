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

cechy_przyblizone_informatyka(Punkty) :-
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, lubi_matematyke, tak), P1),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, zainteresowania_przedmiotowe, informatyka), P2),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, ulubiony_styl_pracy, indywidualny), P3),
	warunek_punktowany(zgodnosc_informatyczna(srednia), P4),
	Punkty is P1 + P2 + P3 + P4.

cechy_przyblizone_psychologia(Punkty) :-
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, chec_pracy_z_ludzmi, wysoka), P1),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, zainteresowania_przedmiotowe, psychologia), P2),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, komunikatywnosc, wysoka), P3),
	warunek_punktowany(zgodnosc_spoleczna(srednia), P4),
	Punkty is P1 + P2 + P3 + P4.

cechy_przyblizone_grafika(Punkty) :-
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, kreatywnosc, wysoka), P1),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, zainteresowania_przedmiotowe, sztuka), P2),
	warunek_punktowany(odpowiedz_uzytkownika(uzytkownik, preferowany_styl_uczenia_sie, projektowy), P3),
	warunek_punktowany(zgodnosc_kreatywna(srednia), P4),
	Punkty is P1 + P2 + P3 + P4.

warunek_punktowany(Warunek, 1) :-
	call(Warunek), !.
warunek_punktowany(_, 0).
