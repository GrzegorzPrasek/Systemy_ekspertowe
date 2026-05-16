% Główny plik uruchamiający system ekspertowy

:- consult(baza_wiedzy).
:- consult(wnioskowanie_przyb).
:- consult(wnioskowanie_rozm).
:- consult(reguly_minimalne).
:- consult(interfejs).
:- consult(sterowanie).
:- consult(testy).

start :-
    write('System ekspertowy: Dobor kierunku studiow'), nl,
    rozpocznij_dialog.

start_przyklad :-
    write('System ekspertowy: Przykladowy scenariusz'), nl,
    przykladowy_dialog.

start_przykladowe_fakty :-
    write('System ekspertowy: Wnioskowanie na przykladowych faktach'), nl,
    zaladuj_przykladowe_fakty,
    uruchom_i_przedstaw_wynik.

uruchom_testy :-
    write('System ekspertowy: Uruchamianie testow'), nl,
    run_all_tests.

start_reguly_minimalne :-
    write('System ekspertowy: Analiza regul minimalnych'), nl,
    wydrukuj_reguly_minimalne.
