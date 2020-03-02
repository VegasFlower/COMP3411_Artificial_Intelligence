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
    sumsq_even(Tail, current),
    sum is current.


% Question 1.2: List Processing

log_table([], []).

log_table([Head|Tail], [[Head, Log]|Result]) :-
log_table(Tail, Result), Log is log(Head).