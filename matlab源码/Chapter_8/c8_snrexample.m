% File: c8_snrexample.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
kpts = 1024;						% FFT Block size
k = 1:kpts;							% sample index vector
fd = 2;								% desired signal frequency
fi = 8;								% interference frequency
Ax = 80; Ayd = 20; Ayi =4;		    % amplitudes
phase = pi/4;						% phase shift
nstd = 0.8;							% noise standard deviation
%
% program
%
theta = 2*pi*k/kpts;				% phase vector
x = Ax*sin(fd*theta);			    % desired signal
yd = Ayd*sin(fd*theta-pi/4);    	% desired signal at receiver input
yi = Ayi*sin(fi*theta);			    % interference
noise = nstd*randn(1,kpts);	        % noise at receiver input
yy = yd+yi+noise;					% receiver input
[gain,delay,px,py,rxy,rho,snrdb] = snrmse(x,yy);
%
% display results
%
cpx = ['The value of Px is ',num2str(px),'.'];
cpy = ['The value of Py is ',num2str(py),'.'];
cgain = ['The value  gain is ',num2str(gain),'.'];
cdel = ['The value of delay is ',num2str(delay),'.'];
csnrdb = ['The value of SNR is ',num2str(snrdb),' dB.'];
disp(' ')							% insert blank line
disp(cpx)
disp(cpy)
disp(cgain)
disp(cdel)
disp(csnrdb)
% End of script file.