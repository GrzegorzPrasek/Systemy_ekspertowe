% Baza wiedzy: fakty, reguly, atrybuty, grupy kierunkow

:- dynamic odpowiedz/3.
:- discontiguous wniosek_posredni/2.
:- discontiguous profil_analityczny/1.
:- discontiguous profil_spoleczny/1.
:- discontiguous profil_kreatywny/1.
:- discontiguous rekomendacja/1.

% Mapowanie aliasow atrybutow do jednej reprezentacji uzywanej w calym systemie.
alias_atrybutu(zainteresowanie, zainteresowania_przedmiotowe).
alias_atrybutu(preferowany_styl_pracy, ulubiony_styl_pracy).
alias_atrybutu(praca_z_ludzmi, chec_pracy_z_ludzmi).
alias_atrybutu(poziom_logiczny, poziom_analityczny).
alias_atrybutu(poziom_analityczny_liczbowy, poziom_analityczny).
alias_atrybutu(chec_pracy_z_ludzmi_liczbowa, chec_pracy_z_ludzmi).
alias_atrybutu(kreatywnosc_liczbowa, kreatywnosc).

kanoniczny_atrybut(Atrybut, Kanoniczny) :-
	alias_atrybutu(Atrybut, Kanoniczny), !.
kanoniczny_atrybut(Atrybut, Atrybut).

zapisz_fakt(Uzytkownik, Atrybut, Wartosc) :-
	kanoniczny_atrybut(Atrybut, Kanoniczny),
	assertz(odpowiedz(Uzytkownik, Kanoniczny, Wartosc)).

odpowiedz_uzytkownika(Uzytkownik, Atrybut, Wartosc) :-
	kanoniczny_atrybut(Atrybut, Kanoniczny),
	odpowiedz(Uzytkownik, Kanoniczny, Wartosc).

% ====== Atrybuty wejsciowe uzytkownika ======
atrybut_wejsciowy(zainteresowania_przedmiotowe, wielowartosciowy,
	[matematyka, informatyka, biologia, jezyki, ekonomia, sztuka, psychologia]).
atrybut_wejsciowy(ulubiony_styl_pracy, symboliczny,
	[indywidualny, zespolowy, mieszany]).
atrybut_wejsciowy(preferowany_typ_zadan, wielowartosciowy,
	[analityczne, tworcze, praktyczne, organizacyjne, badawcze]).
atrybut_wejsciowy(poziom_analityczny, porzadkowy_rozmyty,
	[niski, sredni, wysoki]).
atrybut_wejsciowy(komunikatywnosc, porzadkowy_rozmyty,
	[niska, srednia, wysoka]).
atrybut_wejsciowy(chec_pracy_z_ludzmi, porzadkowy_rozmyty,
	[niska, umiarkowana, wysoka]).
atrybut_wejsciowy(kreatywnosc, porzadkowy_rozmyty,
	[niska, srednia, wysoka]).
atrybut_wejsciowy(tolerancja_stresu, porzadkowy_rozmyty,
	[niska, srednia, wysoka]).
atrybut_wejsciowy(gotowosc_do_dlugiej_nauki, porzadkowy,
	[niska, srednia, wysoka]).
atrybut_wejsciowy(preferencja_praktycznosci, porzadkowy,
	[niska, srednia, wysoka]).
atrybut_wejsciowy(preferowany_styl_uczenia_sie, symboliczny,
	[teoretyczny, praktyczny, projektowy, mieszany]).
atrybut_wejsciowy(motywacja_finansowa, porzadkowy,
	[niska, srednia, wysoka]).
atrybut_wejsciowy(niechec_do_matematyki, logiczny_lub_porzadkowy,
	[tak, nie, niska, srednia, wysoka]).

% ====== Atrybuty wynikowe ======
atrybut_wynikowy(profil_analityczny, wynikowy_rozmyty,
	[niski, sredni, wysoki]).
atrybut_wynikowy(profil_spoleczny, wynikowy_rozmyty,
	[niski, sredni, wysoki]).
atrybut_wynikowy(profil_kreatywny, wynikowy_rozmyty,
	[niski, sredni, wysoki]).
