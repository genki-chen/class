function [fftx,freq] = linear_fft(x,n,ts)
y = zeros(1,n);
for k=1:n
	freq(k) =(k-1-(n/2))/(n*ts);
   y(k) = x(k)*((-1.0)^(k+1));
end;
fftx = fft(y)/n;
% End of function file.
