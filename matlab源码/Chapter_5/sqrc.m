% File: sqrc.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
function h=sqrc(T,k,m,beta)
% T - symbol time
% k - samples per symbol
% m - delay is mT
% beta - bandwidth factor
%
n = 0:2*m*k;
z = (n/k)-m+eps;
t1 = cos((1+beta)*pi*z);
t2 = sin((1-beta)*pi*z);
t3 = 1./(4*beta*z);
den = 1-16*beta*beta*z.*z;
num = t1+t2.*t3;
c = 4*beta/(pi*sqrt(T));
h = c*num./den;
% End of function file.