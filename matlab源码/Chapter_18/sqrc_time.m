% File: sqrc_time.m 
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
function [imp,impw] = sqrc_time(R,beta,nsamples,nsymbols)
% This function provides the impulse response for 
% an FIR implementation of the sqrc filter
% ****** This version does not include a 1/sinc ******
% R is the symbol rate;  0<beta<1; beta is normalized by R/2
% nsamples is the number of samples per symbol
% nsymboles is the duration of the impulse response in symbols
% Impulse response extends from -nsymbols/2 to +nsymbols/2
%
beta = beta*(R/2);
a = R+(2*beta);		b = R-(2*beta);
length1 = fix(nsamples*nsymbols/2);
ts = (1/R)/nsamples;
time = [-length1*ts:ts:(length1-1)*ts] + 0.00000013;
n = length(time); w = hanning(n);  
term1 = a*pi*time; term2 = b*pi*time;  
cos1 = cos(a*pi*time); sin1 = sin(b*pi*time);  
denominator = (pi*sqrt(R))*((1-((8*beta*time).^2)));  
for k=1:n
   numerator = (8*beta*(cos1(k)))+(sin1(k)/time(k));
   if(denominator(k)==0)
      imp(k) = 1;
   else
      imp(k) = numerator/denominator(k);
   end
   impw(k) = imp(k)*w(k);
end   
yy = sum(impw.^2);
impw = impw/(yy^0.5);
impw = impw/sqrt(nsamples);
yy = sum(imp.^2);
imp = imp/(yy^0.5);
imp = imp/sqrt(nsamples);
% End of function file.
