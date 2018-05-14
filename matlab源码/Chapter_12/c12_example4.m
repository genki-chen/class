% File: c12_example4.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
% This is an example of Saleh's LPE showing the effects of 
% AM to AM and AM to PM when the input is 16QAM
%
% Create input constellation
backoff = input('Enter backoff in dB > ');
N = 1024;							% number of points
x1 = 2*fix(4*rand(1,N))-3;		    % direct components
x2 = 2*fix(4*rand(1,N))-3;		    % quadrature components
y = x1+i*x2;						% signal space points
%
% Run it thru Saleh's model
z = salehs_model(y,-1*backoff,1024);
subplot(1,2,1)
plot(real(y),imag(y));grid; title('Input Constellation');
xlabel('direct'); ylabel('quadrature')
axis equal
subplot(1,2,2)
plot(real(z),imag(z));grid; title('Output Constellation');
xlabel('direct'); ylabel('quadrature')
axis equal
% End of script file.