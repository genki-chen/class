% File: c5_ellipexam.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
fs = 10000;								% set sampling frequency
fc = 30;								% set cuttoff frequency
f = 0:0.1:50;							% define frequency vector
[b,a] = ellip(6,1,20,2*pi*fc,'s');	    % synthesize elliptic filter
h = freqs(b,a,2*pi*f);					% amp. resp. of analog filter
[bz1,az1] = impinvar(b,a,fs);			% impulse invariant digital filter
h1 = freqz(bz1,az1,f,fs);				% amplitude response of above
[bz2,az2] = bilinear(b,a,fs);			% bilinear z filter (not prewarped)
h2 = freqz(bz2,az2,f,fs);				% amplitude response of above
[bz3,az3] = bilinear(b,a,fs,fc);		% bilinear z filter (prewarped)
h3 = freqz(bz3,az3,f,fs);				% amplitude response of above
subplot(211)							% subplot 1
plot(f,abs(h),f,abs(h1))				% plot
xlabel('Frequency - Hz')				% label x axis
ylabel('Amplitude Response')			% label y axis
subplot(212)							% subplot 2
plot(f,abs(h2),f,abs(h3))				% plot
xlabel('Frequency - Hz')				% label x axis
ylabel('Amplitude Response')			% label y axis
% End of script file.