atrybut_wynikowy(zgodnosc_techniczna, wynikowy_rozmyty,
	[niska, srednia, wysoka]).
atrybut_wynikowy(zgodnosc_scisla, wynikowy_rozmyty,
	[niska, srednia, wysoka]).
atrybut_wynikowy(zgodnosc_informatyczna, wynikowy_rozmyty,
	[niska, srednia, wysoka]).
atrybut_wynikowy(zgodnosc_ekonomiczna, wynikowy_rozmyty,
	[niska, srednia, wysoka]).
atrybut_wynikowy(zgodnosc_spoleczna, wynikowy_rozmyty,
	[niska, srednia, wysoka]).
atrybut_wynikowy(zgodnosc_humanistyczna, wynikowy_rozmyty,
	[niska, srednia, wysoka]).
atrybut_wynikowy(zgodnosc_kreatywna, wynikowy_rozmyty,
	[niska, srednia, wysoka]).

% ====== Poziomy wnioskowania ======
poziom_wnioskowania(wnioski_pierwotne).
poziom_wnioskowania(wnioski_posrednie).
poziom_wnioskowania(wnioski_koncowe).

% ====== Grupy kierunkow ======
grupa_kierunkow(kierunki_techniczne_inzynierskie,
	[informatyka, automatyka_i_robotyka, mechatronika, elektronika,
	 elektrotechnika, budownictwo, mechanika_i_budowa_maszyn,
	 inzynieria_materialowa, inzynieria_produkcji]).
grupa_kierunkow(kierunki_scisle_formalne,
	[matematyka, fizyka, astronomia, informatyka_teoretyczna,
	 analiza_danych, statystyka]).
grupa_kierunkow(kierunki_informatyczno_analityczne,
	[informatyka_stosowana, sztuczna_inteligencja, cyberbezpieczenstwo,
	 analityka_biznesowa, systemy_informacyjne, bioinformatyka,
	 inzynieria_oprogramowania]).
grupa_kierunkow(kierunki_ekonomiczne_biznesowe,
	[ekonomia, finanse_i_rachunkowosc, zarzadzanie, logistyka,
	 analityka_gospodarcza, marketing, zarzadzanie_projektami]).
grupa_kierunkow(kierunki_spoleczne_interpersonalne,
	[psychologia, socjologia, pedagogika, zarzadzanie_zasobami_ludzkimi,
	 praca_socjalna, bezpieczenstwo_wewnetrzne, nauki_o_rodzinie]).
grupa_kierunkow(kierunki_humanistyczne_jezykowe,
	[filologia_polska, filologie_obce, historia, filozofia,
	 kulturoznawstwo, lingwistyka_stosowana, edytorstwo,
	 dziennikarstwo_humanistyczne]).
grupa_kierunkow(kierunki_prawno_administracyjne,
	[prawo, administracja, kryminologia, bezpieczenstwo_narodowe,
	 polityka_publiczna]).
grupa_kierunkow(kierunki_medyczne_zdrowotne_przyrodnicze,
	[medycyna, pielegniarstwo, fizjoterapia, dietetyka, farmacja,
	 biologia, biotechnologia, ochrona_srodowiska, weterynaria,
	 zdrowie_publiczne]).
grupa_kierunkow(kierunki_kreatywne_artystyczne_projektowe,
	[grafika, wzornictwo, architektura_wnetrz, multimedia,
	 rezyseria, produkcja_medialna, projektowanie_gier, fotografia,
	 komunikacja_wizualna]).
grupa_kierunkow(kierunki_przyrodniczo_technologiczne_laboratoryjne,
	[chemia, technologia_chemiczna, towaroznawstwo,
	 inzynieria_srodowiska, biochemia, nanotechnologia]).
grupa_kierunkow(kierunki_uslugowe_operacyjne,
	[turystyka_i_rekreacja, hotelarstwo, transport,
	 zarzadzanie_jakoscia, gospodarka_przestrzenna,
	 logistyka_operacyjna]).
grupa_kierunkow(kierunki_interdyscyplinarne,
	[kognitywistyka, zarzadzanie_i_inzynieria_produkcji,
	 informatyka_i_ekonometria, projektowanie_uslug,
	 cognitive_science, ekonomia_cyfrowa]).

