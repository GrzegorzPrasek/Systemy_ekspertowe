# System ekspertowy do doboru kierunku studiów

System ekspertowy wspomagający wybór kierunku studiów na podstawie profilu użytkownika. Zaimplementowany w SWI-Prologu jako system regułowy o modularnej architekturze.

## Struktura projektu

```
src/
  main.pl                  – punkt wejściowy, ładowanie modułów
  baza_wiedzy.pl            – fakty, reguły, atrybuty, grupy kierunków
  interfejs.pl              – kontekstowy dialog z użytkownikiem
  sterowanie.pl             – mechanizm wnioskowania i prezentacja wyników
  reguly_minimalne.pl       – redukty, rdzeń, tablica decyzyjna
  wnioskowanie_przyb.pl     – wnioskowanie przybliżone (punktowe)
  wnioskowanie_rozm.pl      – wnioskowanie rozmyte (stopnie przynależności)
  testy.pl                  – testy scenariuszowe
data/
  scenariusze.csv           – tablica decyzyjna (u1–u5)
doc/
  dokumentacja.md           – dokumentacja techniczna
```

## Uruchomienie

```prolog
?- consult('src/main.pl').
?- start.                    % interaktywny dialog
?- start_przyklad.           % przykładowy scenariusz techniczny
?- uruchom_testy.            % testy automatyczne
```

## Architektura (6 modułów)

1. **Moduł interfejsu** (`interfejs.pl`) – kontekstowy dialog, pytania ogólne → pytania kontekstowe (ścieżka techniczna / społeczna / kreatywna / bez matematyki / ogólna)
2. **Moduł sterowania** (`sterowanie.pl`) – kaskada: klasyczne → przybliżone → rozmyte, prezentacja zgodności grup, rekomendacji z uzasadnieniem, alternatyw i wykluczeń
3. **Moduł bazy wiedzy** (`baza_wiedzy.pl`) – 13 atrybutów wejściowych, 10 wynikowych, 12 grup kierunków, ~112 reguł (profilujące, zgodności, wykluczające, rekomendacji, alternatywne)
4. **Moduł reguł minimalnych** (`reguly_minimalne.pl`) – tablica decyzyjna u1–u5, wyznaczanie rdzenia (CORE), reduktów metodą z definicji, macierz rozróżnialności
5. **Moduł wnioskowania przybliżonego** (`wnioskowanie_przyb.pl`) – częściowe dopasowanie punktowe (próg ≥ 2/4 warunków)
6. **Moduł wnioskowania rozmytego** (`wnioskowanie_rozm.pl`) – stopnie przynależności 0–1, obsługa wartości symbolicznych i liczbowych (skala 0–10), próg ≥ 0.6

## Atrybuty wejściowe

| Atrybut | Typ |
|---|---|
| zainteresowania_przedmiotowe | wielowartościowy |
| ulubiony_styl_pracy | symboliczny |
| preferowany_typ_zadan | wielowartościowy |
| poziom_analityczny | porządkowy/rozmyty |
| komunikatywnosc | porządkowy/rozmyty |
| chec_pracy_z_ludzmi | porządkowy/rozmyty |
| kreatywnosc | porządkowy/rozmyty |
| tolerancja_stresu | porządkowy/rozmyty |
| gotowosc_do_dlugiej_nauki | porządkowy |
| preferencja_praktycznosci | porządkowy |
| preferowany_styl_uczenia_sie | symboliczny |
| motywacja_finansowa | porządkowy |
| niechec_do_matematyki | logiczny/porządkowy |

## Rekomendacje główne

informatyka, psychologia, grafika, matematyka, prawo, medycyna, ekonomia, filologia_obce, turystyka_i_rekreacja, kognitywistyka, biotechnologia, automatyka_i_robotyka, informatyka_stosowana, pedagogika

## Rekomendacje alternatywne

automatyka_i_robotyka, analityka_biznesowa, pedagogika, multimedia, ekonomia, administracja, fizjoterapia, chemia, hotelarstwo, kognitywistyka

## Reguły wykluczające

System automatycznie wyklucza grupy kierunków na podstawie odpowiedzi użytkownika (np. niechęć do matematyki → wykluczenie kierunków technicznych i ścisłych, niska gotowość do długiej nauki → wykluczenie medycyny i prawa).

## Podział prac w zespole

- **Jakub Kindracki** – baza wiedzy (model dziedziny, atrybuty, wartości, reguły produkcji)
- **Wiktor Kobielski** – wnioskowanie i interfejs (przebieg dialogu, pytania, odpowiedzi, logika sterowania)
- **Grzegorz Prasek** – wnioskowanie przybliżone (częściowe dopasowanie, rekomendacje alternatywne)
- **Mykhailo Shamrai** – wnioskowanie rozmyte (pojęcia nieostre, funkcje przynależności, ocena natężenia cech)
