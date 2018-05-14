% File: c18_cdmacal.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
N = input('Enter number of symbols to be processed > ');
EoN = input('Enter Eb/No vector > ');
SF = 7;
NumInterferers = 0;
MPathDelay = [0 3 4];
KfactordB = 100;
len_EoN = length(EoN);
BER = zeros(1,len_EoN);
h = waitbar(0,'Calibration Run');
for j=1:len_EoN
   EbNo = EoN(j);
   [BER(j),ErrorRun] = c18_cdmasim(N,SF,EbNo,NumInterferers,MPathDelay,KfactordB);
   waitbar(j/len_EoN)
end
close(h)
z = 10.^(EoN/10);
BERT = q(sqrt(2*z));
semilogy(EoN,BER,'+k',EoN,BERT,'-')
xlabel('E_b/N_0 in dB')
ylabel('Probability of Symbol Error')
grid
% End of script file.