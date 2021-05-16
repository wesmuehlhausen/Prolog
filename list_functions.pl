
%----------------------------------------------------------------------
% Name: Wesley Muehlhausen
% File: list_functions.pl
% Date: Spring 2021
% Desc: File contains functions with list operations
%----------------------------------------------------------------------

%
% To run tests from command line use:
%   swipl -g run_tests -t halt list_functions.pl
%
% Alternatively, do:
%   swipl list_functions.pl
%   ?- run_tests.
%
% Note that after running swipl hw10c.pl from the command line, your
% source file is loaded into the interpreter and you can do basic
% tests there for debugging.
%


% 1: my_last
my_last(X,[X]). % for one element list...
my_last(X,[_|T]) :- my_last(X,T). % anything can be the head, continue with just the tail


% 2: my_init
my_init([_],[]).
my_init([X|T1],[X|T2]) :- my_init(T1,T2).


% 3: my_replace
my_replace(_,_,[],[]).
my_replace(X,Y,[N|T1],[N|T2]) :- N \= X, my_replace(X,Y,T1,T2). % if the head doesnt equal X, copy the same value
my_replace(X,Y,[X|T1],[Y|T2]) :- my_replace(X,Y,T1,T2). % if head does equal x, then head of right list = y


% 4: my_elem_sum
% my_elem_sum(_,[],_).
% my_elem_sum(X,[Y|T],S) :- X \= Y, my_elem_sum(X,T,S).
% my_elem_sum(X,[X|T],S) :- my_elem_sum(X,T,S+X).


% 5: my_min
my_min([Min],Min).             
my_min([H,X|T],M) :-
    H =< X,                             
    my_min([H|T],M).        
my_min([H,X|T],M) :-
    H > X,     
    my_min([X|T],M).           


%----------------------------------------------------------------------

:- begin_tests(all_tests).

% 1 Tests
test(my_last_1) :- my_last(1,[1]), !.
test(my_last_2) :- my_last(2,[1,2]), !.
test(my_last_3) :- my_last(3,[1,2,3]), !.
test(my_last_4) :- \+ my_last(_,[]), !.

% 2 Tests
test(my_init1) :- my_init([1,2,3,4,5],[1,2,3,4]), !.
test(my_init2) :- my_init([1,2,3],[1,2]), !.
test(my_init3) :- \+ my_init([],[1,2]), !.

% 3 Tests
test(repl1) :- my_replace(1,2,[1,2,3,4,1,6,7],[2,2,3,4,2,6,7]), !.
test(repl2) :- my_replace(5,3,[5,2,5,4,5,6,5],[3,2,3,4,3,6,3]), !.

% 5 Tests
test(min1) :- my_min([1,2,3,4,5],1), !.
test(min2) :- my_min([5,6,7,8,9],5), !.
test(min3) :- my_min([2,8,4,6,1],1), !.

:- end_tests(all_tests).


