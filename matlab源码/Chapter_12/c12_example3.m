% File: c12_example3.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
% This is an example of the response of Saleh's LPE model 
% showing the IM products when the input is the sum of two tones.
backoff = input('Enter backoff in dB > ');
f1 = -1.0; f2 = 2.0; ts = 1.0/128; n = 1024;  
for k=1:n
   t(k) = (k-1)*ts;
   x(k) = exp(i*2*pi*f1*t(k))+0.707*exp(i*2*pi*f2*t(k));
   y(k) = salehs_model(x(k),-1*backoff,1);
end
[psdx,freq] = log_psd(x,n,ts);
[psdy,freq] = log_psd(y,n,ts);
subplot(2,1,1)
plot(freq,psdx); grid; title('Input to the NL');
ylabel('PSD in dB');
subplot(2,1,2)
plot(freq,psdy); grid; title('Output of the NL');
ylabel('PSD in dB'); xlabel('Frequency in Hz');
% End of script file.
