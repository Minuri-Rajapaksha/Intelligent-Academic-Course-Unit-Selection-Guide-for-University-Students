

cuc(phy1203, 2).
cuc(phy1201, 2).
cuc(phy1202, 2).
cuc(phy1204, 2).

results_weight(Aplus, 4).
results_weight(A, 4).
results_weight(Aminus, 3.7).
results_weight(Bplus, 3.3).


calcGPA(SL, RL, GPA, ICT) :- calcuGPA(SL,RL,GPA).

calcuGPA([X|SL], [Y|RL], GPA) :- calc_sum_CR([X|SL], [Y|RL], sum_CR), cal_sum_credit([X|SL], sum_credits), GPA is sum_CR/sum_credits, \+ member(sum_CR, []), \+ member(sum_credits, []).

calc_sum_CR([],[],sum_CR) :- sum_CR is 0.
calc_sum_CR([X|SL], [Y|RL], sum_CR) :- calc_sum_CR(SL,RL, sum_CR1),cuc(X,Credit), results_weight(Y,Weight), sum_CR is sum_CR1 + Credit * Weight, \+ member(Credit,[1, 2, 3, 4]), \+ member(Weight,[4,3.7,3.3,3.0,2.7,2.3,2.0,1.7,1.3,1]) .


cal_sum_credit([X|SL], sum_credit) :- cuc(X, sum_credit).
cal_sum_credit([X|SL], sum_credits) :- cal_sum_credit(SL, sum_credits1),cuc(X, credits), sum_credits is credits + sum_credits1.
