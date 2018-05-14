% File: wilkinson.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
function [m_out,std_out] = wilkinson(m_x,std_x,r)
%
% This function computes the mean and standard deviation 
% of the sum of two lognormal RV's.
% Input and ouput values are in dB.
%
lambda = 0.1*log(10);
m_x_cmp = m_x;
v_x_cmp = std_x.^2;
m_y = lambda*m_x_cmp;
v_y = (lambda^2)*v_x_cmp;
u_1 = 0;
for i = 1:length(m_y)
   u_1 = u_1 + exp(m_y(i) + v_y(i)/2);
end
a = 0;
for i = 1:length(m_y)
   a = a + exp(2*m_y(i) + 2*v_y(i));
end
b = 0;
for i = 1:length(m_y)-1
   for j = i+1:length(m_y)
      b = b + exp( m_y(i) + m_y(j) )*...
          exp(0.5*(v_y(i) + v_y(j)  + ...
          2*r*sqrt(v_y(i))*sqrt(v_y(j))));
   end
end
u_2 = a + 2*b;
%
% mean and variance or the variable Z, which is normal in natural units
%
m_z = 2*log(u_1) - 0.5*log(u_2);
std_z = sqrt(log(u_2) - 2*log(u_1));
%
% mean and variance of the variable X, which is normal in dB.
%
g = 10*log10(exp(1));
m_out = g*m_z;
std_out = g*std_z;
% End of function file.
