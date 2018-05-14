% File: c3_mparameters.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
format long	e	% display full percision
a = ['The value of isieee is ',num2str(isieee),'.'];
b = ['The value of eps is ',num2str(eps,15),'.'];
c = ['The value of realmax is ',num2str(realmax,15),'.'];
d = ['The value of realmin is ',num2str(realmin,15),'.'];
disp(a)			% display isieee
disp(b)			% display eps	
disp(c)			% display realmax
disp(d)			% display realmin
format short	% restore default format
% End script file.   