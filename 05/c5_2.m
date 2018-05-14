%/*************************************************************************
% > File Name: c5_2.m
% > Author: genki_chen
% > Mail: genki_chen@aliyun.com 
% > Created Time: 2017年11月09日 星期四 15时36分31秒
% ************************************************************************/

clear;
close all;
clc;

figure(1)
T = 0.01;
f = 0:0.1:50;
z = exp(-i*2*pi*f*T);                           % see (5.4)
a0 = 0.239057; a1 = 0.239057; b1 = 0.521886;    % bilinear invariant
num = a0+a1*z;
den = 1-b1*z;
ampx = abs(num./den);
%{
a0 = 0.628319; b1 = 0.533488;				    % impulse invariant
num = a0;
den = 1-b1*z;
ampy = abs(num./den);
a0 = 1.0; a1 = 0.533488; b1 = 0.533488;		    % step invriant	
num = (a0-a1)*z;
den = 1-b1*z;
ampz = abs(num./den);
%}

%figure(2)
%重新计算a b
a = 2 * pi * 10;
C = 2 * pi * (a/(2*pi)) * cot(pi * (a/(2*pi)) * T);
a0 = a / ( C + a);
a1= a0;
b1 = (C - a) / (C + a);
%



T = 0.01;
f = 0:0.1:50;
z = exp(-i*2*pi*f*T);                           % see (5.4)
% a0 = 0.420808; a1 = 0.420808; b1 = 0.158384;    % bilinear invariant
num = a0+a1*z;
den = 1-b1*z;
ampx1 = abs(num./den);
a0 = 0.628319; b1 = 0.533488;				    % impulse invariant
num = a0;
den = 1-b1*z;
ampy = abs(num./den);
a0 = 1.0; a1 = 0.533488; b1 = 0.533488;		    % step invriant	
num = (a0-a1)*z;
den = 1-b1*z;
ampz = abs(num./den);
plot(f,ampx,'->k',f,ampy,f,ampz,f,ampx1,'-o')
xlabel('频率')
ylabel('幅度相应')
title('圈型为5-47 差型为5-51')
% End of script file.
