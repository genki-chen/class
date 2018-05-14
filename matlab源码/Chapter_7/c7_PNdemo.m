% File: c7_PNdemo.n
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
pntaps = [0 0 1 0 0 0 0 0 0 1];       	% shift register taps
pninitial = [0 0 0 0 0 0 0 0 0 1];    	% initial shift register state
pndata = zeros(1,1023);					% initialize output vector
samp_per_sym = 5;						% samples per symbol
pnregister = pninitial;					% initialize shift register
n = 0;									% initialize counter
kk = 0;									% set terminator indicator
while kk == 0
   n = n+1;										% increment counter
   pndata(1,n) = pnregister(1,1);				% save output
   feedback = rem((pnregister*pntaps'),2);		% calculate feedback
   pnregister = [feedback,pnregister(1,1:9)];	% increment register
   if pnregister == pninitial; kk = 1; end		% reset termination
end
text = ['The period is ',num2str(n,15),'.'];
disp(text)										% display period
pndata=replicate(pndata,samp_per_sym);			% replicate data
kn = n*samp_per_sym;							% length of output vector	
pndata = 2*pndata - 1;							% make output +/- one
a = fft(pndata);
b = a.*conj(a);									% PSD of data
Rm = real(ifft(b))/kn;							% autocorrelation
x1 = (0:length(Rm)-1)/samp_per_sym;
x2 = 0:100;
% Now we can plot the results.
subplot(3,1,1)
plot(x1,Rm,'.k'); ylabel('R[m]')
subplot(3,1,2)
stem(x2,Rm(1:101),'.k'); ylabel('Partial R[m]')
subplot(3,1,3)
stem(x2,pndata(1:101),'.k'); ylabel('First 100 outputs')
axis([0 100 -1.5 1.5]);
% End of script file.