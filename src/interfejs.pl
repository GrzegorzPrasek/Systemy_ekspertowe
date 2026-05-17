% Moduł interfejsu użytkownika (dialog)

% --- Kontekstowy dialog z użytkownikiem ---
rozpocznij_dialog :-
    wyczysc_odpowiedzi,
    write('Witaj! Odpowiedz na kilka pytan, aby dobrac kierunek studiow.'), nl,
    write('Wpisuj odpowiedzi jako atomy zakonczone kropka, np. tak. lub informatyka.'), nl,
    pytania_ogolne,
    podsumuj_dialog.

% Zadawanie pytań ogólnych
pytania_ogolne :-
    zadaj_pytanie(zainteresowania_przedmiotowe,
        'Jakie sa Twoje glowne zainteresowania?',
        [matematyka, informatyka, biologia, jezyki, ekonomia, sztuka, psychologia],
        zainteresowania_przedmiotowe),
    zadaj_pytanie(lubi_matematyke,
        'Czy lubisz matematyke?',
        [tak, nie],
        lubi_matematyke),
    zadaj_pytanie(ulubiony_styl_pracy,
        'Jaki preferujesz styl pracy?',
        [indywidualny, zespolowy, mieszany],
        ulubiony_styl_pracy),
    zadaj_pytanie_rozmyte(poziom_analityczny,
        'Jak oceniasz swoj poziom analityczny?',
        [niski, sredni, wysoki],
        poziom_analityczny),
    zadaj_pytanie_wielokrotnego_wyboru(preferowany_typ_zadan,
        'Jakie typy zadan lubisz najbardziej? Podaj liste, np. [analityczne,praktyczne].',
        [analityczne, tworcze, praktyczne, organizacyjne, badawcze],
        preferowany_typ_zadan),
    zadaj_pytanie_rozmyte(gotowosc_do_dlugiej_nauki,
        'Jaka jest Twoja gotowosc do dlugiej nauki?',
        [niska, srednia, wysoka],
        gotowosc_do_dlugiej_nauki),
    zadaj_pytanie_rozmyte(preferencja_praktycznosci,
        'Jak wazna jest dla Ciebie praktycznosc studiow?',
        [niska, srednia, wysoka],
        preferencja_praktycznosci),
    zadaj_pytanie_rozmyte(motywacja_finansowa,
        'Jak wazna jest dla Ciebie motywacja finansowa?',
        [niska, srednia, wysoka],
        motywacja_finansowa),
    zadaj_pytanie(niechec_do_matematyki,
        'Jaki jest Twoj poziom niecheci do matematyki?',
        [tak, nie, niska, srednia, wysoka],
        niechec_do_matematyki),
    pytania_kontekstowe.

% Zadawanie pytań kontekstowych (zawężanie przestrzeni)
% Instrukcja: jesli uzytkownik nie lubi matematyki, nie rozwijaj pytan technicznych/scislych.
pytania_kontekstowe :-
    odpowiedz(uzytkownik, niechec_do_matematyki, tak),
    !,
    sciezka_bez_matematyki.
pytania_kontekstowe :-
    odpowiedz(uzytkownik, niechec_do_matematyki, wysoka),
    !,
    sciezka_bez_matematyki.
pytania_kontekstowe :-
    odpowiedz(uzytkownik, lubi_matematyke, tak),
    !,
    sciezka_techniczna.
pytania_kontekstowe :-
    odpowiedz(uzytkownik, zainteresowania_przedmiotowe, psychologia),
    !,
    sciezka_spoleczna.
pytania_kontekstowe :-
    odpowiedz(uzytkownik, zainteresowania_przedmiotowe, sztuka),
    !,
    sciezka_kreatywna.
pytania_kontekstowe :-
    sciezka_ogolna.

