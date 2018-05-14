% File: c5_sqrcdemo.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
T = 1;								% symbol time
k = 10;								% samples per symbol
m = 4;								% delay
beta = 0.32;						% bandwidth factor
h = sqrc(T,k,m,beta);				% impulse response
in = zeros(1,101); in(11) = 1;	    % input
out = conv(in,h);					% output h[10]
out1 = conv(out,h);					% conv of h[n-10] and h[n]
t = 2:0.1:8;						% time vector for plot
subplot(2,1,1)
stem(t,out(21:81),'.')				% plot h[n-10]
grid
xlabel('Time')
ylabel('h[n-1]')
subplot(2,1,2)
t = 6:0.1:12;						% time vector for plot
stem(t,out1(61:121),'.')			% plot conv of h[n-10] and h[n]
grid
xlabel('Time')
ylabel('conv(h[n-1],h[n])')
% End of script file.