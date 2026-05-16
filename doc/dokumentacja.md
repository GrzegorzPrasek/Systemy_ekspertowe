# Dokumentacja systemu ekspertowego – dobór kierunku studiów

## 1. Cel systemu

System ekspertowy wspomagający dobór kierunku studiów na podstawie odpowiedzi użytkownika. Prowadzi kontekstowy dialog, gromadzi fakty, stosuje reguły produkcji i prezentuje rekomendacje z uzasadnieniem.

## 2. Reprezentacja wiedzy

### Fakty
Odpowiedzi użytkownika przechowywane jako `odpowiedz(uzytkownik, Atrybut, Wartosc)`. System aliasów (`alias_atrybutu/2`, `kanoniczny_atrybut/2`) zapewnia spójność nazw atrybutów.

### Poziomy wnioskowania
1. **Wnioski pierwotne** – bezpośrednio z odpowiedzi użytkownika (`wniosek_pierwotny/2`)
2. **Wnioski pośrednie** – profile (analityczny/społeczny/kreatywny) i zgodności z grupami kierunków (`wniosek_posredni/2`)
3. **Wnioski końcowe** – rekomendacje kierunków (`wniosek_koncowy/2`)

### Reguły (ok. 112)
- **Profilujące** – `profil_analityczny/1`, `profil_spoleczny/1`, `profil_kreatywny/1` (wysoki/średni/niski)
- **Zgodności grup** – 12 predykatów: `zgodnosc_techniczna/1`, `zgodnosc_scisla/1`, `zgodnosc_informatyczna/1`, `zgodnosc_ekonomiczna/1`, `zgodnosc_spoleczna/1`, `zgodnosc_humanistyczna/1`, `zgodnosc_kreatywna/1`, `zgodnosc_prawno_administracyjna/1`, `zgodnosc_medyczna/1`, `zgodnosc_przyrodniczo_laboratoryjna/1`, `zgodnosc_uslugowa/1`, `zgodnosc_interdyscyplinarna/1`
- **Wykluczające** – 15 reguł `wyklucz/1` (np. niechęć do matematyki → wykluczenie kier. technicznych/ścisłych)
- **Rekomendacji głównych** – 14 reguł `rekomendacja/1`
- **Alternatywnych** – 10 reguł `rekomendacja_alternatywna/1`
- **Przybliżone** – 3 reguły `przyblizona_rekomendacja/2` (próg ≥ 2 punkty)
- **Rozmyte** – 3 reguły `rozmyta_rekomendacja/2` (próg ≥ 0.6)

## 3. Kontekstowy dialog

System zadaje pytania ogólne (9 pytań), a następnie wybiera ścieżkę kontekstową:
- **Niechęć do matematyki** → `sciezka_bez_matematyki` (pomija pytania techniczne/ścisłe)
- **Lubi matematykę** → `sciezka_techniczna` (rozwiązywanie problemów, poziom analityczny)
- **Zainteresowanie psychologią** → `sciezka_spoleczna` (praca z ludźmi, komunikatywność, stres)
- **Zainteresowanie sztuką** → `sciezka_kreatywna` (kreatywność, styl uczenia)
- **Inne** → `sciezka_ogolna` (komunikatywność, kreatywność, styl uczenia, stres)

## 4. Mechanizmy wnioskowania

### Kaskada
`sterowanie.pl` realizuje kaskadę: klasyczne → przybliżone → rozmyte. Jeśli klasyczne da wynik, pozostałe nie są uruchamiane.

### Wnioskowanie klasyczne
Reguły produkcji prowadzą od odpowiedzi → profili → zgodności → rekomendacji.

### Wnioskowanie przybliżone (`wnioskowanie_przyb.pl`)
Każdy warunek rekomendacji jest punktowany (1 = spełniony, 0 = nie). Rekomendacja dopuszczona przy ≥ 2/4 punktów. Pozwala na częściowe dopasowanie.

### Wnioskowanie rozmyte (`wnioskowanie_rozm.pl`)
Stopnie przynależności 0–1. Obsługa wartości symbolicznych (wysoki→1.0, średni→0.5) i liczbowych (skala 0–10, normalizacja /10). Średnia stopni musi być ≥ 0.6.

## 5. Redukty i rdzeń (`reguly_minimalne.pl`)

Tablica decyzyjna (u1–u5) z 4 atrybutami warunkowymi i decyzją. Implementacja:
- `jadro/2` – wyznaczanie atrybutów niezbędnych (CORE)
- `niezbedny/2` – sprawdzenie czy usunięcie atrybutu zmienia rozróżnialność
- `wszystkie_redukty/2` – metoda z definicji (jądro + rozszerzanie)
- `rdzen/2` – przecięcie wszystkich reduktów
- `macierz_rozroznialnosci/2` – pary obiektów o różnych decyzjach
- `wyjasnij_rekomendacje/3` – minimalne atrybuty i kluczowe reguły

## 6. Prezentacja wyników

System wyświetla:
1. Ocenę zgodności z 12 grupami kierunków (wysoka/średnia)
2. Wykluczone grupy kierunków z uzasadnieniem
3. Rekomendację główną z uzasadnieniem
4. Kierunki alternatywne

## 7. Testy (`testy.pl`)

13 testów automatycznych:
- Reguły klasyczne, rekomendacja informatyka/psychologia/grafika
- Spójność (brak informatyki dla profilu bez dopasowania)
- Wnioskowanie przybliżone i rozmyte
- Alternatywy rekomendacji
- Rdzeń i redukty
- Wyjaśnienie rekomendacji
- Pełny przepływ techniczny/społeczny/kreatywny

Uruchomienie: `?- uruchom_testy.`

## 8. Ograniczenia

- System działa na wiedzy jawnie zapisanej w bazie reguł
- Nie uczy się automatycznie
- Rekomendacje mają charakter wspomagający
- Jakość zależy od kompletności odpowiedzi użytkownika
- Wiedza dziedzinowa oddzielona od interfejsu i sterowania
