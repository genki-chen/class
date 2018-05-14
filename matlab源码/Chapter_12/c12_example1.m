% File: c12_example1.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
x = 0.1:0.1:2;						% input power vector
n = length(x);						% length of x
backoff = 0.0;						% backoff
y = salehs_model(x,backoff,n);	    % nonlinearity model
subplot(2,1,1)
pin = 10*log10(abs(x));				% input power in dB
pout = 10*log10(abs(y));			% output power in dB
plot(pin,pout); grid;
xlabel('Input power - dB')
ylabel('Output power - dB')
subplot(2,1,2)
plot(pin,(180/pi)*unwrap(angle(y))); grid;
xlabel('Input power - dB')
ylabel('Phase shift - degrees')
% End of script file.