% File: c5_FIR_Filter_AMP_Delay.m      
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
function [h,times] = FIR_Filter_AMP_Delay (H,fs,n,fscale,fshift,dscale)
% This function returns the impulse response of an FIR filter
% h = row vector of impulse response values at t=times
% h is rotated to center the impulse response array at n/2*ts
% It is assumed that there is no 'constant delay' in the freq response given.
% H is an array of frequency response.
% 	Column 1 : Frequencies fk in ascending order
%              After translation and scaling frequencies must be -fs/2 < f < fs/2
% 	Column 2 : 20*log(|H(fk)|; 
%   Column 3:  group delay in units 1/frequency
%              (i.e if freq is given in Mhz, then delay should be in micro seconds)
%              Otherwise use dscale to adjust delay = delay/dscale
%              Ex: If delay is given in ns then delay in microsecs = delay ns/1000
%              Phase  reposne is obtained by integration delay from f = 0
%              Phase((k+1)df) = phase(kdf) + 2*pi* (fs/nfft)delay (kdf)
%                             =phase(kdf) + (2*pi*/nfft) (delay (kdf)/ts)                
% fscale and fshift: f = (f-fshift)/fscale
% fs : Sampling rate
% n: duration of the impulse response; The frequency response 
%    is resampled from (-fs/2)+df/2 to fs/2-df/2 using df = fs/n  
%
ts =1/fs; df = fs/n;
%
% Pick up the frequency, magnitude and phase response arrays
% Convert dbs to real magnitudes; Rescale frequencies
%
Hfreq=H(:,1); Hmag=H(:,2); Hdelay=H(:,3);
nn=max(size(Hmag)); Hreal=10.^(Hmag/20); 
Hfreq=(Hfreq-fshift)/fscale; Hdelay = Hdelay/dscale;
%
% Set up index array for frequenceis and times
%
index1=[0:1:(n/2)]; index2=[-(n/2)+1:1:-1]; index=[index1 index2]';
frequencies=(index*df); times=index*ts;
%                    
% Use shift fft function to change rotate the time indices
%
times=shift_ifft(times,n); 
%                     
% Freq array goes from [0, df, 2df, ...to fs/2 -fs/2+df,....-df]
% Time array goes from  0 to n/2*ts -ts to  - (n/2-1)ts 
% For interpolation purposes add two more entries at -fs/2 and fs/2
% to the frequency response data.
%
fmin=min(min(frequencies)); fmax=max(max(frequencies));
%
% Extend  freq and other arrays to cover from -fs/2 + df to fs/2 + df
%
Hfreq1 = Hfreq; Hreal1 = Hreal; Hdelay1 = Hdelay;
if fmin < Hfreq(1,1)   % If the lower end does not extend to -fs/2 add a point
    Hfreq1=[fmin;Hfreq];
    Hreal1=[1e-10;Hreal] ; 
    Hdelay1=[Hdelay(1,1);Hdelay];
end
if  fmax > Hfreq(nn,1)   % If the higher end does not extend to fs/2 add a point
    Hfreq1=[Hfreq1; fmax];
    Hreal1=[Hreal1;1e-10] ; 
    Hdelay1=[Hdelay1 ;Hdelay(nn,1)];
end                
%
% Interpolate the frequency response data and compute the complex
% transfer function mag*exp(i*phase)
% 
Hreal_interpolated = interp1(Hfreq1,Hreal1,frequencies);
Hdelay_interpolated = interp1(Hfreq1,Hdelay1,frequencies);
%  
% Integrate delay to  find phase response
%
sum=0.;
Hphase(1)=0.;                         % Phase at carrier freq = 0
for k = 2:(n/2)+1                     % Integrate from f > 0
    sum= sum -(Hdelay_interpolated(k,1)/ts)* (2*pi/n);
    Hphase(k,1) = sum;
end
sum=0.0;
for  k = n:-1:(n/2)+2                 % Integrate from f < 0
    sum = sum+(Hdelay_interpolated(k,1)/ts)* (2*pi/n);
    Hphase(k,1)=sum;
end
Hcomplex =Hreal_interpolated.*exp(i*Hphase); 
%                                                  
% Find the inverse fft and rotate it--------------------------
%
hh=ifft(Hcomplex); h=(shift_ifft(hh,n));
%                
% End of filter design and end of function file.