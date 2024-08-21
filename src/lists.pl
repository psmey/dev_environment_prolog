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
% Zu Fuß mit eigener Hilfsfunktion:
perm([Head1|Tail1], List2) :-
    remove(Head1, List2, NewList2),
    perm(Tail1, NewList2).

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
