% File: c15_hmmtest.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
pe = sum(out)/N;
state_sum = zeros(1,total_states);
for k=1:N
   if state_seq(k)==1
      state_sum(1)=state_sum(1)+1;
   end   
   if state_seq(k)==2
      state_sum(2)=state_sum(2)+1;
   end
   if state_seq(k)==3
      state_sum(3)=state_sum(3)+1;
   end
end   
a = ['The probability of State 1 is ',num2str(state_sum(1)/N),'.'];
b = ['The probability of State 2 is ',num2str(state_sum(2)/N),'.'];
c = ['The probability of State 3 is ',num2str(state_sum(3)/N),'.'];
d = ['The error probability is ',num2str(pe),'.'];
disp('Simulation results:')
disp(a)			% display probability of state 1
disp(b)			% display probability of state 2
disp(c)			% display probability of state 3
disp(d)			% display error probability
% End script file.   