% Baza wiedzy: fakty, reguły, atrybuty, grupy kierunków

% ====== Atrybuty wejściowe użytkownika ======
% zainteresowania_przedmiotowe: matematyka, informatyka, biologia, języki, ekonomia, sztuka
% ulubiony_styl_pracy: indywidualny, zespołowy, mieszany
% preferowany_typ_zadan: analityczne, twórcze, praktyczne, organizacyjne, badawcze
% poziom_analityczny: niski, średni, wysoki
% komunikatywnosc: niska, średnia, wysoka
% chec_pracy_z_ludzmi: niska, umiarkowana, wysoka
% kreatywnosc: niska, średnia, wysoka
% tolerancja_stresu: niska, średnia, wysoka
% gotowosc_do_dlugiej_nauki: niska, średnia, wysoka
% preferencja_praktycznosci: niska, średnia, wysoka
% preferowany_styl_uczenia_sie: teoretyczny, praktyczny, projektowy, mieszany
% motywacja_finansowa: niska, średnia, wysoka
% niechec_do_matematyki: tak, nie, niska, średnia, wysoka

% ====== Atrybuty wynikowe ======
% profil_analityczny: niski, średni, wysoki
% profil_spoleczny: niski, średni, wysoki
% profil_kreatywny: niski, średni, wysoki
% zgodnosc_techniczna: niska, średnia, wysoka
% zgodnosc_scisla: niska, średnia, wysoka
% zgodnosc_informatyczna: niska, średnia, wysoka
% zgodnosc_ekonomiczna: niska, średnia, wysoka
% zgodnosc_spoleczna: niska, średnia, wysoka
% zgodnosc_humanistyczna: niska, średnia, wysoka
% zgodnosc_kreatywna: niska, średnia, wysoka

% ====== Grupy kierunków ======
% kierunki_techniczne_inzynierskie
% kierunki_scisle_formalne
% kierunki_informatyczno_analityczne
% kierunki_ekonomiczne_biznesowe
% kierunki_spoleczne_interpersonalne
% kierunki_humanistyczne_jezykowe
% kierunki_prawno_administracyjne
% kierunki_medyczne_zdrowotne_przyrodnicze
% kierunki_kreatywne_artystyczne_projektowe
% kierunki_przyrodniczo_technologiczne_laboratoryjne
% kierunki_uslugowe_operacyjne
% kierunki_interdyscyplinarne

% ====== Przykładowe fakty ======
odpowiedz(uzytkownik, lubi_matematyke, tak).
odpowiedz(uzytkownik, praca_z_ludzmi, wysoka).
odpowiedz(uzytkownik, preferowany_styl_pracy, zespolowy).
odpowiedz(uzytkownik, zainteresowanie, informatyka).

% ====== Przykładowe reguły ======
profil_analityczny(wysoki) :-
	odpowiedz(uzytkownik, lubi_matematyke, tak),
	odpowiedz(uzytkownik, rozwiazywanie_problemow, tak),
	odpowiedz(uzytkownik, poziom_logiczny, wysoki).

rekomendacja(informatyka) :-
	profil_analityczny(wysoki),
	odpowiedz(uzytkownik, zainteresowanie, informatyka),
	odpowiedz(uzytkownik, preferowany_styl_pracy, indywidualny).
