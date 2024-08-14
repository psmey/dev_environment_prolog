%% Aufgaben zum 2. Foliensatz
%% A107 - Programmierparadigmen 2023-Q3
%% Baltasar Trancón Widemann

vater(richard, henry).
vater(joan, henry).
vater(john, henry).
vater(henry, geoffrey).
vater(hamelin, geoffrey).
vater(eleanor, william).

mutter(richard, eleanor).
mutter(joan, eleanor).
mutter(john, eleanor).
mutter(henry, matilda).
mutter(hamelin, matilda).
mutter(eleanor, aenor).

verheiratet(henry, eleanor).
verheiratet(geoffrey, matilda).
verheiratet(william, aenor).

weiblich(joan).
weiblich(eleanor).
weiblich(matilda).
weiblich(aenor).

schwester(X, Y) :- weiblich(Y),
	mutter(X, M), mutter(Y, M),
	vater(X, V), vater(Y, V),
     X \== Y.

% 2.1 Fügen Sie ein Prädikat maennlich/1 als Gegenstück zu weiblich/1 hinzu.

maennlich(richard).
maennlich(henry).
maennlich(geoffrey).
maennlich(hamelin).
maennlich(william).

% 2.2 Definieren Sie Prädikate bruder/2, onkel/2, nichte/2, schwaegerin/2. Testen Sie diese ausführlich.

bruder(X, Y) :- maennlich(Y),
    mutter(X, M), mutter(Y, M),
    vater(X, V), vater(X, V),
    X \== Y.

onkel(X, Y) :- elternteil(X, V), bruder(V, Y).

nichte(X, Y) :- elternteil(Y, V), geschwister(V, X), weiblich(Y).

schwaegerin(X, Y) :- verheiratet(X, A), schwester(A, Y).
schwaegerin(X, Y) :- verheiratet(A, X), schwester(A, Y).
schwaegerin(X, Y) :- geschwister(X, A), verheiratet(A, Y). % verheiratet/2 ist nicht bidiretional sondern definiert nach verheiratet(Mann, Frau), daher lässt sich daran schon das geschlecht bestimmen.

% 2.3 Ersetzen Sie die Prädikate vater/2 und mutter/2 durch kind/2. Passen Sie alle Verwendungsstellen an. Testen Sie Ihre Refaktorisierung auf Regressionen.

kind(X, Y) :- (vater(Y, X) ; mutter(Y, X)).

% hilfsverbindungen

elternteil(X, Y) :- (vater(X, Y) ; mutter(X, Y)).

geschwister(X, Y) :- (bruder(X, Y) ; schwester(X, Y)).
