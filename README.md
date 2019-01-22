# summing_lines-lex_bison

   **Sprawozdanie – laboratorium 6**	
   
Weronika Kowalska     
Alicja Gratkowska

**Zad. 1**
Wzorce wyszukujące wiersze z daną klasą danych:
a) ^(\s*\b([0]|([1-9][0]*)+)\b\s*)+$
b) ^(\s*\b([A-F0-9])+\b\s*)+$
c) ^(\s*\b([0-9]|[1-9][0-9]+)[.][0-9]+\b\s*)+$
d) ^(\s*\b(([0-9]|[1-9][0-9]+)[.][0-9]+E[+-][0-9]+)+\b\s*)+$
Ogólny wzorzec:
(^(\s*\b(([0-9]|[1-9][0-9]+)[.][0-9]+E[+-][0-9]+)+\b\s*)+$)|(^(\s*\b([0-9]|[1-9][0-9]+)[.][0-9]+\b\s*)+$)|
(^(\s*\b([A-F0-9])+\b\s*)+$)|(^(\s*\b([0]|([1-9][0]*)+)\b\s*)+$)

**Zad. 2**
Gramatyka G definiuje zbiór danych z zadania 1. G = <V, T, P, S >, gdzie
V – zbiór symboli nieterminalnych, T – zbiór symboli terminalnych, P – lista produkcji, S – symbol początkowy.
V = {C, L, I, H, F, E, S}
T = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, a, b, c, d, e, f, +, ., ε }
P = {S->I S|F S| H S| E S, E-> F ‘e+’ I, F->I ’.’ I, H->I H|L H|I|L, I-> C I|C, C->0|1|2|3|4|5|6|7|8|9|ε, L->a|b|c|d|e|f|ε}

**Zad. 3**
W kodzie leksera są zapisane wyrażenia regularne wyłapujące poszczególne rodzaje liczb. W kodzie parsera są zapisane: w sekcji definicji zmienne w których są przechowywane sumy liczb z danych wierszów, deklaracje funkcji pomocniczych oraz tokeny i typy. Wykorzystane zostały funkcje pomocnicze do konwersji char* na int int na char*.

