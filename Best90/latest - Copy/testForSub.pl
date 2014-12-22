sub_course_unit(physics, [phy1201, phy1102, phy1203, phy1205, phy2101, phy2102, phy2103, phy2204, phy2105, phy2106, phy2207, phy3301, phy3302, phy3203, phy3204, phy3105, phy3206, phy3207, phy3208, phy3309, phy3211, phy3212, phy3213, phy3214]).


course_unit_credits(physics, phy1201, 2).
course_unit_credits(physics, phy1102, 1).
course_unit_credits(physics, phy1203, 2).
course_unit_credits(physics, phy1205, 2).
course_unit_credits(physics, phy2102, 1).
course_unit_credits(physics, phy2103, 1).

compulsory(physics, [phy3211, phy3212, phy3213, phy3214]).

as_subject([T], M, subj) :- course_unit_credits(subj, T, M).
as_subject([H|T], M, subj) :- course_unit_credits(subj,H, M1), as_subject(T,M2,subj), M is M1+M2.

subjectReq([H|T],subj) :- as_subject([H|T], M, subj), M>24, subSet([H|T], compulsory(subj, B)).


membr(H, [H|T]).
membr(X, [H|T]) :- membr(X, T).

subSet([], A).
subSet([H|T], compulsory(A, B)) :- subSet(T, A), membr(H,A).

