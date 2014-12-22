% No need for this portion
subj_course_unit(physics, [phy1201, phy1102, phy1203, phy1205, phy2101, phy2102, phy2103, phy2204, phy2105, phy2106, phy2207, phy3301, phy3302, phy3203, phy3204, phy3105, phy3206, phy3207, phy3208, phy3309, phy3211, phy3212, phy3213, phy3214]).

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

% check for element existence in a list
membr(H, [H|T]).
membr(X, [H|T]) :- membr(X, T).

% check whether given list is a subset of a list
subSet([], B).
subSet([H|T], compulsory(Subj, B)) :- subSet(T, B), membr(H,B).

% this counts the number of credits relevant to each course unit given
% by subject list by user
as_subject([T], M, Subj) :- course_unit_credits(Subj, T, M, Y).
as_subject([H|T], M, Subj) :- course_unit_credits(Subj,H, M1, Y), as_subject(T,M2,Subj), M is M1+M2.

% when provide a subject list, this method checks whether it can be
% taken as a subject for that student. this validates whether given
% course list contains credits greater than 24 and whether it includes
% all the compusory courses for that particular subject.
subjectReq([H|T],Subj) :- as_subject([H|T], M, Subj), M>24, subSet([H|T], compulsory(Subj, B)).

% original code for finding a sublist from a list
subSetOriginal([], BL).
subSetOriginal([H|L], BL) :- subSetOriginal(L, BL), membr(H, BL).






















