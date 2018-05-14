% File: erlanb_b.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
function erb = erlang_b(A,c)
% A = offered traffic in Erlangs.
% c = number of truncked channels.
num = A^c;
sum = 0;
for k=0:c
   kfact = prod(1:k);
   term = (A^k)/kfact;
   sum =sum + term;
end
cfact = prod(1:c);
den = cfact*sum;
erb = num/den;
% End of function file.