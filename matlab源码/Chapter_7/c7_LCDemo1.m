% File: c7_LCDemo1.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
m = 2048; c = 1; seed = 1;				% default values of m and c
a1 = 65; a2 = 1229;						% multiplier values
ix1 = seed; ix2 = seed;					% initialize algorithm
x1 = zeros(1,m); x2 = zeros(1,m);	    % initialize arrays
for i=1:m
   ix1 = rem((ix1*a1+c),m);
   x1(i) = ix1/m;
   ix2 = rem((ix2*a2+c),m);
   x2(i) = ix2/m;
end
subplot(1,2,1)
y1 = [x1(1,2:m),x1(1,1)];
plot(x1,y1,'.')							% plot results for a1
subplot(1,2,2)
y2 = [x2(1,2:m),x2(1,1)];
plot(x2,y2,'.')							% plot results for a2
% End of script file.
