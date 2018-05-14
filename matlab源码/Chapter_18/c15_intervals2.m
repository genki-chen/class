% File: c15_intervals2.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
function  [] = c15_intervals2(r1,r2);
start1 = find(r1(2,:)==0);                                                                                                      %find the index of first error free interval
maxLength_1 = max(r1(1,start1(1):2:length(r1)));                                                         %maximum length of the interval
interval_1 = r1(1,start1(1):2:length(r1));                                                                           %get the intervals   
for i = 1:maxLength_1
    rec_1(i) =  length(find(interval_1>=i));                                                                        %record the intervals        
end                                                                                                                          %clear the intermediate variable for next runlength   
start2 = find(r2(2,:)==0);                                                                                                       %find the index of first error free interval                
maxLength_2 = max(r2(1,start2(1):2:length(r2)));                                                          %maximum length of the interval      
interval_2 = r2(1,start2(1):2:length(r2));                                                                            %get the intervals       
for i = 1:maxLength_2
    rec_2(i) =  length(find(interval_2>=i));                                                                         %record the intervals    
end
subplot(2,1,1)                                                                                                                                            
plot(1:maxLength_1,rec_1/max(rec_1))
v = axis;
grid;
ylabel('Pr(0m|1)');
xlabel('Original sequence - Length of intervals m');
subplot(2,1,2) 
plot(1:maxLength_2,rec_2/max(rec_2))
axis([v])
grid;
ylabel('Pr(0m|1)');
xlabel('Regenerated sequence - Length of intervals m');
% End of function file.
