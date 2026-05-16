% Główny plik uruchamiający system ekspertowy

:- consult(baza_wiedzy).
:- consult(interfejs).
:- consult(sterowanie).
:- consult(reguly_minimalne).
:- consult(wnioskowanie_przyb).
:- consult(wnioskowanie_rozm).
:- consult(testy).

start :-
    write('System ekspertowy: Dobór kierunku studiów'), nl,
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
