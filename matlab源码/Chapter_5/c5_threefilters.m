% File: c5_threefilters.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
T = 0.01;
f = 0:0.1:50;
z = exp(-i*2*pi*f*T);                           % see (5.4)
a0 = 0.239057; a1 = 0.239057; b1 = 0.521886;    % bilinear invariant
num = a0+a1*z;
den = 1-b1*z;
ampx = abs(num./den);
a0 = 0.628319; b1 = 0.533488;				    % impulse invariant
num = a0;
den = 1-b1*z;
ampy = abs(num./den);
a0 = 1.0; a1 = 0.533488; b1 = 0.533488;		    % step invriant	
num = (a0-a1)*z;
den = 1-b1*z;
ampz = abs(num./den);
plot(f,ampx,f,ampy,f,ampz)
xlabel('Frequency - Hz')
ylabel('Amplitude Response')
% End of script file.