% 1. stueckpreis(N, P) sei gültig, gdw P der Stückpreis bei einer Bestellmenge von N ist. Dieser sei 15 bis zur Menge 1000, dann 12 bis zur Menge 10000, und darüber 10. Was passiert, wenn N beim Aufruf ungebunden ist? Warum?

stueckpreis(N, 15) :- N =< 1000.
stueckpreis(N, 12) :- (1000 < N), (N =< 10000).
stueckpreis(N, 10) :- N > 10000.

% 2. pythagoras(A, B, C) sei gültig, gdw A, B und C ein pythagoräisches Tripel bilden:
% a^2 + b^2 = c^2
% a Das Prädikat soll immer Lösungen liefern, wenn höchstens eines der drei Argumente eine ungebundene Variable ist (und die übrigen Zahlen).

% is ist nur in
pythagoras(A, B, C) :- number(A), number(B), number(C), sqrt(A*A + B*B) =:= C.
pythagoras(A, B, C) :- var(A), A is sqrt(C*C - B*B).
pythagoras(A, B, C) :- var(B), B is sqrt(C*C - A*A).
pythagoras(A, B, C) :- var(C), C is sqrt(A*A + B*B).
