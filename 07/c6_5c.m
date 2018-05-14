subplot(211);
 phierrn = phierror/pi;
        plot(phierrn,freqerror,'k')
        title('Phase Plane Plot')
        xlabel('Phase Error /Pi')
        ylabel('Frequency Error - Hertz')
        grid;
subplot(212);
plot(t,fin,'k',t,fvco,'k')
title('Input Frequency and VCO Freqeuncy')
xlabel('Time - Seconds');ylabel('Frequency - Hertz');
