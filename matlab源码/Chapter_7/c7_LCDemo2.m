% File: c7_LCDemo2
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
m = 2048; c = 1; seed = 1;
a1 = 65; a2 = 1229;
ix1 = 1; ix2 = 1;
x1 = zeros(1,m); x2 = zeros(1,m);
for i=1:m
   ix1 = rem((ix1*a1+c),m);
   x1(i) = ix1;
   ix2 = rem((ix2*a2+c),m);
   x2(i) = ix2;
end
D1 = c7_Durbin(x1); D2 = c7_Durbin(x2); 	% calculate Durbin parameters
rho1 = 1-D1/2; rho2 = 1- D2/2;						% calculate correlation
text1 = ['The value of D1 is ',num2str(D1),' and rho1 is ',num2str(rho1),'.'];
text2 = ['The value of D2 is ',num2str(D2),' and rho2 is ',num2str(rho2),'.'];   
disp(text1)
disp(text2)
% End of script file.
