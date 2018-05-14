% File c8_convcode.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
zdB = 2:0.1:10;						% set Eb/No axis in dB
z = 10.^(zdB/10);					% convert to linear scale
puc = Q(sqrt(2*z));					% uncoded BER
W = exp(-z/2);
Num = W.^5; 
Den = 1-4*W+4*W.*W;
ps = 0.5*Num./Den;
semilogy(zdB,puc,'-.',zdB,ps)
grid
legend('uncoded','coded')
xlabel('E_b/N_o in dB')				% label x axis
ylabel('Bit Error Probability')		% label y axis
% End of script file.