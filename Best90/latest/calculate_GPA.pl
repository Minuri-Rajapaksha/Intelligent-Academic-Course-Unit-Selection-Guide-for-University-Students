course_unit_credits(physics, phy1201, 2, 1).
course_unit_credits(physics, phy1102, 1, 1).
course_unit_credits(physics, phy1203, 2, 1).
course_unit_credits(physics, phy1205, 2, 1).
course_unit_credits(physics, phy2102, 1, 2).
course_unit_credits(physics, phy2103, 1, 2).


results_weight(Aplus, 4).
results_weight(A, 4).
results_weight(Aminus, 3.7).
results_weight(Bplus, 3.3).


calcGPA(SL, RL, GPA, ICT) :- calcuGPA(SL,RL,GPA).

calcuGPA([X|SL], [Y|RL], GPA) :- calc_sum_CR([X|SL], [Y|RL], Sum_CR), cal_sum_credit([X|SL], Sum_credits), GPA is Sum_CR/Sum_credits, \+ member(Sum_CR, []), \+ member(Sum_credits, []).

calc_sum_CR([],[],Sum_CR) :- Sum_CR is 0.
calc_sum_CR([X|SL], [Y|RL], Sum_CR) :- calc_sum_CR(SL,RL, Sum_CR1),course_unit_credits(S, X , Credit, Y), results_weight(Y,Weight), Sum_CR is Sum_CR1 + Credit * Weight, \+ member(Credit,[1, 2, 3, 4]), \+ member(Weight,[4,3.7,3.3,3.0,2.7,2.3,2.0,1.7,1.3,1]) .


cal_sum_credit([X|SL], Sum_credit) :- course_unit_credits(S, X, Sum_credit, Y).
cal_sum_credit([X|SL], Sum_credits) :- cal_sum_credit(SL, Sum_credits1),cuc(X, Credits), Sum_credits is Credits + Sum_credits1.

