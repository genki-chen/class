% File: pll2sin.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
w2b=0; w2c=0; s5=0; phivco=0;				%initialize
twopi=2*pi;									% define 2*pi
twofs=2*fs;									% define 2*fs
G=2*pi*fn*(zeta+sqrt(zeta*zeta-lambda));	% set loop gain
a=2*pi*fn/(zeta+sqrt(zeta*zeta-lambda));	% set filter parameter
a1=a*(1-lambda); a2 = a*lambda;				% define constants
phierror = zeros(1,npts);	  				% initialize vector
fvco=zeros(1,npts);							% initialize vector
%
% beginning of simulation loop
%
for i=1:npts
        s1=phin(i) - phivco;				% phase error
        s2=sin(s1);	                        % sinusoidal phase detector
        s3=G*s2;
        s4=a1*s3;
        s4a=s4-a2*s5;                   	% loop filter integrator input
        w1b=s4a+w2b;						% filter integrator (step 1)
        w2b=s4a+w1b;						% filter integrator (step 2)							
        s5=w1b/twofs;						% generate fiter output
        s6=s3+s5;                       	% VCO integrator input
        w1c=s6+w2c;							% VCO integrator (step 1)
        w2c=s6+w1c;							% VCO integrator (step 2)
        phivco=w1c/twofs;					% generate VCO output
        phierror(i)=s1;						% build phase error vector
        fvco(i)=s6/twopi;					% build VCO input vector
end
%
% end of simulation loop
%
freqerror=fin-fvco;								% build frequency error vector
% End of script file.
