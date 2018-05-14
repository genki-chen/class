% File: c8_PSDexample.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
settle = 100;						% ignore transient
fs = 1000;							% sampling frequency
N = 50000;							% size of data record
f = (0:(N-1))*fs/N;					% frequency scale
[b,a] = cheby1(5,5,0.1);			% filter
NN = N+settle;						% allow transient to die
in = randn(1,NN);					% random input
out = filter(b,a,in);				% filter output
out = out((settle+1):NN);			% strip off initial samples
window = hanning(N)';				% set window function			
winout = out.*window;				% windowed filter output
fout = abs(fft(winout,N)).^2;		% transform and square mag
U = sum(window.*window);			% window energy
f1out = fout/U;						% scale spectrum
psd1 = 10*log10(abs(f1out));		% log scale
subplot(2,1,1)
plot(f(1:5000),psd1(1:5000))
grid; axis([0 100 -70 10]);
xlabel('Frequency, Hz')
ylabel('PSD')
%
K = 25;								% number ofsegments 
M = N/K;							% block size
fK = (0:(M-1))*fs/M;				% frequency scale
d = zeros(1,M);						% initialize vector
psdk = zeros(1,M);					% initialize vector
window = hanning(M)';				% set window function
U = sum(window.*window);			% window energy
for k=1:K
   for j=1:M
      index = (k-1)*M+j;
      d(j) = out(index);
   end
   dwin = d.*window;
   psdk = (abs(fft(dwin,M)).^2)/U + psdk;
end
psd2 = 10*log10(psdk/K);
subplot(2,1,2)
plot(fK(1:250),psd2(1:250))
grid; axis([0 100 -70 10]);
xlabel('Frequency, Hz')
ylabel('PSD')
% End of script file.