% File: c15_bwa.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
function [p, pye, b] = c15_bwa(iterations,states,out);
len = length(out);
p = input('Enter the initial state transition matrix P > ');
pye = input('Enter the initial state probability vector pye > ');
b = input('Enter the initial output symbol probability matrix B > ') ;
alpha=zeros(len,states); beta=zeros(len,states);
eta=zeros(states,states); gamma=zeros(1,states); scale=zeros(len,1);
loglikelihood = zeros(1,iterations);
iplot = 1;							% likelihood plot if 1
%
p									% display initial p
pye									% display initial pye
%
pye_rec = zeros(states,1);
pye_rec(:,1) = pye';
sum_gamma = 0;
sum_eta = 0;
%
for cycle = 1:iterations
   cycle		                    % display iteration index
   %
   %     alpha generation 
   %
   alpha(1,:) = pye.*b(1,:);
   scale(1) = sum(alpha(1,:));
   alpha(1,:) = alpha(1,:)/scale(1);
   for t = 2:len
       alpha(t,:) = (alpha(t-1,:)*p).*b(out(t)+1,:);
       scale(t) = sum(alpha(t,:));
       alpha(t,:) = alpha(t,:)/scale(t);
   end
   %
   %     beta generation 
   %
   beta(len,:) = 1/scale(len);
   for t = len-1:-1:1
       beta(t,:) = (beta(t+1,:).*b(out(t+1)+1,:))*(p')/scale(t);
   end
   %
   %     eta generation 
   %
   sum_eta = zeros(states);
   for t = 1:len-1
      for i = 1:states
         eta(i,:) = ((alpha(t,i)*(p(i,:).*(b(out(t+1)+1,:))).*beta(t+1,:)))...
            /sum(alpha(t,:).*beta(t,:));
       end
       sum_eta  = sum_eta + eta;
   end
   % 
   %     gamma generation 
   %
   gamma_sum = zeros(1,states);
   for t = 1:len
      gamma_sum = gamma_sum + alpha(t,:).*beta(t,:);
   end
   % 
   %		calculate and display the log_likelihood function
   %
   loglikelihood = sum(log10(scale));
   log_likelihood(cycle) = loglikelihood;
   loglikelihood									% display result
   %
   %     Re-estimation of the intial state probability vector pye        
   %  
   pye(1,:) = alpha(1,:).*beta(1,:)/sum(alpha(1,:).*beta(1,:));
   %
   pye							% display pye
   %
   pye_rec(:,cycle+1) = pye';	% Save for plot illustrating convergence	
   %
   %     Re-estimation of the state transition matrix P
   %
   for i = 1:states
      for j = 1:states
         p_estimate(i,j) = sum_eta(i,j)/(gamma_sum(i)-alpha(len,i).*beta(len,i)...
            /(sum(alpha(len,:).*beta(len,:))));
      end
      p_estimate(i,:) = p_estimate(i,:)/sum(p_estimate(i,:));
   end
   %
   p = p_estimate				% display p
   %
   %     Re-estimation of output symbol probability matrix B
   %
   out_0 = find(out == 0);
   out_1 = find(out == 1);
   sum_0 = zeros(1,states);
   sum_1 = zeros(1,states);
   for i = 1:length(out_0)
      sum_0 = sum_0 + alpha(out_0(i),:).*beta(out_0(i),:)...
         /sum(alpha(out_0(i),:).*beta(out_0(i),:));
   end   
   for i = 1:length(out_1)
      sum_1 = sum_1 + alpha(out_1(i),:).*beta(out_1(i),:)...
         /sum(alpha(out_1(i),:).*beta(out_1(i),:));
   end   
   for i = 1:states
      for j = 1:2
         if j == 1
            b(j,i) = sum_0(i)/gamma_sum(i);
         end
         if j == 2
            b(j,i) = sum_1(i)/gamma_sum(i);
         end                               
      end
   end
   for i = 1:states
      b(:,i) = b(:,i)/sum(b(:,i));
   end
   b		% display b
end
if iplot==1
   plot(1:iterations,log_likelihood)
	xlabel('iterations')
	ylabel('log likelihood')
end   
% End of function file.