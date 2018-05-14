% File: c5_FIRFilterExample.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
fscale=1; fshift=0.0; dscale = 1000;                   	% scaling parameters
c5_Filter_Data;											% load data
Freq_Resp = data; fs = 900; filtsize = 512; ts = 1/fs;
[himp time] = FIR_Filter_AMP_Delay(Freq_Resp,fs,filtsize,fscale,fshift,dscale); 
%
% Apply a window
%    
nw = 256; window1 = hamming(nw); window = zeros(filtsize,1);
%
% Make sure the window is centered properly.
%
wstart = (filtsize/2)-(nw/2); wend = (filtsize/2)+(nw/2)-1;  
window(wstart:wend) = window1;
impw = himp.*window';
%    
figure; subplot(1,2,1); plot(abs(himp)); grid;
xlabel('Time Sample Index'); ylabel('Filter Impulse Response');
subplot(1,2,2); plot(abs(impw)); grid;
xlabel('Time Sample Index'); ylabel('Windowed Filter Impulse Response');
[logpsd,freq,ptotal,pmax] = log_psd(himp,filtsize,ts);
[logpsdw,freq,ptotal,pmax] = log_psd(impw,filtsize,ts);
figure; subplot(1,2,1)
plot(freq(128:384),logpsd(128:384)); grid;
xlabel('Frequency Sample Index'); ylabel('Frequency Response');
subplot(1,2,2)
plot(freq(128:384),logpsdw(128:384)); grid; 
xlabel('Frequency Sample Index'); ylabel('Windowed Frequency Response');
% End of script file.    
