% File: c15_intervals1.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
function  [] = c15_Intervals1(r1);
start = find(r1(2,:)==0);                          % index of first error free interval
maxLength_1 = max(r1(1,start(1):2:length(r1)));    % maximum length of the interval
interval_1 = r1(1,start(1):2:length(r1));          % get the intervals   
for i = 1:maxLength_1
    rec_1(i) =  length(find(interval_1>=i));       %record the intervals        
end
int1out = rec_1/max(rec_1);
figure;
plot(1:maxLength_1,int1out)
grid;
ylabel('Pr(0m|1)');
xlabel('Length of intervals m');
% End of function file.