% ====== Przykladowe fakty z instrukcji ======
przykladowa_odpowiedz(uzytkownik, lubi_matematyke, tak).
przykladowa_odpowiedz(uzytkownik, chec_pracy_z_ludzmi, wysoka).
przykladowa_odpowiedz(uzytkownik, ulubiony_styl_pracy, zespolowy).
przykladowa_odpowiedz(uzytkownik, zainteresowania_przedmiotowe, informatyka).

zaladuj_przykladowe_fakty :-
	wyczysc_odpowiedzi,
	forall(
		przykladowa_odpowiedz(Uzytkownik, Atrybut, Wartosc),
		zapisz_fakt(Uzytkownik, Atrybut, Wartosc)
	).

wyczysc_odpowiedzi :-
	retractall(odpowiedz(_, _, _)).

% Fakty pierwotne sa bezposrednio reprezentowane przez odpowiedz/3.
wniosek_pierwotny(Atrybut, Wartosc) :-
	odpowiedz_uzytkownika(uzytkownik, Atrybut, Wartosc).

% ====== Przykładowe reguły ======
profil_analityczny(wysoki) :-
	odpowiedz_uzytkownika(uzytkownik, lubi_matematyke, tak),
	odpowiedz_uzytkownika(uzytkownik, rozwiazywanie_problemow, tak),
	odpowiedz_uzytkownika(uzytkownik, poziom_analityczny, wysoki).

profil_analityczny(sredni) :-
	odpowiedz_uzytkownika(uzytkownik, lubi_matematyke, tak),
	odpowiedz_uzytkownika(uzytkownik, poziom_analityczny, sredni).

profil_spoleczny(wysoki) :-
	odpowiedz_uzytkownika(uzytkownik, chec_pracy_z_ludzmi, wysoka),
	odpowiedz_uzytkownika(uzytkownik, ulubiony_styl_pracy, zespolowy),
	odpowiedz_uzytkownika(uzytkownik, komunikatywnosc, wysoka).

profil_spoleczny(sredni) :-
	odpowiedz_uzytkownika(uzytkownik, chec_pracy_z_ludzmi, umiarkowana),
	odpowiedz_uzytkownika(uzytkownik, komunikatywnosc, srednia).

profil_kreatywny(wysoki) :-
	odpowiedz_uzytkownika(uzytkownik, kreatywnosc, wysoka),
	odpowiedz_uzytkownika(uzytkownik, preferowany_typ_zadan, tworcze).

profil_kreatywny(sredni) :-
	odpowiedz_uzytkownika(uzytkownik, kreatywnosc, srednia).

wniosek_posredni(profil_analityczny, wysoki) :-
    profil_analityczny(wysoki).

wniosek_posredni(profil_spoleczny, wysoki) :-
    profil_spoleczny(wysoki).

wniosek_posredni(profil_kreatywny, wysoki) :-
    profil_kreatywny(wysoki).

zgodnosc_techniczna(wysoka) :-
	profil_analityczny(wysoki),
	odpowiedz_uzytkownika(uzytkownik, preferencja_praktycznosci, wysoka).

zgodnosc_techniczna(srednia) :-
	profil_analityczny(sredni).

zgodnosc_scisla(wysoka) :-
	profil_analityczny(wysoki),
	odpowiedz_uzytkownika(uzytkownik, gotowosc_do_dlugiej_nauki, wysoka).

zgodnosc_informatyczna(wysoka) :-
	profil_analityczny(wysoki),
	odpowiedz_uzytkownika(uzytkownik, zainteresowania_przedmiotowe, informatyka).

zgodnosc_informatyczna(srednia) :-
	profil_analityczny(sredni),
	odpowiedz_uzytkownika(uzytkownik, zainteresowania_przedmiotowe, informatyka).

zgodnosc_ekonomiczna(wysoka) :-
	odpowiedz_uzytkownika(uzytkownik, zainteresowania_przedmiotowe, ekonomia),
	odpowiedz_uzytkownika(uzytkownik, motywacja_finansowa, wysoka).

zgodnosc_spoleczna(wysoka) :-
	profil_spoleczny(wysoki),
	odpowiedz_uzytkownika(uzytkownik, zainteresowania_przedmiotowe, psychologia).

