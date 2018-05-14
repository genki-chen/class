% File: c15_semiMarkov.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
function [A_matrix, pi_est] = c15_semiMarkov(runlength,cycles,partition)
% runlength = runlength code
% cycles = number of iterations
% partition = 1 by 2 vector = [good states, bad states]
%
[symbols len_symbols]  = size(runlength);   % gets size of runlength vector
m  = runlength(1,:);                        % the first bit received is error free 
u  = runlength(2,:);                        % arbitrary number of elements
C = len_symbols;                            % total length of runlength vector
%
A = cell(length(partition)); 				% a 2x2 array only 2 symbols 
pye = rand(1,sum(partition));				% initialize the initial state vector 
pye = pye(1,:)/sum(pye(1,:)); 				% normalize
pi_u1 = pye(1:partition(1)); 
%
% initialize A matrix
%
A = cell(partition);                                %allocate memeory for the A matrix
A00 = diag(1 - abs(randn(partition(1),1)/1000)); 	% initialize the A00 matrix
A10 = rand(partition(2),partition(1)); 				% initialize the A10 matrix
A01 = rand(partition(1),partition(2)); 				% initialize the A01 matrix
A11 = diag(1 - abs(randn(partition(2),1)/1000));  	% initialize the A11 matrix
A{1,1} = A00; A{1,2} = A01; A{2,1} = A10; A{2,2} = A11;
A_matrix = [A{1,1} A{1,2};A{2,1} A{2,2}]; 			% cell-array in matrix form
%
for i = 1:sum(partition)
    A_matrix(i,:) = A_matrix(i,:)/sum(A_matrix(i,:)); % normalize the A matrix
end
A_matrix;
%
A{1} = A_matrix(1:partition(1),1:partition(1));
A{2} = A_matrix(partition(1)+1:partition(1)+partition(2),1:partition(1));
A{3} = A_matrix(1:partition(1),partition(1)+1:partition(1)+partition(2));
A{4} = A_matrix(partition(1)+1:partition(1)+...
   partition(2),partition(1)+1:partition(1)+partition(2));
%   
for iterations = 1:cycles
%  
% alpha generation
%   
   alpha{1} = pi_u1*(A{u(1)+1,u(1)+1}.^(m(1)-1)); scale(1)= sum(alpha{1}); 
   alpha{1}= alpha{1}/scale(1);                 % normalization
   for c = 2:C
      alpha{c}= alpha{c-1}*A{u(c-1)+1,u(c)+1}*A{u(c)+1,u(c)+1}^(m(c)-1); % alpha 
      scale(c)= sum(alpha{c});                  % scaling factor
      alpha{c}= alpha{c}/scale(c);              % normalize alpha
   end;
   %
   % beta generation
   %
   beta{C}= ones(partition(u(C)+1),1)/scale(C); % Last element of beta
   for(c= C-1:-1:1)
      beta{c}= A{u(c)+1,u(c+1)+1}*(A{u(c+1)+1,u(c+1)+1}^(m(c+1)-1))...
         *beta{c+1}/scale(c); 
   end;
   %
   % gamma geneartion 
   %
   Gamma{1} = alpha{1}.*beta{1}';
   Gamma{2} = alpha{2}.*beta{2}';
   %
   sum_Tii_00s  = diag(zeros(partition(1),1));      % initialization of A00 
   sum_Tii_11s  = diag(zeros(partition(2),1));      % initialization of A11 
   sum_Tij_01s =  zeros(partition(1),partition(2)); % initialization of A01 
   sum_Tij_10s =  zeros(partition(2),partition(1)); % initialization of A10 
   %
   % re-estimation for the A00 matrix
   %
   for c=1:2:C-1
       if ( c == 1)
          Tii_00s = diag((m(1)-1)*(pi_u1)'.*(diag(A{u(1)+1,u(1)+1})...
             .^(m(1)-1)).*beta{1});
       else
          Tii_00s = diag((m(c)-1)*((alpha{c-1}*A{u(c-1)+1,u(c)+1})'...
             .*(diag(A{u(c)+1,u(c)+1}^(m(c)-1)))).*beta{c});
       end
       sum_Tii_00s = sum_Tii_00s + Tii_00s;         % sums elements of A00
   end
   % 
   % re-estimation for the A11 matrix
   %
   for c=2:2:C-1
      Tii_11s = diag((m(c)-1)*((alpha{c-1}*A{u(c-1)+1,u(c)+1})'...
         .*(diag(A{u(c)+1,u(c)+1}^(m(c)-1)))).*beta{c});
       sum_Tii_11s = sum_Tii_11s + Tii_11s;         % sums elements of A11
   end
   % 
   % re-estimation for the A01 matrix
   %
   for c=1:2:C-1
      Tij_01s = (alpha{c}'*((A{u(c+1)+1,u(c+1)+1}^(m(c+1)-1))...
         *beta{c+1})').*A{u(c)+1,u(c+1)+1};
       sum_Tij_01s = sum_Tij_01s + Tij_01s;         % sums elements of A01
   end
   %
   % re-estimation for the A10 matrix
   %
   for c=2:2:C-1
      Tij_10s = (alpha{c}'*((A{u(c+1)+1,u(c+1)+1}^(m(c+1)-1))...
         *beta{c+1})').*A{u(c)+1,u(c+1)+1};
       sum_Tij_10s = sum_Tij_10s + Tij_10s;         % sums elements of A10
   end
   %
   A_matrix = [sum_Tii_00s sum_Tij_01s; sum_Tij_10s sum_Tii_11s];
   %
   for i = 1:sum(partition)
       A_matrix(i,:) = A_matrix(i,:)/sum(A_matrix(i,:)); % normalize A
   end
   %
   A{1} = A_matrix(1:partition(1),1:partition(1)); 
   A{2} = A_matrix(partition(1)+1:partition(1)+partition(2),1:partition(1));
   A{3} = A_matrix(1:partition(1),partition(1)+1:partition(1)+partition(2));
   A{4} = A_matrix(partition(1)+1:partition(1)+partition(2),...
      partition(1)+1:partition(1)+partition(2));
   %
   pi_est = [Gamma{1} Gamma{2}];    % re-estimated initial state probabilty vector
   pi_est = pi_est/sum(pi_est);     % normalized initial state probabilty vector
   pi_rec(iterations,:) = pi_est; 
   pi_u1 = pi_est(1:partition(1));
   iterations 						% display current iteration
   A_matrix 						% display estimated state transition matrix
end
% End of function file.
