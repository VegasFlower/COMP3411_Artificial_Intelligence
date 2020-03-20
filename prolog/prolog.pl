% Tong Zheng
% z5142003

% Question 1.1: List Processing

sumsq_even([],0).
% base situation
sumsq_even([Head|Tail], Sum) :-
% head is multiples of two
	0 is Head mod 2,
	sumsq_even(Tail, Return), 
	Sum is Return + Head * Head.
sumsq_even([Head|Tail], Sum):-
% head is not multiples of two
    not(0 is Head mod 2),
    sumsq_even(Tail, Sum).


% Question 1.2: List Processing

log_table([], []).
% base situation when iempty list is given
log_table([Head|Tail], [[Head, Log]|Result]):-
    log_table(Tail, Result),
    Log is log(Head).



% Question 1.3: List Processing
conc([], X, X).
conc([A|B], C, [A|D]) :- conc(B, C, D).
create_new_list(Num, [], [[Num]]):-!.

create_new_list(Num, [[Head|Tail1]|Tail2], Result):-
% same property
    Head mod 2 =:= Num mod 2,
% add the number to the existing list in the most front
    conc([Num], [Head|Tail1], New),
    conc([New], Tail2, Result), !.
create_new_list(Num, [[Head|Tail1]|Tail2], Result):-
% different property
    Head mod 2 =\= Num mod 2,
% create a new list for the number and put the list in the result lists as the newest most front list
    conc([[Head|Tail1]], Tail2, List),
    conc([[Num]], List, Result).
paruns([], []):- !.
paruns([Head|Tail], Result):-
paruns(Tail, Return),
create_new_list(Head, Return, Result).


% Question 1.4: Prolog Terms
% nest with addition
eval(add(X, Y), Return):-    
    eval(X, EvalX), eval(Y, EvalY),
    Return is EvalX + EvalY.
% nest with substraction
eval(sub(X, Y), Return):-
    eval(X, EvalX), eval(Y, EvalY),
    Return is EvalX - EvalY.
% nest with mutiplication
eval(mul(X, Y), Return):-
    eval(X, EvalX), eval(Y, EvalY),
    Return is EvalX * EvalY.
% nest with division
eval(div(X, Y), Return):-
    eval(X, EvalX), eval(Y, EvalY),
    Return is EvalX / EvalY.
eval(X,Y):-
    X=Y.