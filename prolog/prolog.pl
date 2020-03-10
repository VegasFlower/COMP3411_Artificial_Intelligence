% Tong Zheng
% z5142003

% Question 1.1: List Processing

sumsq_even([],0).

sumsq_even([Head | Tail], sum):-
    0 is Head mod 2,
    sumsq_even(Tail, current),
    sum is Head*Head + current.

sumsq_even([Head | Tail], sum):-
    not (0 is Head mod 2),
    sumsq_even(Tail, sum).



% Question 1.2: List Processing

log_table([], []).

log_table([Head|Tail], [[Head, Log]|Result]) :-
    log_table(Tail, Result),
    Log is log(Head).



% Question 1.3: List Processing

conc([], X, X).
conc([A|B], C, [A|D]) :- conc(B, C, D).

create_new_list(Item, [], [[Item]]) :- !.
create_new_list(Item, [[Head|Tail1]|Tail2], Result) :- Head mod 2 =:= Item mod 2,
    conc([Item], [Head|Tail1], New),
    conc([New], Tail2, Result), !.
create_new_list(Item, [[Head|Tail1]|Tail2], Result) :- Head mod 2 =\= Item mod 2,
    conc([[Head|Tail1]], Tail2, List),
    conc([[Item]], List, Result).

paruns([], []) :- !.
paruns([Head|Tail], Result) :- paruns(Tail, Return), create_new_list(Head, Return, Result).