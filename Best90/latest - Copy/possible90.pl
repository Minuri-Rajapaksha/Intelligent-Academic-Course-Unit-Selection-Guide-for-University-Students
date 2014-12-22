
possible90(cuList, R) :- subjectReq(R,S1), subectReq(R,S2), S1 == S2, yearReq(R,1), yearReq(R,2), yearReq(R,3),withinCombination(R,CombList), credits(R,X), X > 89, X <94, subSet(R,cuList).

