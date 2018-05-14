% File: c15_seglength.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
function runcode=c15_seglength(errvect)
% Produces a two-row matrix of eror intervals and error-free
% intervals. Row 1 specifies the interval length and row 2 
% specifies the interval class (error(1) or no error(0)).
%
len = length(errvect);					% length of input vector
j = 1;										% initialize index of m	
count = 1;									% initialize counter
for i=1:(len-1)		
   if errvect(i+1) == errvect(i);	% compare elements	
      count = count+1;					% on match increment count
   else
		m(j) = count;						% record count
      j = j+1;								% increment index of m
      count = 1;							% reset counter
   end
end
%
runcode = zeros(2,length(m));			% allocate memory
runcode(1,:) = m;							% assign counts to row 1
%
if errvect(1)==0
   runcode(2,2:2:length(m)) = 1;		% even index error count
else
   runcode(2,1:2:length(m)) = 1;		% odd index error count
end
% End of function file.