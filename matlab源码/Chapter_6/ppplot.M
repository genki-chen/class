% File: ppplot.m
% ppplot.m is the script file for plotting phase plane plots. If the 
% phase plane is constrained to (-pi,pi) ppplot.m calls pplane.m.
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
kz = 0;
while kz == 0
    k = menu('Phase Plane Options',...
        'Extended Phase Plane',...
        'Phase Plane mod(2pi)',...
        'Exit Phase Plane Menu');
    if k == 1
        phierrn = phierror/pi;
        plot(phierrn,freqerror,'k')
        title('Phase Plane Plot')
        xlabel('Phase Error /Pi')
        ylabel('Frequency Error - Hertz')
        grid
        pause
     elseif k == 2
         pplane(phierror,freqerror,nsettle+1)
         pause
     elseif k == 3
         kz = 1;
     end
end
% End of script file.

