clf;
close;

clear all;
clc;

disp(' ')                       % insert blank line 
%fdel = input('Enter the size of the frequency step in Hertz > ');
fdel = 40;
%fn = input('Enter the loop natural frequency in Hertz > ');
fn = 10;
%lambda = input('Enter lambda, the relative pole offset > ');
lambda = 0.1;
%{
disp(' ')
disp('Accept default values:')
disp(' zeta = 1/sqrt(2) = 0.707,')
disp(' fs = 200*fn, and')
disp(' tstop = 1')
dtype = input('Enter y for yes or n for no  > ','s');
if dtype == 'y'
   zeta = 1/sqrt(2);
   fs = 200*fn;
   tstop = 1;
else           
zeta = input('Enter zeta, the loop damping factor > ');
fs = input('Enter the sampling frequency in Hertz > ');
tstop = input('Enter tstop, the simulation runtime > ');
end
%}

zeta = 1/sqrt(2);
   fs = input('Enter the sampling frequency in Hertz > ');
   tstop = 0.8;

npts = fs*tstop+1;              % number of simulation points
t = (0:(npts-1))/fs;            % default time vector
nsettle = fix(npts/10);         % set nsettle time as 0.1*npts
tsettle = nsettle/fs;           % set tsettle
fin = [zeros(1,nsettle),fdel*ones(1,npts-nsettle)];
phin = [zeros(1,nsettle),2*pi*fdel*t(1:(npts-nsettle))];
disp(' ')                       % insert blank line

c6_5a;