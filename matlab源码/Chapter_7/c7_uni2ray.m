% File: c7_uni2ray
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
clear all								% be safe
n = input('Enter number of points > ');
varR = 3;								% set pdf parameter
u = rand(1,n);							% generate U
y_exp = sqrt(-2*varR*log(u));		    % transformation
[N_samp,r] = hist(y_exp,20);		    % get histogram parameters
subplot(2,1,1)
bar(r,N_samp,1)						    % plot histogram
ylabel('Number of Samples')
xlabel('Independent Variable - x')
subplot(2,1,2)
term1 = r.*r/2/varR;					% exponent
ray = (r/varR).*exp(-term1);		    % Rayleigh pdf
del_r = r(3)-r(2);					    % determine bin width
p_hist = N_samp/n/del_r;			    % probability from histogram
plot(r,ray,'k',r,p_hist,'ok')		    % compare results
ylabel('Probability Density')
xlabel('Independent Variable - x')
legend('true pdf','samples from histogram',1)
% End of script file.