sciezka_techniczna :-
    zadaj_pytanie(rozwiazywanie_problemow,
        'Czy lubisz rozwiazywanie problemow?',
        [tak, nie],
        rozwiazywanie_problemow),
    zadaj_pytanie_rozmyte(poziom_analityczny,
        'Jak oceniasz swoj poziom analityczny po rozwazeniu zadan technicznych?',
        [niski, sredni, wysoki],
        poziom_analityczny).

sciezka_spoleczna :-
    zadaj_pytanie_rozmyte(chec_pracy_z_ludzmi,
        'Jaka jest Twoja chec pracy z ludzmi?',
        [niska, umiarkowana, wysoka],
        chec_pracy_z_ludzmi),
    zadaj_pytanie_rozmyte(komunikatywnosc,
        'Jak oceniasz swoja komunikatywnosc?',
        [niska, srednia, wysoka],
        komunikatywnosc),
    zadaj_pytanie_rozmyte(tolerancja_stresu,
        'Jak oceniasz swoja tolerancje stresu?',
        [niska, srednia, wysoka],
        tolerancja_stresu).

sciezka_kreatywna :-
    zadaj_pytanie_rozmyte(kreatywnosc,
        'Jak oceniasz swoja kreatywnosc?',
        [niska, srednia, wysoka],
        kreatywnosc),
    zadaj_pytanie(preferowany_styl_uczenia_sie,
        'Jaki preferujesz styl uczenia sie?',
        [teoretyczny, praktyczny, projektowy, mieszany],
        preferowany_styl_uczenia_sie).

sciezka_bez_matematyki :-
    zadaj_pytanie_rozmyte(chec_pracy_z_ludzmi,
        'Jaka jest Twoja chec pracy z ludzmi?',
        [niska, umiarkowana, wysoka],
        chec_pracy_z_ludzmi),
    zadaj_pytanie_rozmyte(komunikatywnosc,
        'Jak oceniasz swoja komunikatywnosc?',
        [niska, srednia, wysoka],
        komunikatywnosc),
    zadaj_pytanie_rozmyte(kreatywnosc,
        'Jak oceniasz swoja kreatywnosc?',
        [niska, srednia, wysoka],
        kreatywnosc),
    zadaj_pytanie(preferowany_styl_uczenia_sie,
        'Jaki preferujesz styl uczenia sie?',
        [teoretyczny, praktyczny, projektowy, mieszany],
        preferowany_styl_uczenia_sie),
    zadaj_pytanie_rozmyte(tolerancja_stresu,
        'Jak oceniasz swoja tolerancje stresu?',
        [niska, srednia, wysoka],
        tolerancja_stresu).

sciezka_ogolna :-
    zadaj_pytanie_rozmyte(komunikatywnosc,
        'Jak oceniasz swoja komunikatywnosc?',
        [niska, srednia, wysoka],
        komunikatywnosc),
    zadaj_pytanie_rozmyte(kreatywnosc,
        'Jak oceniasz swoja kreatywnosc?',
        [niska, srednia, wysoka],
        kreatywnosc),
    zadaj_pytanie(preferowany_styl_uczenia_sie,
        'Jaki preferujesz styl uczenia sie?',
        [teoretyczny, praktyczny, projektowy, mieszany],
        preferowany_styl_uczenia_sie),
    zadaj_pytanie_rozmyte(tolerancja_stresu,
        'Jak oceniasz swoja tolerancje stresu?',
        [niska, srednia, wysoka],
        tolerancja_stresu).

zadaj_pytanie(Klucz, Tresc, Opcje, Atrybut) :-
    write('Pytanie ('), write(Klucz), write('): '), write(Tresc), nl,
    write('Dozwolone odpowiedzi: '), write(Opcje), nl,
    read(Odpowiedz),
    (   member(Odpowiedz, Opcje)
    ->  zapisz_odpowiedz(Atrybut, Odpowiedz)
    ;   write('Niepoprawna odpowiedz. Sprobuj ponownie.'), nl,
        zadaj_pytanie(Klucz, Tresc, Opcje, Atrybut)
    ).

