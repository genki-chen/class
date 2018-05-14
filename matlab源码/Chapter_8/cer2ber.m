% File: cer2ber.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
function [ber] = cer2ber(q,n,d,t,ps)
lnps = length(ps);			    % length of error vector
ber = zeros(1,lnps);			% initialize output vector
for k=1:lnps					% iterate error vector
   cer = ps(k);				    % channel symbol error rate
   sum1 = 0; sum2 = 0;	    	% initialize sums
   %
   % first loop evaluates first sum   
   %
   for i=(t+1):d
      term = nkchoose(n,i)*(cer^i)*((1-cer))^(n-i);
      sum1 = sum1+term;
   end
   %
   % second loop evaluates second sum
   %
   for i=(d+1):n
      term = i*nkchoose(n,i)*(cer^i)*((1-cer)^(n-i));
      sum2 = sum2+term;
   end
   % compute BER (output)
   ber(k) = (q/(2*(q-1)))*((d/n)*sum1+(1/n)*sum2); 
end
% End of function file.


   
   