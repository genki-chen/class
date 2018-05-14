clc;
clear all;
close all;
n = 512; nn = 2*n;								
fd=10000;
fs = 0:fd/64:fd;                                
H = zeros(1,n);								
for k=1:(n/8+1)								
   jpsd(k)=(1-cos(pi*fs(k)/fd))^2;                
 H(k)=jpsd(k)^0.5;		   					       
end;	
for k=1:n										 
   H(n+k) = H(n+1-k);
end
[inv,time] = linear_fft(H,nn,fd/64);		            
imp = real(inv(450:577));						
impw = imp.*hanning(128)';						
energy = sum(impw.^2)
impw = impw/(energy^0.5);						
% End of function file.
ts = 1/(16*fd); 			                    
time = [1*ts:ts:128*ts];		                    
subplot(3,1,1)
stem(time,impw,'.'); grid 
xlabel('Time'); ylabel('Impulse Response')
% Square the fft and check the power transfer function.
[h f] = linear_fft(impw,128,ts);                   
subplot(3,1,2)
plot(f,abs(h.*h)); grid;
xlabel('Frequency'); ylabel('PSD')
%get the Rxx fuction 
Y=ifft(abs(h.*h),512);
Pyy=Y.*conj(Y)/512;
f =(0:256)/512;
subplot(3,1,3)
plot(f,Pyy(1:257));grid;
title('Frequency content of y')
xlabel('frequency (Hz)'); ylabel('Rxx');
