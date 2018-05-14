%/*************************************************************************
% > File Name: c5_1.m
% > Author: genki_chen
% > Mail: genki_chen@aliyun.com 
% > Created Time: 2017年11月09日 星期四 15时39分41秒
% ************************************************************************/

clear;
close all;
clc;

fs = 10000;								% set sampling frequency
fc = 30;								% set cuttoff frequency      截止频率
f = 0:0.1:50;							% define frequency vector
[b,a] = ellip(6,1,20,2*pi*fc,'s');	    % synthesize elliptic filter 第一项为阶数 第二项为通带波动
h = freqs(b,a,2*pi*f);					% amp. resp. of analog filter
[bz1,az1] = impinvar(b,a,fs);			% impulse invariant digital filter
h1 = freqz(bz1,az1,f,fs);				% amplitude response of above
[bz2,az2] = bilinear(b,a,fs);			% bilinear z filter (not prewarped)
h2 = freqz(bz2,az2,f,fs);				% amplitude response of above
[bz3,az3] = bilinear(b,a,fs,fc);		% bilinear z filter (prewarped)
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
