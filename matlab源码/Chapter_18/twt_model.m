% File: twt_model.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
function [y] = twt_model(x,twtdata,ibo)
% ibo is a negative value in db indicating the operating point
% ibo = -3db implies that the input POWER is attenuated by 1/2
% When the input power = pave, output power is maximum (=1)
% Normalized input power = (pinstantaneous/pave)*optn_real
%
pwrin = twtdata(:,1); pwrout = twtdata(:,2); phaseout = twtdata(:,3);
n = length(x); ibo_real = 10^(ibo/10);
%
% Find the average input power and the instantaneous input power
% Normalize the instantaneous input power by the average power.
%
instpwr = 0.5*(abs(x).^2); 
avepwr = mean(instpwr);
instpwr = instpwr*(ibo_real/avepwr);
%
% Compute output power and phase
% 
outpwr = interp1(pwrin,pwrout,instpwr);
outmag = sqrt(2*outpwr);
outphase = (pi/180)*interp1(pwrin,phaseout,instpwr); 
%
% Compute complex envelopw of the output
% 
y = outmag.*exp(sqrt(-1)*(outphase+angle(x))); 
% End of function file.