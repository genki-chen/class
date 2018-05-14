% File: c18_cdmahmm3.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
load cdmadata1						% load data from c18_cdmahmm1
load cdmadata2						% load data from c18_cdmahmm2
runcode2 = c15_seglength(out);
c15_intervals2(runcode1,runcode2)	% display intervals
%
% Build histograms.
%
aa1 = runcode1(1,:);
efd1 = aa1(1:2:length(aa1));
aa2 = runcode2(1,:);
efd2 = aa2(1:2:length(aa2));
figure
subplot(2,1,1)
[N,x] = hist(efd1,20);
%hist(efd1,x)
bar(x,N,1)
xlabel('Histogram Bin')
ylabel('Number of Samples')
subplot(2,1,2)
hist(efd2,x);
xlabel('Histogram Bin')
ylabel('Number of Samples')
% End of script file.