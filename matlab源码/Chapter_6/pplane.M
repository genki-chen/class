function [] = pplane(x,y,nsettle)
% Plots the phase plane with phase in the range (-pi,pi)
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
ln = length(x);
maxfreq = max(y);
minfreq = min(y);
close                                   % Old figure discarded
axis([-1 1 1.1*minfreq 1.1*maxfreq]);   % Establish scale
hold on                                 % Collect info for new fig
j = nsettle;
while j < ln
    i = 1;
    while x(j) < pi & j < ln
        a(i) = x(j)/pi;
        b(i) = y(j);
        j = j+1;
        i = i+1;
    end
    plot(a,b,'k')
    a = [];
    b = [];
    x = x - 2*pi;
end
hold off
title('Phase-Plane Plot')
xlabel('Phase Error / Pi')
ylabel('Frequency Error in Hertz')
grid
% End of script file.
