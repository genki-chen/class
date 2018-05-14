% File: c15_errvector.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
disp(' ')
disp('Default values are:')
N = 20000											% default N			
A = [0.8 0.1 0.1; 0.2 0.6 0.2; 0.02 0.08 0.90]		% default A
B = [0.999 0.95 0.99; 0.001 0.05 0.01]				% default B
disp(' ')
disp('Accept default values?')
dtype = input('Enter y for yes or n for no  > ','s');
if dtype == 'n'
   N = input('   Enter N, the number of points to be generated > ');
   A = input('   Enter A, the state transition matrix > ');
   B = input('   Enter B, the error distribution matrx > ');
end
state = 1;							            % initial state
total_states = size(A,1);
out = zeros(1,N);					            % initialize error vector
state_seq = zeros(1,N);			                % initialize state sequence
h = waitbar(0,'Calculating Error Vector');
%
u2 = rand(1);	 					            % get random number
if u2>B(1,state)					            % test for error
   out(1) = 1;						            % record error
end
state_seq(1) = state;			                % record state
for t=2:N
   u1 = rand(1);					            % get random number
   cum_sum = [0 cumsum(A(state,:))];
   for i=1:total_states			                % loop to determine new state
      if u1>=cum_sum(i) & u1<cum_sum(i+1);
         state = i;				                % assign new state
      end
   end	
   state_seq(t) = state;		                % new record state
   u2 = rand(1);					            % get random number
   if u2>B(1,state)
      out(t) = 1;					            % record error
   end
   waitbar(t/N)
end
close(h)
% End of script file.