%/*************************************************************************
% > File Name: c5_1.m
% > Author: genki_chen
% > Mail: genki_chen@aliyun.com 
% > Created Time: 2017年11月09日 星期四 15时39分41秒
% ************************************************************************/
%这个程序是以100的采样率 20的截止频率来写的

clear;
close all;
clc;

fs = 100;								% set sampling frequency
fc = 20;								% set cuttoff frequency
f = 0:0.1:50;							% define frequency vector
[N,wc] = buttord(2*pi*fc,2*pi*(fc+5),0.1,60,'s');
[b,a] = butter(N,wc,'s');

h = freqs(b,a,2*pi*f);		% amp. resp. of analog filter


[N1,wp] = cheb1ord(2*pi*fc,2*pi*(fc+5),0.1,60,'s');
[d,c] = cheby1(N1,0.1,wp,'s');
h1 = freqs(d,c,2*pi*f);	
plot(f,abs(h),'-k',f,abs(h1),'.-b')				% plot
xlabel('频率')				% label x axis
ylabel('幅度响应')		
title('实线为巴特沃斯滤波器，点线为切比雪夫1型滤波器');
%{
figure(2)

[bz1,az1] = impinvar(d,c,fs);			% impulse invariant digital filter
h1 = freqz(bz1,az1,f,fs);				% amplitude response of above
[bz2,az2] = bilinear(d,c,fs);			% bilinear z filter (not prewarped)
h2 = freqz(bz2,az2,f,fs);				% amplitude response of above
[bz3,az3] = bilinear(d,c,fs,fc);		% bilinear z filter (prewarped)
h3 = freqz(bz3,az3,f,fs);				% amplitude response of above
subplot(211)							% subplot 1
plot(f,abs(h),f,abs(h1))				% plot
xlabel('频率')				% label x axis
ylabel('幅度相应')			% label y axis
subplot(212)							% subplot 2
plot(f,abs(h2),f,abs(h3))				% plot
xlabel('频率')				% label x axis
ylabel('幅度相应')			% label y axis
% End of script file.
%}