zgodnosc_spoleczna(srednia) :-
	profil_spoleczny(sredni).

zgodnosc_humanistyczna(wysoka) :-
	odpowiedz_uzytkownika(uzytkownik, zainteresowania_przedmiotowe, jezyki).

zgodnosc_kreatywna(wysoka) :-
	profil_kreatywny(wysoki),
	odpowiedz_uzytkownika(uzytkownik, zainteresowania_przedmiotowe, sztuka).

zgodnosc_kreatywna(srednia) :-
	profil_kreatywny(sredni),
	odpowiedz_uzytkownika(uzytkownik, zainteresowania_przedmiotowe, sztuka).

wniosek_posredni(zgodnosc_techniczna, Poziom) :-
	member(Poziom, [wysoka, srednia]),
	call(zgodnosc_techniczna(Poziom)).

wniosek_posredni(zgodnosc_scisla, wysoka) :-
	zgodnosc_scisla(wysoka).

wniosek_posredni(zgodnosc_informatyczna, Poziom) :-
	member(Poziom, [wysoka, srednia]),
	call(zgodnosc_informatyczna(Poziom)).

wniosek_posredni(zgodnosc_spoleczna, Poziom) :-
	member(Poziom, [wysoka, srednia]),
	call(zgodnosc_spoleczna(Poziom)).

wniosek_posredni(zgodnosc_kreatywna, Poziom) :-
	member(Poziom, [wysoka, srednia]),
	call(zgodnosc_kreatywna(Poziom)).

rekomendacja(informatyka) :-
	zgodnosc_informatyczna(wysoka),
	odpowiedz_uzytkownika(uzytkownik, ulubiony_styl_pracy, indywidualny).

rekomendacja(psychologia) :-
    zgodnosc_spoleczna(wysoka),
    odpowiedz_uzytkownika(uzytkownik, chec_pracy_z_ludzmi, wysoka).

rekomendacja(grafika) :-
    zgodnosc_kreatywna(wysoka),
    odpowiedz_uzytkownika(uzytkownik, preferowany_styl_uczenia_sie, projektowy).

% ====== Reguly wykluczajace / ograniczajace ======
wyklucz(kierunki_techniczne_inzynierskie) :-
	odpowiedz_uzytkownika(uzytkownik, niechec_do_matematyki, tak).
wyklucz(kierunki_techniczne_inzynierskie) :-
	odpowiedz_uzytkownika(uzytkownik, niechec_do_matematyki, wysoka).
wyklucz(kierunki_scisle_formalne) :-
	odpowiedz_uzytkownika(uzytkownik, niechec_do_matematyki, tak).
wyklucz(kierunki_scisle_formalne) :-
	odpowiedz_uzytkownika(uzytkownik, niechec_do_matematyki, wysoka).
wyklucz(kierunki_informatyczno_analityczne) :-
	odpowiedz_uzytkownika(uzytkownik, niechec_do_matematyki, wysoka),
	odpowiedz_uzytkownika(uzytkownik, poziom_analityczny, niski).
wyklucz(kierunki_medyczne_zdrowotne_przyrodnicze) :-
	odpowiedz_uzytkownika(uzytkownik, gotowosc_do_dlugiej_nauki, niska).
wyklucz(kierunki_prawno_administracyjne) :-
	odpowiedz_uzytkownika(uzytkownik, gotowosc_do_dlugiej_nauki, niska).
wyklucz(kierunki_spoleczne_interpersonalne) :-
	odpowiedz_uzytkownika(uzytkownik, chec_pracy_z_ludzmi, niska),
	odpowiedz_uzytkownika(uzytkownik, komunikatywnosc, niska).
wyklucz(kierunki_kreatywne_artystyczne_projektowe) :-
	odpowiedz_uzytkownika(uzytkownik, kreatywnosc, niska).
wyklucz(kierunki_humanistyczne_jezykowe) :-
	odpowiedz_uzytkownika(uzytkownik, zainteresowania_przedmiotowe, matematyka),
	odpowiedz_uzytkownika(uzytkownik, niechec_do_matematyki, nie).
