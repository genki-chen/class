% File: delayr1.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
function [xout]=delayr1(xin,ndelay)
n = max(max(size(xin)));
if (ndelay==0)
   xout=xin;
else
   xx = zeros(1,ndelay); 
   xout = [xx xin(1,1:n-ndelay)];
end
% End of function file.