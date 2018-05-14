close all
clear all
snrdB_min = 0; snrdB_max = 10;          % SNR (in dB)limits
snrdB = snrdB_min:1:snrdB_max;
Nsymbols = input('Enter number of symbols > ');
snr = 10.^(snrdB/10);                   % convert from dB
h = waitbar(0,'SNR Iteration');
len_snr = length(snrdB);
for j=1:len_snr                         % increment SNR
   waitbar(j/len_snr)
   sigma = sqrt(1/(2*snr(j)));          % noise standard deviation
   error_count = 0;
   for k=1:Nsymbols                     % simulation loop begins
      d = round(rand(1));               % data
      if d == 1
         x_d =  0;                      % direct transmitter output 
        x_q = 1/2;                        % quadrature transmitter output 
      else
       x_d = sqrt(3)/2;                     % direct transmitter output
         x_q = 0;                     % quadrature transmitter output
      end   
      n_d = sigma*randn(1);             % direct noise component
      n_q = sigma*randn(1);             % quadrature noise component
      y_d = x_d + n_d;                  % direct receiver input
      y_q = x_q + n_q;                  % quadrature receiver input
      if y_d > y_q                      % test condition                        
         d_est = 0;                     % conditional data estimate
      else
         d_est = 1;                     % conditional data estimate
      end
      if (d_est ~= d)               
         error_count = error_count + 1; % error counter
      end
   end                                  % simulation loop ends
   errors(j) = error_count;             % store error count for plot
end
close(h)
ber_sim = errors/Nsymbols;              % BER estimate
ber_theor = q(sqrt(snr));               % theoretical BER
semilogy(snrdB,ber_theor,snrdB,ber_sim,'o')
axis([snrdB_min snrdB_max 0.0001 1])
xlabel('SNR in dB')
ylabel('BER')
legend('Theoretical','Simulation')
    