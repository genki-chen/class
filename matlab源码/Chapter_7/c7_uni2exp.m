% File: c7_uni2exp
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
clear all								% be safe
n = input('Enter number of points > ');
b = 3;									% set pdf parameter
u = rand(1,n);							% generate U
y_exp = -log(u)/b;					    % transformation
[N_samp,x] = hist(y_exp,20);		    % get histogram parameters
subplot(2,1,1)
bar(x,N_samp,1)						    % plot histogram
ylabel('Number of Samples')
xlabel('Independent Variable - x')
subplot(2,1,2)
y = b*exp(-3*x);						% calculate pdf
del_x = x(3)-x(2);					    % determine bin width
p_hist = N_samp/n/del_x;			    % probability from histogram
plot(x,y,'k',x,p_hist,'ok')				% compare
ylabel('Probability Density')
xlabel('Independent Variable - x')
legend('true pdf','samples from histogram',1)
% End of script file.