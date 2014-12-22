
% All compulsory and optional subject details for a particualr
% subject combination is defined here.
subj_combination(ccsp, [cmp1201, cmp1202, cmp1203, map1301, map1302]).
subj_combination(ccsm, [cmp1201, cmp1202, cmp1203, map1301, map1302]).


% check for element existence in a list
membr(H, [H|T]).
membr(X, [H|T]) :- membr(X, T).

% check whether given list is a subset of a list
subSetN([], B).
subSetN([H|T], subj_combination(SubjComb, B)) :- subSetN(T, B), membr(H, B).


% when provide a subject list, this method checks whether it belongs
% to any subject combination category already defined in the prospectus
withinCombination([H|T],CombL) :- subSetN([H|T], subj_combination(SubjComb, CombL)).












































