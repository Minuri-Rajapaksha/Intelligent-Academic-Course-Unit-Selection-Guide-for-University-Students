% no need for this portion
subj_course_unit(physics, [phy1201, phy1102, phy1203, phy1205, phy2101, phy2102, phy2103, phy2204, phy2105, phy2106, phy2207, phy3301, phy3302, phy3203, phy3204, phy3105, phy3206, phy3207, phy3208, phy3309, phy3211, phy3212, phy3213, phy3214]).

% All compulsory and optional subject details are defined here. last two
% numbers indicate the number of credits and the academic year.
course_unit_credits(physics, phy1201, 2, 1).
course_unit_credits(physics, phy1102, 1, 1).
course_unit_credits(physics, phy1203, 2, 1).
course_unit_credits(physics, phy1205, 2, 1).
course_unit_credits(physics, phy2102, 1, 2).
course_unit_credits(physics, phy2103, 1, 2).


% this counts the number of credits completed by a student relevant to
% an academic year
yearCredReq([T], M, Year) :- course_unit_credits(S, T, M, Year).
yearCredReq([H|T], M, Year) :- course_unit_credits(S,H, M1,Year), yearCredReq(T,M2,Year), M is M1+M2.

% this validates whether a student has completed from 26 to 33 credits
% for an academic year
yearReq([H|T],Year) :- yearCredReq([H|T], M, Year), M>26, M<33.

