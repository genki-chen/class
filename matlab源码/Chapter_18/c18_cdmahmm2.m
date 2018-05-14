% File: c18_cdmahmm2.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
load cdmadata1								% load data from c18_cdmahmm1
NN = 25000									% number of points to be used
[out] = c18_errvector(A_matrix,NN);	% generate error vector from HMM
%
% Compute and display three error probabilities.
%
pe2 = A_matrix^100;
pe2 = pe2(1,3);
pe3 = sum(out/NN);
a = ['The predicted error probabilities for the CDMA system:'];
b = ['   From the original simulation PE = ',num2str(BER),'.'];
c = ['   Predicted from the semi-Markov model PE = ',num2str(pe2),'.'];
d = ['   From the reconstructed error vector ',num2str(pe3),'.'];
%
disp(a)
disp(b)			% display PE from simulation
disp(c)			% display PE predicted from semi-Markov model
disp(d)			% display PE from reconstructed error vecor
save cdmadata2 out
% End of script file.