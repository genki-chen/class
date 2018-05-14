%/*************************************************************************
% > File Name: c4_11.m
% > Author: genki_chen
% > Mail: genki_chen@aliyun.com 
% > Created Time: 2017年11月04日 星期六 16时01分17秒
% ************************************************************************/

clear;
close all;
clc;

%{
手算,求傅里叶
h = 0.8944*exp(wb/2).*exp(-0.1056*wo*t);
hd = 0.8944* exp(wb/2).*cos(0.1056*wo*t); 
hq = 0.8944* exp(wb/2).*sin(0.1056*wo*t); 
%}

%solution for b
figure(1);
t = -100:1:100;
wb = 0.2;
wo = 1;
h = 0.8944*exp(wb/2).*exp(-0.1056*wo*t);
hd = 0.8944* exp(wb/2).*cos(0.1056*wo*t); 
hq = 0.8944* exp(wb/2).*sin(0.1056*wo*t); 

subplot(2,1,1);
plot(t,hd);
subplot(2,1,2);
plot(t,hq);

%solution for c
figure(2);
t = -100:1:100;
wb = 0.05;
wo = 1;
h = 0.8944*exp(wb/2).*exp(-0.1056*wo*t);
hd = 0.8944* exp(wb/2).*cos(0.1056*wo*t); 
hq = 0.8944* exp(wb/2).*sin(0.1056*wo*t); 

subplot(2,1,1);
plot(t,hd);
subplot(2,1,2);
plot(t,hq);

