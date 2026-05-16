% Główny plik uruchamiający system ekspertowy

:- consult(interfejs).
:- consult(sterowanie).
:- consult(baza_wiedzy).
:- consult(reguly_minimalne).
:- consult(wnioskowanie_przyb).
:- consult(wnioskowanie_rozm).

start :-
    write('System ekspertowy: Dobór kierunku studiów'), nl,
    rozpocznij_dialog.
