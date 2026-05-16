% Testy scenariuszy użytkownika

reset_test_state :-
	wyczysc_odpowiedzi.

zaladuj_scenariusz_techniczny :-
	reset_test_state,
	zapisz_fakt(uzytkownik, zainteresowania_przedmiotowe, informatyka),
	zapisz_fakt(uzytkownik, lubi_matematyke, tak),
	zapisz_fakt(uzytkownik, ulubiony_styl_pracy, indywidualny),
	zapisz_fakt(uzytkownik, preferowany_typ_zadan, analityczne),
	zapisz_fakt(uzytkownik, rozwiazywanie_problemow, tak),
	zapisz_fakt(uzytkownik, poziom_analityczny, wysoki),
	zapisz_fakt(uzytkownik, gotowosc_do_dlugiej_nauki, wysoka),
	zapisz_fakt(uzytkownik, preferencja_praktycznosci, wysoka).

zaladuj_scenariusz_spoleczny :-
	reset_test_state,
	zapisz_fakt(uzytkownik, zainteresowania_przedmiotowe, psychologia),
	zapisz_fakt(uzytkownik, ulubiony_styl_pracy, zespolowy),
	zapisz_fakt(uzytkownik, chec_pracy_z_ludzmi, wysoka),
	zapisz_fakt(uzytkownik, komunikatywnosc, wysoka),
	zapisz_fakt(uzytkownik, tolerancja_stresu, wysoka).

zaladuj_scenariusz_kreatywny :-
	reset_test_state,
	zapisz_fakt(uzytkownik, zainteresowania_przedmiotowe, sztuka),
	zapisz_fakt(uzytkownik, kreatywnosc, wysoka),
	zapisz_fakt(uzytkownik, preferowany_styl_uczenia_sie, projektowy),
	zapisz_fakt(uzytkownik, preferowany_typ_zadan, tworcze).

zaladuj_scenariusz_bez_dopasowania :-
	reset_test_state,
	zapisz_fakt(uzytkownik, zainteresowania_przedmiotowe, biologia),
	zapisz_fakt(uzytkownik, lubi_matematyke, nie),
	zapisz_fakt(uzytkownik, ulubiony_styl_pracy, mieszany),
	zapisz_fakt(uzytkownik, komunikatywnosc, niska),
	zapisz_fakt(uzytkownik, kreatywnosc, niska),
	zapisz_fakt(uzytkownik, niechec_do_matematyki, wysoka).

% --- Testy poprawnosci regul i scenariuszy ---
test_reguly_klasyczne :-
	zaladuj_scenariusz_techniczny,
	profil_analityczny(wysoki),
	reset_test_state.

test_rekomendacja_informatyka :-
	zaladuj_scenariusz_techniczny,
	rekomendacja(informatyka),
	reset_test_state.

test_rekomendacja_psychologia :-
	zaladuj_scenariusz_spoleczny,
	rekomendacja(psychologia),
	reset_test_state.

test_rekomendacja_grafika :-
	zaladuj_scenariusz_kreatywny,
	rekomendacja(grafika),
	reset_test_state.

test_spojnosc_brak_informatyki :-
	zaladuj_scenariusz_bez_dopasowania,
	\+ rekomendacja(informatyka),
	reset_test_state.

test_wnioskowanie_przyblizone :-
	reset_test_state,
	zapisz_fakt(uzytkownik, zainteresowania_przedmiotowe, informatyka),
	zapisz_fakt(uzytkownik, lubi_matematyke, tak),
	przyblizona_rekomendacja(informatyka, Punkty),
	Punkty >= 2,
	reset_test_state.

test_wnioskowanie_rozmyte :-
	reset_test_state,
	zapisz_fakt(uzytkownik, poziom_analityczny, 8),
	zapisz_fakt(uzytkownik, zainteresowania_przedmiotowe, informatyka),
	zapisz_fakt(uzytkownik, preferencja_praktycznosci, 7),
	rozmyta_rekomendacja(informatyka, Stopien),
	Stopien >= 0.6,
	reset_test_state.

test_alternatywy_rekomendacji :-
	zaladuj_scenariusz_techniczny,
	alternatywy_rekomendacji(Alternatywy),
	Alternatywy \= [],
	reset_test_state.

test_rdzen_i_redukty :-
	atrybuty_warunkowe(Atrybuty),
	jadro(Atrybuty, Jadro),
	Jadro \= [],
	wszystkie_redukty(Atrybuty, Redukty),
	Redukty \= [].

test_wyjasnienie_rekomendacji :-
	wyjasnij_rekomendacje(informatyka, Atrybuty, Reguly),
	member(zainteresowania_przedmiotowe, Atrybuty),
	member(profil_analityczny_wysoki, Reguly).

test_pelny_przeplyw_techniczny :-
	zaladuj_scenariusz_techniczny,
	uruchom_wnioskowanie(informatyka),
	reset_test_state.

test_pelny_przeplyw_spoleczny :-
	zaladuj_scenariusz_spoleczny,
	uruchom_wnioskowanie(psychologia),
	reset_test_state.

test_pelny_przeplyw_kreatywny :-
	zaladuj_scenariusz_kreatywny,
	uruchom_wnioskowanie(grafika),
	reset_test_state.

run_all_tests :-
	run_named_test('reguly klasyczne', test_reguly_klasyczne),
	run_named_test('rekomendacja informatyka', test_rekomendacja_informatyka),
	run_named_test('rekomendacja psychologia', test_rekomendacja_psychologia),
	run_named_test('rekomendacja grafika', test_rekomendacja_grafika),
	run_named_test('spojnosc bez informatyki', test_spojnosc_brak_informatyki),
	run_named_test('wnioskowanie przyblizone', test_wnioskowanie_przyblizone),
	run_named_test('wnioskowanie rozmyte', test_wnioskowanie_rozmyte),
	run_named_test('alternatywy rekomendacji', test_alternatywy_rekomendacji),
	run_named_test('rdzen i redukty', test_rdzen_i_redukty),
	run_named_test('wyjasnienie rekomendacji', test_wyjasnienie_rekomendacji),
	run_named_test('pelny przeplyw techniczny', test_pelny_przeplyw_techniczny),
	run_named_test('pelny przeplyw spoleczny', test_pelny_przeplyw_spoleczny),
	run_named_test('pelny przeplyw kreatywny', test_pelny_przeplyw_kreatywny),
	write('Zakonczono wszystkie testy.'), nl.

run_named_test(Nazwa, Cel) :-
	(   call(Cel)
	->  write('[OK] '), write(Nazwa), nl
	;   write('[BLAD] '), write(Nazwa), nl
	).
