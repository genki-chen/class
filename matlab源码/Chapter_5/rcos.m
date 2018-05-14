% File: rcos.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
function h=rcos(k,m,beta)
% k - samples per symbol
% m - delay is mT
% beta - bandwidth factor
%
beta = beta;
n = 0:2*m*k;
z = (n/k)-m+eps;
t1 = cos(beta*pi*z);
t2 = sin(pi*z)./(pi*z);
t3 = 1-4*beta*beta*z.*z;
h = t2.*t1./(t3);
% End of function file.