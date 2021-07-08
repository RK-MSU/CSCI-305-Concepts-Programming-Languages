% River Kelly
% Hallway Assignment
% CSCI 305
% Spring 2021
%
% Instructions:
% ----------------------------------------------------
% Hunter, Laura, Addiley , Ramey, and Arnie all live
% in the same dorm with five adjacent bedrooms.
%
% Rules:
%	- Hunter doesn’t sleep in the 5th bedroom
% 	- Laura doesn’t sleep in the first bedroom
% 	- Arnie doesn’t sleep in the first or last 
%	  bedroom, and he is not in an bedroom adjacent to
%	  Addiley or Laura
%	- Ramey sleeps in some bedroom higher than Laura’s
%
% Who sleeps in which bedrooms?
% ----------------------------------------------------

dorm([bedroom(_,5),bedroom(_,4),bedroom(_,3),bedroom(_,2),bedroom(_,1)]).

adjacent(A,B) :-
	((A =:= B+1) -> true ;	% check before adjacent
	((A =:= B-1) -> true ;	% check after adjacent
	false)).
	
layout(X) :- dorm(X),

	member(bedroom(hunter, A), X), 	% Hunter
	A\=5,							% not in the 5th bedroom

	member(bedroom(laura, B), X),	% Laura
	B\=1,							% not in the first bedroom

	member(bedroom(addiley, C), X), % Addiley - no conditions given

	member(bedroom(arnie, E), X),	% Arnie
	E\=1,							% not in the first room
	E\=5,							% not in the last room
	\+adjacent(E,B),
	\+adjacent(E,C),

	member(bedroom(ramey, D), X),	% Ramey 
	D>B.							% room higher that Laura

hallway(X) :- layout(X).
