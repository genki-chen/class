% File: c8_cerdemo.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
zdB = 0:0.1:10;						    % set Eb/No axis in dB
z = 10.^(zdB/10);						% convert to linear scale
ber1 = q(sqrt(2*z));					% PSK result
ber2 = q(sqrt(12*2*z/23));				% CSER for (23,12) Golay code
ber3 = q(sqrt(11*z*2/15));				% CSER for (15,11) Hamming code
berg = cer2ber(2,23,7,3,ber2);			% BER for Golay code 
berh = cer2ber(2,15,3,1,ber3);			% BER for Hamming code
semilogy(zdB,ber1,zdB,berg,zdB,berh)	% plot results
xlabel('E_b/N_o in dB')					% label x axis
ylabel('Bit Error Probability')			% label y axis
% End of script file.