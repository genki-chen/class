%7-12例题相关
clear all
close all
clc
pntaps = [1 0 0 1 0 1 0 0 0 0 0 1];         % shift register taps
pninitial = [0 0 0 0 0 0 0 0 0 0 0 1 ];      % initial shift register state
pndata = zeros(1,4095);             % initialize output vector
samp_per_sym =8;                     % samples per symbol
pnregister = pninitial;             % initialize shift register
n = 0;                              % initialize counter
kk = 0;                             % set terminator indicator
while kk == 0
   n = n+1;                                  %   pndata(1,n) = pnregister(1,1);             % save output
   pndata(1,n) = pnregister(1,1);
   feedback = rem((pnregister*pntaps'),2);  % calculate feedback
   pnregister = [feedback,pnregister(1,1:11)];   % increment register
   if pnregister == pninitial; kk = 1; end      % reset termination
end
text = ['The period is ',num2str(n,15),'.'];
disp(text)                                  % display period
% pndata=replicate(pndata,samp_per_sym);      % replicate data
kn = n*samp_per_sym;%stem(pndata)                 % length of output vector   
pndata = 2*pndata - 1;                 % make output +/- one
% stem(pndata(1:101))
pp=pndata'*ones(1,samp_per_sym);
pp2=pp';
pp3=pp2(:)';
pndata=pp3;
stem(pndata(1:101))
a = fft(pndata);
b = a.*conj(a);                            % PSD of data
Rm = real(ifft(b))/kn;                % autocorrelation
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