wyklucz(kierunki_ekonomiczne_biznesowe) :-
	odpowiedz_uzytkownika(uzytkownik, motywacja_finansowa, niska),
	odpowiedz_uzytkownika(uzytkownik, niechec_do_matematyki, wysoka).
wyklucz(kierunki_uslugowe_operacyjne) :-
	odpowiedz_uzytkownika(uzytkownik, preferencja_praktycznosci, niska).
wyklucz(kierunki_przyrodniczo_technologiczne_laboratoryjne) :-
	odpowiedz_uzytkownika(uzytkownik, preferencja_praktycznosci, niska),
	odpowiedz_uzytkownika(uzytkownik, gotowosc_do_dlugiej_nauki, niska).
wyklucz(kierunki_interdyscyplinarne) :-
	odpowiedz_uzytkownika(uzytkownik, poziom_analityczny, niski),
	odpowiedz_uzytkownika(uzytkownik, kreatywnosc, niska),
	odpowiedz_uzytkownika(uzytkownik, komunikatywnosc, niska).

% Predykat sprawdzajacy, czy grupa nie jest wykluczona
dopuszczalna_grupa(Grupa) :-
	\+ wyklucz(Grupa).

% ====== Brakujace reguly zgodnosci grup ======
zgodnosc_prawno_administracyjna(wysoka) :-
	odpowiedz_uzytkownika(uzytkownik, gotowosc_do_dlugiej_nauki, wysoka),
	odpowiedz_uzytkownika(uzytkownik, komunikatywnosc, wysoka).

zgodnosc_prawno_administracyjna(srednia) :-
	odpowiedz_uzytkownika(uzytkownik, gotowosc_do_dlugiej_nauki, srednia).

zgodnosc_medyczna(wysoka) :-
	odpowiedz_uzytkownika(uzytkownik, zainteresowania_przedmiotowe, biologia),
	odpowiedz_uzytkownika(uzytkownik, gotowosc_do_dlugiej_nauki, wysoka),
	odpowiedz_uzytkownika(uzytkownik, tolerancja_stresu, wysoka).

zgodnosc_medyczna(srednia) :-
	odpowiedz_uzytkownika(uzytkownik, zainteresowania_przedmiotowe, biologia),
	odpowiedz_uzytkownika(uzytkownik, gotowosc_do_dlugiej_nauki, srednia).

zgodnosc_przyrodniczo_laboratoryjna(wysoka) :-
	odpowiedz_uzytkownika(uzytkownik, zainteresowania_przedmiotowe, biologia),
	odpowiedz_uzytkownika(uzytkownik, preferencja_praktycznosci, wysoka).

zgodnosc_uslugowa(wysoka) :-
	odpowiedz_uzytkownika(uzytkownik, preferencja_praktycznosci, wysoka),
	odpowiedz_uzytkownika(uzytkownik, komunikatywnosc, wysoka).

zgodnosc_uslugowa(srednia) :-
	odpowiedz_uzytkownika(uzytkownik, preferencja_praktycznosci, srednia).

zgodnosc_interdyscyplinarna(wysoka) :-
	profil_analityczny(sredni),
	profil_spoleczny(sredni).

zgodnosc_interdyscyplinarna(wysoka) :-
	profil_analityczny(sredni),
	profil_kreatywny(sredni).

zgodnosc_interdyscyplinarna(srednia) :-
	odpowiedz_uzytkownika(uzytkownik, preferowany_typ_zadan, badawcze).

% ====== Dodatkowe reguly profilujace ======
profil_analityczny(niski) :-
	odpowiedz_uzytkownika(uzytkownik, lubi_matematyke, nie),
	odpowiedz_uzytkownika(uzytkownik, poziom_analityczny, niski).

profil_spoleczny(niski) :-
	odpowiedz_uzytkownika(uzytkownik, chec_pracy_z_ludzmi, niska),
	odpowiedz_uzytkownika(uzytkownik, komunikatywnosc, niska).

profil_kreatywny(niski) :-
	odpowiedz_uzytkownika(uzytkownik, kreatywnosc, niska).

