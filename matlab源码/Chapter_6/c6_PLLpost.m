% File: pllpost.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
kk = 0;
while kk == 0
k = menu('Phase Lock Loop Postprocessor',...
        'Input Frequency and VCO Frequency',...
        'Input Phase and VCO Phase',...
        'Frequency Error','Phase Error','Phase Plane Plot',...
        'Phase Plane and Time Domain Plots','Exit Program');
        if k == 1
                plot(t,fin,'k',t,fvco,'k')
                title('Input Frequency and VCO Freqeuncy')
                xlabel('Time - Seconds');ylabel('Frequency - Hertz');pause
        elseif k ==2
                pvco=phin-phierror;plot(t,phin,t,pvco)
                title('Input Phase and VCO Phase')
                xlabel('Time - Seconds');ylabel('Phase - Radians');pause
        elseif k == 3
                plot(t,freqerror);title('Frequency Error')
                xlabel('Time - Seconds');ylabel('Frequency Error - Hertz');pause
        elseif k == 4
                plot(t,phierror);title('Phase Error')
                xlabel('Time - Seconds');ylabel('Phase Error - Radians');pause
        elseif k == 5
           		 ppplot
        elseif k == 6   
           		subplot(211);phierrn = phierror/pi;
                plot(phierrn,freqerror,'k');grid;
                title('Phase Plane Plot');xlabel('Phase Error /Pi');
                ylabel('Frequency Error - Hertz');subplot(212)
                plot(t,fin,'k',t,fvco,'k');grid
                title('Input Frequency and VCO Freqeuncy')
                xlabel('Time - Seconds');ylabel('Frequency - Hertz');subplot(111)
        elseif k == 7
                kk = 1;
        end
end
% End of script file.
