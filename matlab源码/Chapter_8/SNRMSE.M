% File: snrmse.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
function [gain,delay,px,py,rxy,rho,snrdb] = snrmse(x,y)
ln = length(x);                 % Set length of the reference (x) vector
fx = fft(x,ln);                 % FFT the reference (x) vector
fy = fft(y,ln);                 % FFT the measurement (y) vector
fxconj = conj(fx);              % Conjugate the FFT of the reference vector
sxy = fy .* fxconj;             % Determine the cross PSD 
rxy = ifft(sxy,ln);             % Determine the cross correlation function
rxy = real(rxy)/ln;             % Take the real part and scale
px = x*x'/ln;                   % Determine power in reference vector
py = y*y'/ln;                   % Determine power in measurement vector
[rxymax,j] = max(rxy);          % Find the max of the crosscorrelation
gain = rxymax/px;               % Here's the gain
delay = j-1;                    % Here's the delay
rxy2 = rxymax*rxymax;           % Square rxymax for later use
rho = rxymax/sqrt(px*py);       % Here's the correlation coefficient
snr = rxy2/(px*py-rxy2);        % Here's the snr
snrdb = 10*log10(snr);          % Here's the snr in db
% End of script file.