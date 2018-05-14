% File c7_LCGperiod.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
a = input('Enter multiplier a > ');
c = input('Enter offset c > ');
m = input('Enter modulus m > ');
seed = input('Enter seed > '); 
n=1; ix = rem((seed*a+c),m);
while  (ix~=seed)&(n<m+2) 
   n = n+1; ix = rem((ix*a+c),m);
end
if n>m
   disp('Caught in a loop.')
else
   text = ['The period is ',num2str(n,15),'.'];
   disp(text)
end
% End of script file.


