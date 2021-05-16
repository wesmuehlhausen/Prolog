
%----------------------------------------------------------------------
% Name: Wesley Muehlhausen
% File: queries.pl
% Date: Spring 2021
% Desc: A number of Prolog queries to test out as well as some rules (6-8)
%----------------------------------------------------------------------

% Info:
% movies(M,Y) states that a movie M was released in year Y.
% director(M,D) states that a movie M was directed by a director D.
% actor(M,A,R) states that actor A played the role R in the movie M.
% actress(M,A,R) states that actress A played the role R in the movie M.


% 1: ... query to find movies that were released in 2006.
% movie(M,2006).

% 2: ... query to find movies that were released in the 1980s
% movie(M,Y), Y > 1979, Y < 1990.

% 3: ...  query to find directors of movies released in 1998
% director(M, D), movie(M, 1998).

% 4: ... query to find actors in a movie that they also directed
% actor(M,X,_), director(M, X).

% 5: ...  query to find movies in which Frances McDormand andd Holly Hunter were co-stars query to find movies in which Frances McDormand andd Holly Hunter were co-stars
% actress(M,frances_mcdormand,_), actress(M,holly_hunter,_).

% 6: ... rules forr a relation star(M,A) such that A is either an actor orr actress in movie M
:- consult('movies.pl').
star(M,A) :- actor(M,A,_).
star(M,A) :- actress(M,A,_).

% 7: ... a rule forr a relation co_star(A1,A2) such that A1 andd A2 were two different stars in the
% same move.
co_star(A,B) :- star(M,A), star(M,B), A \== B.

% 8: ... a rule forr a relation starred_2(A,Y) to find actresses andd actors that starred in 2
% different movies in the same year.
starred_2(A,Y) :- star(M1,A), star(M2,A), M1 \== M2, movie(M1,Y), movie(M2,Y).



