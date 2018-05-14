% File: c12_example2.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
% This example implements both Lowpass and  bandpass versions of a 
% power series nonlinearity of the form  y(t) = x(t) - a3*x(t)^3
% For the BP Model f1=11Hz; f2=14Hz; IM @ 8 and 17 Hz 3rd harmonics at  33 and 42
%
% For the LPE model the ref freq is :f0 =10Hz and  hence f1=-1  and f2=2 Hz; IM @  -4 and 5Hz
% Input parameters: None; Plots: BP input; BP output; LPE input; LPE Output 
f1=11.0; f2=14.0; ts=1.0/128; n=1024; a3=0.3;
% Generate input samples
for k=1:n
	t(k) = (k-1)*ts;
	x(k) = cos(2*pi*f1*t(k))+0.707*cos(2*pi*f2*t(k));
end
% Generate output samples
for k=1:n
	y(k) = x(k)-a3*x(k)^3;
end
% Plot the results
[psdx,freq] = log_psd(x,n,ts); [psdy,freq] = log_psd(y,n,ts);
subplot(2,1,1)
plot(freq,psdx,'b'); grid; 
ylabel('PSD in dB')
title('BP Input @ f1 = 11 and f2=14');
subplot(2,1,2)
plot(freq,psdy,'b'); grid;  
xlabel('Frequency in Hz')
ylabel('PSD in dB')
title('BP output: IM  @ 8 and 17 and Third harmonics')
%
% This  Section of the model implements the LPE model for the 3-rd order 
% power series nonlinearity. Baseband model: y(t) = x(t) - a3*x(t)^3.
% LPE Model: y(k)=x(k)+0.75*a3*(abs(x(k))^2)*x(k);
%
% Generate LPE of the input signals using 12Hz as the ref frequency
% and generate output samples using the LPE model
%
f1=-1.0;  f2=2.0; 
for k=1:n
   t(k) = (k-1)*ts;
	x(k) = exp(i*2*pi*f1*t(k))+0.707*exp(i*2*pi*f2*t(k));
	y(k) = x(k)+0.75*a3*(abs(x(k))^2)*x(k);
end
% Plot the results
[psdx,freq] = log_psd(x,n,ts); [psdy,freq] = log_psd(y,n,ts);
figure;
subplot(2,1,1)
plot(freq,psdx); grid; 
ylabel('PSD in dB')
title('LP Equivalent input; f0=12; f1=-1 and f2 = 2');
subplot(2,1,2)
plot(freq,psdy); grid;
xlabel('Frequency in Hz')
ylabel('PSD in dB')
title('LP  Output  IM at 2f1-f2= -4 and 2f2-f1 =5')
% End of script file.