% Hybrydowa wersja zadaj_pytanie/4 dla cech rozmytych: akceptuje
% liczbe 0-10 (uruchamia sciezke fuzzy cecha_rozmyta/2) albo symbol
% z listy opcji (klasyczna sciezka symboliczna).
zadaj_pytanie_rozmyte(Klucz, Tresc, Opcje, Atrybut) :-
    write('Pytanie ('), write(Klucz), write('): '), write(Tresc), nl,
    write('Mozesz podac liczbe 0-10 lub jedna z: '), write(Opcje), nl,
    read(Odpowiedz),
    (   poprawna_odpowiedz_rozmyta(Odpowiedz, Opcje)
    ->  zapisz_odpowiedz(Atrybut, Odpowiedz)
    ;   write('Niepoprawna odpowiedz. Sprobuj ponownie.'), nl,
        zadaj_pytanie_rozmyte(Klucz, Tresc, Opcje, Atrybut)
    ).

poprawna_odpowiedz_rozmyta(Odp, _) :-
    number(Odp), Odp >= 0, Odp =< 10, !.
poprawna_odpowiedz_rozmyta(Odp, Opcje) :-
    member(Odp, Opcje).

zadaj_pytanie_wielokrotnego_wyboru(Klucz, Tresc, Opcje, Atrybut) :-
    write('Pytanie ('), write(Klucz), write('): '), write(Tresc), nl,
    write('Dozwolone odpowiedzi: '), write(Opcje), nl,
    read(Odpowiedzi),
    (   jest_poprawna_lista_odpowiedzi(Odpowiedzi, Opcje)
    ->  zapisz_wiele_odpowiedzi(Atrybut, Odpowiedzi)
    ;   write('Niepoprawna lista odpowiedzi. Sprobuj ponownie.'), nl,
        zadaj_pytanie_wielokrotnego_wyboru(Klucz, Tresc, Opcje, Atrybut)
    ).

jest_poprawna_lista_odpowiedzi([], _).
jest_poprawna_lista_odpowiedzi([Odpowiedz|Reszta], Opcje) :-
    member(Odpowiedz, Opcje),
    jest_poprawna_lista_odpowiedzi(Reszta, Opcje).

zapisz_odpowiedz(Atrybut, Wartosc) :-
    retractall(odpowiedz(uzytkownik, Atrybut, _)),
    zapisz_fakt(uzytkownik, Atrybut, Wartosc).

zapisz_wiele_odpowiedzi(_, []).
zapisz_wiele_odpowiedzi(Atrybut, [Wartosc|Reszta]) :-
    zapisz_fakt(uzytkownik, Atrybut, Wartosc),
    zapisz_wiele_odpowiedzi(Atrybut, Reszta).

podsumuj_dialog :-
    nl,
    write('Zebrano odpowiedzi. Uruchamianie wnioskowania...'), nl,
    uruchom_i_przedstaw_wynik.

% Przykladowy dialog demonstracyjny zgodny z zalozeniami projektu.
przykladowy_dialog :-
    wyczysc_odpowiedzi,
    zapisz_fakt(uzytkownik, zainteresowania_przedmiotowe, informatyka),
    zapisz_fakt(uzytkownik, lubi_matematyke, tak),
    zapisz_fakt(uzytkownik, ulubiony_styl_pracy, indywidualny),
    zapisz_fakt(uzytkownik, preferowany_typ_zadan, analityczne),
    zapisz_fakt(uzytkownik, rozwiazywanie_problemow, tak),
    zapisz_fakt(uzytkownik, poziom_analityczny, wysoki),
    zapisz_fakt(uzytkownik, gotowosc_do_dlugiej_nauki, wysoka),
    zapisz_fakt(uzytkownik, preferencja_praktycznosci, wysoka),
    write('System: Wczytano przykladowy dialog techniczny.'), nl,
    przykladowy_wynik_dialogu.
