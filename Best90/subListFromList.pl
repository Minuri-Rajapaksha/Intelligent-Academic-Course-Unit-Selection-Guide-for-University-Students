% domains
%
%    name = symbol
%    namelist = name*
%predicates
%    sublist(namelist,namelist)
%clauses

    sublist([],[]).

    sublist([First|Rest],[First|Sub]):-
        sublist(Rest,Sub).

    sublist([_|Rest],Sub):-
        sublist(Rest,Sub).

% or
%trace
%domains
%    x = integer
%   l = integer*

%predicates
%    concatenate(l,l,l)
%    sublist(l,l)

%clauses

    concatenate([],List,List).

    concatenate([X|List1],List2,[X|List3]) :-
        concatenate(List1,List2,List3).

    sublist2(SubList,List) :-
        concatenate(List1,SubList,List3),
        concatenate(List3,List2,List),
        write(SubList," is a sublist of ",List),nl.

    sublist2(SubList,List) :-
        write(SubList," is not a sublist of ",List),nl.








