%/*************************************************************************
% > File Name: sna.m
% > Author: genki_chen
% > Mail: genki_chen@aliyun.com 
% > Created Time: 2017/10/19 21:46:46
% ************************************************************************/

clear all;
close all;
clf;
clc;
k=50;
nsamp = 50000;
snrdb1 = zeros(1,17);
snrdb2 = zeros(1,17);
snrdb3 = zeros(1,17);
snrdb4 = zeros(1,17);
x = 4:20;
for m = 4:20
	signal1 = 0;
	noise1 = 0;
    signal2 = 0;
	noise2 = 0;
    signal3 = 0;
	noise3 = 0;
    signal4 = 0;
	noise4 = 0;
	flod = k*m/2;
  
	for j= 1:flod
		
        term1 = (sin(pi*j/k)/(pi*j/k))^2;
        %term = (sin(4*pi*j/k)/((j/k)*(1-16*(j/k)^2)))^2;  
        term3 = ((cos(2*pi*j/k))^2)/(1-(4*j/k)^2)^2;           %MSK
		term4 = (sin(2*pi*j/k)/(2*pi*j/k))^2;                   %QPSK         
        term2 = (sin(1/2*pi*j/k)/(1/2*pi*j/k))^4;               %三角脉冲
        signal1 = signal1+term1;
        signal2 = signal2+term2;
        signal3 = signal3+term3;
        signal4 = signal4+term4;
	end
	for j= (flod+1):nsamp
		
        term1 = (sin(pi*j/k)/(pi*j/k))^2;
       % term = (sin(4*pi*j/k)/((j/k)*(1-16*(j/k)^2)))^2;
        term3 = ((cos(2*pi*j/k))^2)/(1-(4*j/k)^2)^2;        %MSK
		term4 = (sin(2*pi*j/k)/(2*pi*j/k))^2;                %QPSK
        term2 = (sin(1/2*pi*j/k)/(1/2*pi*j/k))^4;             %三角脉冲
        noise1 = noise1+term1;
        noise2 = noise2+term2;
        noise3 = noise3+term3;
        noise4 = noise4+term4;
	end
	snrdb1(m-3) = 10*log10(signal1/noise1);
    snrdb2(m-3) = 10*log10(signal2/noise2);
    snrdb3(m-3) = 10*log10(signal3/noise3);
    snrdb4(m-3) = 10*log10(signal4/noise4);
end
plot(x,snrdb1,'-b',x,snrdb2,'--r',x,snrdb3,':m',x,snrdb4,'-.k');


