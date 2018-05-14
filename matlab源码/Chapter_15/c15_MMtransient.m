% File: c15_MMtransient.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
N = 100;
pie = zeros(N,2);
A = [0.98 0.02; 0.05 0.95];
pie(1,:) = [0.50 0.50];
for k=2:N
   pie(k,:) = pie(k-1,:)*A;
end
kk = 1:N;
plot(kk,pie(:,1),'k-',kk,pie(:,2),'k:')
xlabel('Iteration')
ylabel('Probability')
text1 = ['The steady-state probabilities are ',...
      num2str(pie(N,1)),' and ' ,num2str(pie(N,2)),'.'];
legend('State 1','State 2',2)
disp(text1)
disp(' ')
disp('The value of A^N is'); A^N
% End of script file.