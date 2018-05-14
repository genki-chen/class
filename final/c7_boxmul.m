% File: c7_boxmul.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
function [out1,out2]=c7_boxmul(N)
No1 = 1;                                  %这里改学号
No2 = 6;
u1 = rand(1,N);						% generate first uniform RV
u2 = rand(1,N);						% generate second uniform RV
ray1 = sqrt(-2*No1*No1*log(u1));       % generate Rayleigh RV
ray2 = sqrt(-2*No2*No2*log(u1));       % generate Rayleigh RV
out1 = ray1.*cos(2*pi*u2);			% first Gaussian output
out2 = ray2.*sin(2*pi*u2);			% second Gaussian output
% End of function file.