award(general, SL, RL, GPA) :- req_for_year(1,SL,RL,RemainCr), req_for_year(2,SL,RL,RemainCr), req_for_year(3,SL,RL,RemainCr), GPA>2, req_for_rest(RemainCred), CommonCompul_req(SL,RL).

req_for_year(Year, SL,RL) :-
