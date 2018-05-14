% Program: c5_yw.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
order = 20,								% degree of polynomials
f = [0 0.2 0.22 0.28 0.3 0.4 0.42 0.48 0.5 0.6 0.62 1];	% frequency points
amp = [1 1 0 0 1 1 0 0 1 1 0 0];				% amplitude response
[b,a] = yulewalk(order,f,amp);			% synthesize filter
freqz(b,a)								% display results
% End of script file.