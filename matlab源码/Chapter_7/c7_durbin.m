% File: c7_Durbin
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
function D = durbin(x)
N = length(x);							% length of input vector
y = x-mean(x);							% remove dc
ydiff = y(2:N)-y(1:(N-1));				% numerator summand
Num = sum(ydiff.*ydiff);				% numerator factor of D 
Den = sum(y.*y);						% denominator factor of D
D = Num/Den;							% Durbin factor
% End of function file.
