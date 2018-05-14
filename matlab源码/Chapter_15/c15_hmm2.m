% File: c15_hmm2.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
N = 100000;								% number of iterations
state = 'Good';							% initial state
P = [0.98 0.02; 0.05 0.95];			    % state transition matrix
B = [0.0005 0.1000];					
out = zeros(1,N);						% initialize matrix
errors = 0;
for i=1:N
   error = 0;							% initialize error counter
   y = rand(1);							% RV for state transition
   err = rand(1);						% RV for error given state
   if state=='Good'						% test for Good state
      if y<P(1,1)							
         state='Good';					% remain in Good state
         if err<B(1);					% test for error
            error = 1;					% record an error
         end   
      else									
         state='Bad ';					% transition to Bad state
         if err<B(2);					% test for error
            error = 1;					% record an error
         end            
      end
   else									% state = Bad
      if y<P(2,2);
         state='Bad ';					% remain in Bad state
         if err<B(2);					% test for error
            error = 1;					% record an error
         end   
      else
         state='Good';					% transition to Good state
         if err<B(1);					% test for error
            error = 1;					% record an error
         end   
      end
   end
   errors = errors + error;			    % increment error counter
end
PE = errors/N						    % calculate error proability
% End of script file.