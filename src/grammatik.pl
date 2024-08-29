/* Vorgabe zur Aufgabe "Deutsche Grammatik" */
/* A107 - Programmierparadigmen 2023-Q3 */
/* Autor: Baltasar Trancón Widemann */

% DCG-Regel
% Aufruf mit: ?- phrase(satz(X), Wortliste).
%! satz(-Satz)

satz(X) -->
    np(Subjekt, nominativ),
    verb(Verb, transitiv),
    adverbialebestummungen(Adverbialebestimmungen),
    np(Objekt, akkusativ),
    { X =.. [Verb, Subjekt, Objekt | Adverbialebestimmungen] }. % [Kopf | Beliebig langer Rest], beim Kopf ist die Reihenfolge egal, wird vor der Liste zusammengebaut
satz(X) -->
    np(Subjekt, nominativ),
    verb(Verb, intransitiv),
    adverbialebestummungen(Adverbialebestimmungen),
    { X =.. [Verb, Subjekt | Adverbialebestimmungen] }.

% DCG-Regel
% NP = Nominalphrase
%! np(-Substantiv, -Fall)

np(X, _) --> name(X).
% vorher: np(X, F) --> artikel(_, F), subst(X, F).
% Aufgabe 1
np(X, F) --> artikel(Genus, F), subst(X, Genus, F).
% Aufgabe 2
np(Phrase, Fall) -->
    artikel(Genus, Fall),
    adjektiv(Adjektiv, Genus, Fall),
    subst(Substantiv, Genus, Fall),
    { Phrase =.. [Adjektiv, Substantiv] }. % nimmt Phrase und teilt es in die folgenden teile

% DCG-Regel
%! name(-Name)

name(vladimir) --> [vladimir].
name(estragon) --> [estragon].
name(godot) --> [godot].

% DCG-Regel
%! artikel(-Genus, -Fall)

artikel(maennlich, nominativ) --> [der].
artikel(maennlich, akkusativ) --> [den].

artikel(maennlich, nominativ) --> [ein].
artikel(maennlich, akkusativ) --> [einen].

% Aufgabe 1
artikel(weiblich, _) --> [die].

artikel(weiblich, _) --> [eine].

% DCG-Regel
%! subst(-Substantiv, ?Fall)

subst(keks, maennlich, _) --> [keks].

subst(pate, maennlich, nominativ) --> [pate].
subst(pate, maennlich, akkusativ) --> [paten].

% Aufgabe 1
subst(waffel, weiblich, _) --> [waffel].

subst(patin, weiblich, _) --> [patin].

% DCG-Regel
%! verb(-Verb, ?Valenz)

verb(warten, intransitiv) --> [wartet].
verb(warten, transitiv) --> [erwartet].
verb(essen, intransitiv) --> [isst].
verb(essen, transitiv) --> [isst].
verb(gehen, intransitiv) --> [geht].

% Aufgabe 1
% Erweitern Sie die vorgegebene Grammatik um weibliche Substantive und deren passende Artikel.
% - Definieren Sie jeweils mindestens eine weibliche Person und Speise.

% Aufgabe 2
% Erweitern Sie die Grammatik so, dass einem Substantiv optional ein Adjektiv hinzugefügt werden kann.
% - Testen Sie mit (korrekten Formen von) erste und letzte.
% - Überlegen Sie, wie dieses praktischerweise im Analyseergebnis untergebracht werden können.
% adjektiv(grund_adjektiv, Genus, Fall) --> [adjektiv]

adjektiv(lecker, _, nominativ) --> [leckere].
adjektiv(lecker, maennlich, akkusativ) --> [leckeren].
adjektiv(lecker, weiblich, akkusativ) --> [leckere].

adjektiv(erste, _, nominativ) --> [erste].
adjektiv(erste, maennlich, akkusativ) --> [ersten].
adjektiv(erste, weiblich, akkusativ) --> [erste].

adjektiv(letzte, _, nominativ) --> [letzte].
adjektiv(letzte, maennlich, akkusativ) --> [letzten].
adjektiv(letzte, weiblich, akkusativ) --> [letzte].

% Aufgabe 3
% Erweitern Sie die Grammatik so, dass einem Verb beliebig viele adverbiale Bestimmungen hinzugefügt werden können.
% - Testen Sie mit nicht, heute und gerne.
% - Überlegen Sie, wie diese praktischerweise im Analyseergebnis untergebracht werden können.

adverbialebestimmung(nicht) --> [nicht].
adverbialebestimmung(heute) --> [heute].
adverbialebestimmung(gerne) --> [gerne].

adverbialebestummungen([]) --> [].
adverbialebestummungen([Adverbialebestimmung | Rest]) -->
    adverbialebestimmung(Adverbialebestimmung),
    adverbialebestummungen(Rest).
