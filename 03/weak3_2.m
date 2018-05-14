  %/*************************************************************************
% > File Name: weak3_2.m
% > Author: genki_chen
% > Mail: genki_chen@aliyun.com 
% > Created Time: 2017/10/28 11:33:31
% ************************************************************************/

clear ;
close all;
clf;
clc;

figure(1)
fs = 300;
N = 1024;
n = 0:N;
t = n/fs;
x = 10*cos(200*pi*t+2*sin(20*pi*t));
xd = 10*cos(2*sin(20*pi*t));
xq = 10*sin(2*sin(20*pi*t));

subplot(2,1,1)
plot(t,xd);
subplot(2,1,2)
plot(t,xq);

figure(2)

y = fft(x,N);
m=y.*conj(y);
p = angle(y);
f=fs*(0:N)/N;
subplot(2,1,1);
plot(f(1:N/2),m(1:N/2)); title('X(f)的幅度');
set(gca,'XTick',[15 40 60 85]);
subplot(2,1,2);
plot(f(1:N),p(1:N)); title('X(f)的相位');
set(gca,'XTick',[15 40 60 85]);

figure(3)

z=hilbert(x);
x1=fft(z.*exp(-1i*2*pi*100*t),N);
m = abs(x1);
f=fs*(0:N)/N;
subplot(2,1,1);
plot(f(1:N/2),m(1:N/2));
title(' X~(f)的幅度');
xlabel('频率');
ylabel('幅度');
p =angle(x1);
subplot(2,1,2);
plot(f(1:N),p(1:N));
title(' X~(f)的相位');
xlabel('频率');
ylabel('相位');

figure(4)

z=hilbert(x);
xl=z.*exp(-1i*2*pi*100*t);
xd=real(xl);
xq=-1i*(xl-xd);
subplot(2,1,1)
plot(t,xd);
subplot(2,1,2);
plot(t,xq);


figure(5)
fs=300;N=1024;
n=0:N;t=n/fs;

xd=10*cos(2*sin(20*pi*t));
xq=10*sin(2*sin(20*pi*t));

subplot(2,2,1)
plot(t,xd);
subplot(2,2,2)
plot(t,xq);


x = 10*cos(200*pi*t+2*sin(20*pi*t));
z=hilbert(x);
xl=z.*exp(-1i*2*pi*100*t);
xd=real(xl);
xq=-1i*(xl-xd);
subplot(2,2,3)
plot(t,xd);
subplot(2,2,4);
plot(t,xq);
