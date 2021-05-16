
%----------------------------------------------------------------------
% Name: Wesley Muehlhausen
% File: basic_functions.pl
% Date: Spring 2021
% Desc: Implementing Prolog functions to carry out various operations
%----------------------------------------------------------------------

%
% To run tests from command line use:
%   swipl -g run_tests -t halt basic_functions.pl
%
% Alternatively, do:
%   swipl basic_functions.pl
%   ?- run_tests.
%
% Note that after running swipl hw10b.pl from the command line, your
% source file is loaded into the interpreter and you can do basic
% tests there for debugging.
%


% 1: my_min  M is the minimum of X and Y
my_min(X,Y,X) :- X =< Y, write(X).
my_min(X,Y,Y) :- X > Y, write(Y).

% 2: my_median  where M is the median of the other three arguments
my_median(X,Y,Z,X) :- X > Y, X < Z.
my_median(X,Y,Z,X) :- X > Z, X < Y.
my_median(X,Y,Z,Y) :- Y > X, Y < Z.
my_median(X,Y,Z,Y) :- Y > Z, Y < X.
my_median(X,Y,Z,Z) :- Z > Y, Z < X.
my_median(X,Y,Z,Z) :- Z > X, Z < Y.


% 3: my_triangle_area Area given a base and height
my_triangle_area(Base,Height,Area) :- Area is Base*Height/2.


% 4: my_circle_area - circle area given a radius
my_circle_area(Radius,Area) :- Area is Radius*3.14*Radius.


% 5: my_midpoint - midpoint given a set of coordinates
my_midpoint((X1,Y1),(X2,Y2),(X3,Y3)) :- 
    X3 is ((X1+X2)/2), 
    Y3 is ((Y1+Y2)/2).


% 6: my_manhattan_distance - manhatton distance given two points
my_manhattan_distance((X1,Y1),(X2,Y2),D) :- D is abs(X1-X2) + abs(Y1-Y2).


% 7: my_euclidean_distance - euclidean distance given two points
my_euclidean_distance((X1,Y1),(X2,Y2),D) :- D is sqrt((X1-X2)*(X1-X2) + (Y1-Y2)*(Y1-Y2)).


% 8: my_range_sum - Find the sum of the range of numbers  x-y
my_range_sum(X,Y,S) :- 
    X < Y, 
    IncX is X + 1,
    my_range_sum(IncX,Y,TmpS),
    S is TmpS + X.  
my_range_sum(N,N,N).


% 9: my_gcd - greatest common denominator of two numbers
my_gcd(X,0,X). % base case y is zero so x value is gcd
my_gcd(X,Y,D):- 
    Y>0,             % if y > 0...
    TmpX is X mod Y, % set tmp to X mod Y 
    my_gcd(Y,TmpX,D).% call again with new values   


% 10: my_even and my_odd
    % my_even(N) :- X is mod(N,2), X=0. % faster version
    % my_odd(N) :- X is mod(N,2), X=1. % faster version
my_even(0).
my_even(N) :- 
    N > 1,
    X is N - 2,
    my_even(X).

my_odd(1).
my_odd(N) :-
    N > 2,
    X is N - 2,
    my_odd(X).


%----------------------------------------------------------------------
% UNIT TESTS
%----------------------------------------------------------------------

:- begin_tests(all_tests).

% 1 Tests
test(my_min_1) :- my_min(1,2,1), !.
test(my_min_2) :- my_min(2,1,1), !.
test(my_min_3) :- my_min(1,1,1), !.

% 2 Tests
test(m_med1) :- my_median(1,2,3,2), !.
test(m_med2) :- my_median(3,1,2,2), !.
test(m_med3) :- my_median(8,6,12,8), !.

% 3 Tests
test(tri1) :-  my_triangle_area(4,6,12), !.
test(tri2) :-  my_triangle_area(23,12,138), !.
test(tri3) :-  my_triangle_area(19,43,408.5), !.


% 4 Tests
test(cir1) :-  my_circle_area(5,78.5), !.
test(cir2) :-  my_circle_area(4,50.24), !.
test(cir3) :-  my_circle_area(19,1133.54), !.

% 5 Tests
test(midp1) :-  my_midpoint((1,1),(5,4),(3,2.5)), !.
test(midp2) :-  my_midpoint((23,12),(150,120),(86.5,66)), !.

% 6 Tests
test(man_dist1) :-  my_manhattan_distance((1,2),(5,7),9), !.
test(man_dist2) :-  my_manhattan_distance((12,27),(51,73),85), !.
test(man_dist3) :-  my_manhattan_distance((128,275),(512,731),840), !.

% 7 Tests
test(euc_dist1) :-  my_euclidean_distance((1,2),(5,7),6.4031242374328485), !.
test(euc_dist2) :-  my_euclidean_distance((12,27),(51,73),60.30754513325841), !.
test(euc_dist3) :-  my_euclidean_distance((128,275),(512,731),596.1476327219626), !.

% 8 Tests
test(rang_sum1) :-  my_range_sum(1,10,55), !.
test(rang_sum2) :-  my_range_sum(1,3,6), !.
test(rang_sum3) :-  my_range_sum(5,23,266), !.

% 9 Tests
test(gcd1) :-  my_gcd(54,65,1), !.
test(gcd2) :-  my_gcd(6,66,6), !.
test(gcd3) :-  my_gcd(125,95,5), !.

% 10 Tests
test(ev1) :-  my_even(2), !.
test(ev2) :-  my_even(6), !.
test(ev3) :-  my_even(12), !.
test(od1) :-  my_odd(1), !.
test(od2) :-  my_odd(3), !.
test(od3) :-  my_odd(13), !.


:- end_tests(all_tests).


