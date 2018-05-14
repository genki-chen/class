% File: c18_cdmaex1.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
N = input('Enter number of symbols to be processed > ');
EoN = input('Enter Eb/No vector > ');
KdB = input('Enter KfatordB vector > ');
SF = 7;
NumInterferers = 0;
MPathDelay = [0 3 4];
len_EoN = length(EoN);
len_KdB = length(KdB);
BER = zeros(len_KdB,len_EoN);
for i=1:len_KdB
   KfactordB = KdB(i);
   for j=1:len_EoN
      EbNo = EoN(j);
      [BER(i,j),ErrorRun] = c18_cdmasim(N,SF,EbNo,NumInterferers,MPathDelay,KfactordB);
      display = ['KfactordB = ',num2str(KfactordB),'  Eb/No = ',num2str(EbNo),'.'];
      disp(display)
   end
end
semilogy(EoN,BER)
xlabel('E_b/N_0 in dB')
ylabel('Probability of Symbol Error')
grid
% End of script file.