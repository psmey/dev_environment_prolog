% 1. insert(X, L, R) sei gültig, gdw die Liste R aus der Liste L durch Einfügen des Elementes X an beliebiger Position hervorgeht. Hinweis: Orientieren Sie sich an member/2.

% Basisfall: Setzte Element an den Anfang der Liste
insert(X, List, [X|List]).
% Rekursiver Fall: Rücke in der Liste ein Element weiter
insert(X, [Head|Tail], [Head|NewTail]) :- insert(X, Tail, NewTail).

% 2. perm(L, P) sei gültig, gdw die Liste P eine Permutation der Liste L ist (also dieselben Elemente in beliebiger Reihenfolge enthält).

% Basisfall: Leere Liste ist Permutation einer leeren Liste.
perm([], []).
% Rekusiver Fall: Entferne Element, wenn in beiden Listen verfügbar.
% Einfache Version:
% perm([Head1|Tail1], List2) :-
%     select(Head1, List2, List2WithoutHead1),
%     permutation(Tail1, List2WithoutHead1).
% lol war doch erlaubt :(

% Zu Fuß mit eigener Hilfsfunktion:
perm([Head|Tail], List) :-
    remove(Head, List, NewList),
    perm(Tail, NewList).

% Hilfsfunktion
% Basisfall: leere Liste ist leer
remove(_, [], []).
% Rekursiver Fall 1 Element gefunden
remove(X, [X|Tail], NewTail) :-
    remove(X, Tail, NewTail).
% Rekursiver Fall 2 Element nicht gefunden
remove(X, [Head|Tail], [Head|NewTail]) :-
    X \= Head,
    remove(X, Tail, NewTail).

% Implementieren Sie den mergesort-Algorithmus in Prolog!
% Zerlegen Sie das Problem:
% 1. split(L, L1, L2) zerlege die Liste L in Teillisten L1 und L2, auf die die Elemente abwechselnd verteilt werden.

split([], [], []).
split([X], [X], []).

% 2. merge(S1, S2, S) kombiniere die jeweils aufsteigend sortierten Listen von Zahlen S1 und S2, indem der jeweils kleinere Kopf der beiden sortierten Listen als nächstes in die Ergebnisliste eingefügt wird.
% 3. mergesort(L, S) verwende beide Hilfsfunktionen, falls die unsortierte Liste L mehr als ein Element hat. (length/2 ist vordefiniert) a Testen Sie Ihre Funktionen einzeln; Lösungen dürfen weder inkorrekt noch überzählig sein!


max(X, Y, Z) :- X >= Y, !, X = Z.
max(X, Y, Y).