% ====== Dodatkowe rekomendacje glowne ======
rekomendacja(matematyka) :-
	zgodnosc_scisla(wysoka),
	odpowiedz_uzytkownika(uzytkownik, zainteresowania_przedmiotowe, matematyka),
	dopuszczalna_grupa(kierunki_scisle_formalne).

rekomendacja(prawo) :-
	zgodnosc_prawno_administracyjna(wysoka),
	odpowiedz_uzytkownika(uzytkownik, gotowosc_do_dlugiej_nauki, wysoka),
	dopuszczalna_grupa(kierunki_prawno_administracyjne).

rekomendacja(medycyna) :-
	zgodnosc_medyczna(wysoka),
	dopuszczalna_grupa(kierunki_medyczne_zdrowotne_przyrodnicze).

rekomendacja(ekonomia) :-
	zgodnosc_ekonomiczna(wysoka),
	dopuszczalna_grupa(kierunki_ekonomiczne_biznesowe).

rekomendacja(filologia_obce) :-
	zgodnosc_humanistyczna(wysoka),
	odpowiedz_uzytkownika(uzytkownik, komunikatywnosc, wysoka),
	dopuszczalna_grupa(kierunki_humanistyczne_jezykowe).

rekomendacja(turystyka_i_rekreacja) :-
	zgodnosc_uslugowa(wysoka),
	dopuszczalna_grupa(kierunki_uslugowe_operacyjne).

rekomendacja(kognitywistyka) :-
	zgodnosc_interdyscyplinarna(wysoka),
	dopuszczalna_grupa(kierunki_interdyscyplinarne).

rekomendacja(biotechnologia) :-
	zgodnosc_przyrodniczo_laboratoryjna(wysoka),
	dopuszczalna_grupa(kierunki_przyrodniczo_technologiczne_laboratoryjne).

rekomendacja(automatyka_i_robotyka) :-
	zgodnosc_techniczna(wysoka),
	odpowiedz_uzytkownika(uzytkownik, preferencja_praktycznosci, wysoka),
	dopuszczalna_grupa(kierunki_techniczne_inzynierskie).

rekomendacja(informatyka_stosowana) :-
	zgodnosc_informatyczna(srednia),
	odpowiedz_uzytkownika(uzytkownik, preferencja_praktycznosci, wysoka),
	dopuszczalna_grupa(kierunki_informatyczno_analityczne).

rekomendacja(pedagogika) :-
	zgodnosc_spoleczna(wysoka),
	odpowiedz_uzytkownika(uzytkownik, zainteresowania_przedmiotowe, psychologia),
	odpowiedz_uzytkownika(uzytkownik, preferowany_styl_uczenia_sie, praktyczny),
	dopuszczalna_grupa(kierunki_spoleczne_interpersonalne).

% ====== Dodatkowe rekomendacje alternatywne ======
rekomendacja_alternatywna(automatyka_i_robotyka) :-
	zgodnosc_techniczna(wysoka).

rekomendacja_alternatywna(analityka_biznesowa) :-
	zgodnosc_informatyczna(srednia).

rekomendacja_alternatywna(pedagogika) :-
	zgodnosc_spoleczna(srednia).

rekomendacja_alternatywna(multimedia) :-
	zgodnosc_kreatywna(srednia).

rekomendacja_alternatywna(ekonomia) :-
	zgodnosc_ekonomiczna(wysoka).

rekomendacja_alternatywna(administracja) :-
	zgodnosc_prawno_administracyjna(srednia).

rekomendacja_alternatywna(fizjoterapia) :-
	zgodnosc_medyczna(srednia).

rekomendacja_alternatywna(chemia) :-
	zgodnosc_przyrodniczo_laboratoryjna(wysoka).

rekomendacja_alternatywna(hotelarstwo) :-
	zgodnosc_uslugowa(srednia).

rekomendacja_alternatywna(kognitywistyka) :-
	zgodnosc_interdyscyplinarna(srednia).

alternatywy_rekomendacji(Alternatywy) :-
	findall(Kierunek,
		(rekomendacja_alternatywna(Kierunek), \+ rekomendacja(Kierunek)),
		SuroweAlternatywy),
	sort(SuroweAlternatywy, Alternatywy).

wniosek_koncowy(rekomendacja, Kierunek) :-
    rekomendacja(Kierunek).
