% File: c5_pmc.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
order = 50,								% points in impulse response	
f = [0 0.1 0.12 0.23 0.25 0.35 0.37 1];	% frequency points
amp = [1 1 0 0 1 1 0 0];				% amplitude response
b = remez(order,f,amp);					% synthesize filter
stem(b,'.k')							% plot impulse response
xlabel('Sample Index')					% label x axis
ylabel('Amplitude')						% label y axis
pause									% pause	
freqz(b,1)								% plot results
% End of script file.