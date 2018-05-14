% File: c7_flicker.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
f = 0:100;						% frequency points
fn = 100;						% Nyquist rate
F = f/fn;						% frequency vector
M = abs(10./sqrt(f));			% normalized fequency response
M = [zeros(1,6),M(6:100)];		% bound from zero frequency
[b1,a1] = yulewalk(3,F,M);		% generate order=3 filter
[b2,a2] = yulewalk(20,F,M);		% generate order=20 filter
[h1,w1] = freqz(b1,a1);			% generate 3-rd order H(f)
[h2,w2] = freqz(b2,a2);			% generate 20-th order H(f)
subplot(2,1,1)
plot(F,M,':',w1/pi,abs(h1))
xlabel('Normalized Frequency')
ylabel('Magnitude Response')
subplot(2,1,2)
plot(F,M,':',w2/pi,abs(h2))
xlabel('Normalized Frequency')
ylabel('Magnitude Response')
%End of script file.