% File: c5_firbutter.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
order = 30;	fc =5;						% set filter parameters
fmax = 100;								% set max frequency
npts = 256;								% set number of samples
f = (0:(npts-1))*(fmax/(npts-1));		% frequency vector
nn = 2*npts;							% size ifft
H = zeros(1,nn);						% initialize vector
Ha = 1./(sqrt(1+(f/fc).^order));		% amplitude response
H = [Ha 0 fliplr(Ha(2:npts))];			% even amplitude response
[cimp_resp] = ifft(H,nn);				% complex impulse response
imp_resp = real(cimp_resp);				% take real part
aa = imp_resp(1:npts);					% time >= 0
bb = imp_resp((npts+1):nn);				% time < 0
reimpulse = [bb aa];					% real and even imp. resp.
plot(reimpulse)							% plot result
% End of script file.