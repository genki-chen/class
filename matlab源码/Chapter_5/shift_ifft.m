% File: shift_ifft.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
function y = shift_ifft(x,n)
% Circular shift ifft array
for k=1:(n/2)-1
   y(k)=x((n/2)+k+1);
end
for k=1:n/2+1
   y((n/2)-1+k)=x(k);
end
% End of function file.
