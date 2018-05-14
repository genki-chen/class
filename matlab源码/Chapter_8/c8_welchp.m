% File: c8_welchp.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
fs = 16;
x = random_binary(1024,fs)+i*random_binary(1024,fs);
for nwin=1:4
   nwindow = nwin*1024;
   [pxx,f] = pwelch(x,nwindow,[],[],fs);
   pxx = pxx/sum(sum(pxx));
   n2 = length(f)/2;
   pxxdB = 10*log10(pxx/pxx(1));
   ptheory = sin(pi*f+eps)./(pi*f+eps);
   ptheory = ptheory.*ptheory;
   ptheorydB = 10*log10(ptheory/ptheory(1));
   subplot(2,2,nwin)
   plot(f(1:n2),pxxdB(1:n2),f(1:n2),ptheorydB(1:n2))
   ylabel('PSD in dB')
   xx = ['window length = ',num2str(nwindow)];
   xlabel(xx)
   axis([0 8 -50, 10]); grid;
end   
% End of script file.
 