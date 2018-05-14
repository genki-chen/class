% File: c7_boxmul.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
function [out1,out2]=c7_boxmul(N)
u1 = rand(1,N);						% generate first uniform RV
u2 = rand(1,N);						% generate second uniform RV
ray = sqrt(-2*log(u1));				% generate Rayleigh RV
out1 = ray.*cos(2*pi*u2);			% first Gaussian output
out2 = ray.*sin(2*pi*u2);			% second Gaussian output
% End of function file.