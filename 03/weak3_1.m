%/*************************************************************************
% > File Name: weak3_1.m
% > Author: genki_chen
% > Mail: genki_chen@aliyun.com 
% > Created Time: 2017/10/28 11:24:34
% ************************************************************************/

clear ;
close all;
clc;

flag = input('QPSK or 16-QAM:');
if(flag == 1)
    x = 2;
    y = 2;
    m = 100;
    n = 20;
    bw = 0.1;
elseif(flag == 2)
    x = 4;
    y = 4;
    m = 500;
    n = 20;
    bw = 0.2;
else
    x = input('同相数');
    y = input('正交数:');
    m = input('symbols数');
    n = input('每symbol样本数:');
    bw = input('带宽:');
end

[xd,xq] = qam(x,y,m,n);
[b,a] = butter(6,bw);
yd = filter(b,a,xd);
yq = filter(b,a,xq);


subplot(2,2,1);
plot(xd,xq,'o');
if(flag == 1)
    title('QPSK');
elseif(flag == 2)
    title('16-QAM');
end
a = 1.4;
maxd = max(xd);
maxq = max(xq);
mind = min(xd);
minq = min(xq);
axis([a*mind a*maxd a*minq a*maxq]);
axis equal;
xlabel('xd');
ylabel('xq');

subplot(2,2,2)
plot(yd,yq)
axis equal;
xlabel('xd');
ylabel('xq');

sym = 30;
nsym = (0:sym*n)/n;			
subplot(2,2,3)			 
plot(nsym(1:sym*n),yd(1:sym*n))	 
xlabel('symbol index');
ylabel('xd');

subplot(2,2,4)					
plot(nsym(1:sym*n),yq(1:sym*n))
xlabel('symbol index');
ylabel('xq');

