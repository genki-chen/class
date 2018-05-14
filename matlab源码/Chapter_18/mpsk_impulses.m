% File: mpsk_impulses.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
function [x] = mpsk_impulses(M,nsymbols,nsamples)
% This function generates a random complex MPSK impulse sequence  
% nsymbols in length. Each symbol is sampled at a rate of nsamples/bit.
% All samples except the "middle" sample within a symbol interval are zero.
u = rand(1,nsymbols);
rinteger = round((M*u)+0.5);
phase = pi/M+((rinteger-1)*(2*pi/M));
x = zeros(1,nsymbols*nsamples);
for m=1:nsymbols
   index = (m-1)*nsamples + round(nsamples/2);
   x(1,index) = exp(i*phase(m));
end
% End of function file.
