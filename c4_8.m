%/*************************************************************************
% > File Name: c4_8.m
% > Author: genki_chen
% > Mail: genki_chen@aliyun.com 
% > Created Time: 2017年11月04日 星期六 14时49分10秒
% ************************************************************************/

clear;
close all;
clc;

t = -10: 0.01 : 10;

%手算傅里叶变换
%solution for a
x = 16./pi*t.*sin(5*pi*t).*cos(200*pi*t);
z = hilbert(x);
f0 = 100;
xl = z.*exp(-1i*2*pi*f0*t);
xd = real(xl);



N=1024;
Ndata=512;

n=0:Ndata;

subplot(2,1,1);
plot(t,xd);
X=fft(xd,N);
P=X.*conj(X);
f=f0*(0:Ndata)/N;
subplot(2,1,2);
plot(f(1:Ndata),P(1:Ndata));

%solution for b
figure(2)
f0 = 95;
xl = z.*exp(-1i*2*pi*f0*t);
xd = real(xl);

subplot(2,1,1);
plot(t,xd);
X=fft(xd,N);
P=X.*conj(X);
f=f0*(0:Ndata)/N;
subplot(2,1,2);
plot(f(1:Ndata),P(1:Ndata));


%solution for c
figure(3)
f0 = 90;
xl = z.*exp(-1i*2*pi*f0*t);
xd = real(xl);

subplot(2,1,1);
plot(t,xd);
X=fft(xd,N);
P=X.*conj(X);
f=f0*(0:Ndata)/N;
subplot(2,1,2);
plot(f(1:Ndata),P(1:Ndata));