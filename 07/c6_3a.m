%/*************************************************************************
% > File Name: c6_3a.m
% > Author: genki_chen
% > Mail: genki_chen@aliyun.com 
% > Created Time: 2017/11/25 10:23:31
% ************************************************************************/



w2b=0; w2c=0; s5=0; phivco=0;				%initialize
twopi=2*pi;									% define 2*pi
twofs=2*fs;									% define 2*fs
G=2*pi*fn*(zeta+sqrt(zeta*zeta-lambda));	% set loop gain
a=2*pi*fn/(zeta+sqrt(zeta*zeta-lambda));	% set filter parameter
a1=a*(1-lambda); a2 = a*lambda;				% define constants
phierror = zeros(1,npts);	  				% initialize vector
fvco=zeros(1,npts);							% initialize vector
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
freqerror=fin-fvco;								% build frequency error vector


c6_3c