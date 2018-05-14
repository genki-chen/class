% File: sqrc_freq_nosinc.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
function [imp,impw] = sqrc_freq_nosinc(R,beta,nsamples,nsymbols)
% This function computes the impulse response of an SQRC
% filter using a frequency domain/ifft approach; It includes a 1/sinc;
% R = symbol rate;  0<beta<1
% nsamples = number of samples per symbol
% nsymbols = total duration of the impulse responce in symbols
% Number of points in the impulse response = nsymbols*nsamples
% R = 1; nsymbols = 16; nsamples = 32; beta = 0.25
%
n = nsamples*nsymbols; fs = R*nsamples; df = fs/n;
a = ((1-beta)*0.5*R); b = ((1+beta)*0.5*R);
%
% Fill up the transfer function array with zeros upto fs/2
% Compute and store the values of sqrc up to R
%
H = (zeros(1,n));
for k=1:(n/2)+1 
   f = (k-1)*df;
   if(beta==0)
      beta=0.0000001;
   end
   H(k) = cos((pi/(2*beta*R))*(f-a));
   if f < a   
      H(k) = 1;
   end
   if f>=b
      H(k) = 0;
   end
end
% 
% Fold the negative frequency components to [fs/2/to fs]
%
H((n/2)+2:1:n) = H((n/2):-1:2);
%
% Take inverse fft
%
[impc,time] = linear_fft(H,n,df);
imp = real(impc);
window = hanning(n)';
impw = imp.*window;
yy = sum(impw.^2);
impw = impw/(yy^0.5);
impw = impw/sqrt(nsamples);
yy = sum(imp.^2);
imp = imp/(yy^0.5);
imp = imp/sqrt(nsamples);
% End of function file.
