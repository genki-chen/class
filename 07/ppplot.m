
%/*************************************************************************
% > File Name: ppplot.m
% > Author: genki_chen
% > Mail: genki_chen@aliyun.com 
% > Created Time: 2017/11/25 10:29:10
% ************************************************************************/

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
