% File: c3_sna.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
% 
k = 50;			                % samples per lobe
nsamp = 50000;		            % total frequency samples
snrdb = zeros(1,17);		    % initialize memory
x = 4:20;			            % vector for plotting
for m = 4:20
   signal = 0; noise = 0;       % initialize sum values
   f_fold = k*m/2;		        % folding frequency
   for j = 1:f_fold
      term = (sin(pi*j/k)/(pi*j/k))^2;
      signal = signal+term;
   end
   for j = (f_fold+1):nsamp
      term = (sin(pi*j/k)/(pi*j/k))^2;
      noise = noise+term;
   end
   snrdb(m-3) = 10*log10(signal/noise); 
end
plot(x,snrdb)			        % plot results
xlabel('Samples per symbol')
ylabel('Signal-to-aliasing noise ratio')
% End of script file.
