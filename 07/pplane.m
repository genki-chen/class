%/*************************************************************************
% > File Name: pplane.m
% > Author: genki_chen
% > Mail: genki_chen@aliyun.com 
% > Created Time: 2017/11/25 10:28:22
% ************************************************************************/


function [] = pplane(x,y,nsettle)
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
