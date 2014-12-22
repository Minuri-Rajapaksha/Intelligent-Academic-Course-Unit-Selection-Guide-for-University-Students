% --------------- required data ------------------------

% All compulsory and optional subject details are defined here. last two
% numbers indicate the number of credits and the academic year.
course_unit_credits(physics, phy1201, 2, 1).
course_unit_credits(physics, phy1102, 1, 1).
course_unit_credits(physics, phy1203, 2, 1).
course_unit_credits(physics, phy1205, 2, 1).
course_unit_credits(physics, phy2102, 1, 2).
course_unit_credits(physics, phy2103, 1, 2).


% contains only compulsory subjects
compulsory(physics, [phy3211, phy3212, phy3213, phy3214]).

% All compulsory and optional subject details for a particualr
% subject combination is defined here.
subj_combination(ccsp, [cmp1201, cmp1202, cmp1203, map1301, map1302]).
subj_combination(ccsm, [cmp1201, cmp1202, cmp1203, map1301, map1302]).



% ---------------- reusable functions --------------------
membr(H, [H|T]).
membr(X, [H|T]) :- membr(X, T).

% check whether given list is a subset of a list
subSet([], B).
subSet([H|T], compulsory(Subj, B)) :- subSet(T, B), membr(H,B).


% check whether given list is a subset of a list
subSetN([], B).
subSetN([H|T], subj_combination(SubjComb, B)) :- subSetN(T, B), membr(H, B).

% original code for finding a sublist from a list
subSetOriginal([], BL).
subSetOriginal([H|L], BL) :- subSetOriginal(L, BL), membr(H, BL).



% --------------- validate year requirement ---------------

% this counts the number of credits completed by a student relevant to
% an academic year
yearCredReq([T], M, Year) :- course_unit_credits(S, T, M, Year).
yearCredReq([H|T], M, Year) :- course_unit_credits(S,H, M1,Year), yearCredReq(T,M2,Year), M is M1+M2.

% this validates whether a student has completed from 26 to 33 credits
% for an academic year
yearReq([H|T],Year) :- yearCredReq([H|T], M, Year), M>26, M<33.



% -------------- validate subject requirement --------------

% this counts the number of credits relevant to each course unit given
% by subject list by user
as_subject([T], M, Subj) :- course_unit_credits(Subj, T, M, Y).
as_subject([H|T], M, Subj) :- course_unit_credits(Subj,H, M1, Y), as_subject(T,M2,Subj), M is M1+M2.

% when provide a subject list, this method checks whether it can be
% taken as a subject for that student. this validates whether given
% course list contains credits greater than 24 and whether it includes
% all the compusory courses for that particular subject.
subjectReq([H|T],Subj) :- as_subject([H|T], M, Subj), M>24, subSet([H|T], compulsory(Subj, B)).



% ------------- validate within a subject combination list -------------

% when provide a subject list, this method checks whether it belongs
% to any subject combination category already defined in the prospectus
withinCombination([H|T],CombL) :- subSetN([H|T], subj_combination(SubjComb, CombL)).



% ------------ count credits ---------------

cal_sum_credit([X|SL], Credits) :- course_unit_credits(S, X, Credits, Y).
cal_sum_credit([X|SL], Sum_credits) :- cal_sum_credit(SL, Sum_credits1), course_unit_credits(S, X, Credits, Y), Sum_credits is Credits + Sum_credits1.



% ---------- code for finding all possible credit 90 course units ------

possible90(CuList, R) :- subjectReq(R,S1), subjectReq(R,S2), S1 == S2, yearReq(R,1), yearReq(R,2), yearReq(R,3),withinCombination(R,CombList), cal_sum_credit(R,X), X > 89, X <94, subSetOriginal(R,CuList).


