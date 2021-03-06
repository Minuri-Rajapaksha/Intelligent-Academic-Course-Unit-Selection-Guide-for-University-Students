
% code for calculating course units which contains best 90 credits
% with best results of a prticular student

best90(CuList , RList, R, GPA) :- possible90(CuList, R), getResultsList(CuList, RList, R,E), calcuGPA(R, E, GPA).


% code for caluculating resutls list for a paricular "possible 90"
% combination list

getResultsList(S, T, U, E) :- deleteL(U, E, []).
getResultsList([X|S], [Y|T], [Z|U], E) :- deleteL(Y, E, R), X == Z, getResultsList(S, T, U, E1).


% code for deleting element from a list

deleteL(H,[H|T],T).
deleteL(X,[H|T],[H|R]):-deleteL(X,T,R).
