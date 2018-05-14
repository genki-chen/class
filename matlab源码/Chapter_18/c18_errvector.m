% File: c18_errvector.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
function [out] = c18_errvector(A_matrix,NN)
A = A_matrix;
B = [1 1 0; 0 0 1];
state = 1;						% initial state
total_states = size(A,1);
out = zeros(1,NN);				% initialize error vector
state_seq = zeros(1,NN);		% initialize state sequence
h = waitbar(0,'Calculating Error Vector');
%
u2 = rand(1);	 					% get random number
if u2>B(1,state)					% test for error
   out(1) = 1;						% record error
end
state_seq(1) = state;			    % record state
for t=2:NN
   u1 = rand(1);					% get random number
   cum_sum = [0 cumsum(A(state,:))];
   for i=1:total_states			    % loop to determine new state
      if u1>=cum_sum(i) & u1<cum_sum(i+1);
         state = i;				    % assign new state
      end
   end	
   state_seq(t) = state;		    % new record state
   u2 = rand(1);					% get random number
   if u2>B(1,state)
      out(t) = 1;					% record error
   end
   waitbar(t/NN)
end
close(h)
% End of function file.