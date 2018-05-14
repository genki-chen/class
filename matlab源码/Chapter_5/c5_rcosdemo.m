% File: c5_rcosdemo.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
k = 10;								% samples per symbol
m = 4;								% delay
beta = 0.32;						% bandwidth factor
h = rcos(k,m,beta);					% impulse response
in = zeros(1,101); in(11) = 1;	    % input
out = conv(in,h);					% output
t = 0:0.1:10;						% time vector for plot
stem(t,out(1:101),'.')				% plot output
grid
xlabel('Time')
ylabel('Amplitude')
% End of script file.