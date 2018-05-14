%/*************************************************************************
% > File Name: lin.m
% > Author: genki_chen
% > Mail: genki_chen@aliyun.com 
% > Created Time: 2017/10/19 16:48:25
% ************************************************************************/

clear all;
close all;
clf;
clc;
figure(1);
M = 6;                    %change there
h = lininterp(M);
t = 0:10;
tu = 0:60;
x = 10*sin(3*pi*t/10);
xu = upsamp(x,M);
xi = conv(h,xu);
subplot(2,1,1);
stem(xi,'k.');
subplot(2,1,2);
stem(tu,xu,'k.');

figure(2);
M = 7;
h = lininterp(M);
t = 0:10;
tu = 0:70;
x = 10*sin(3*pi*t/10);
xu = upsamp(x,M);
xi = conv(h,xu);
subplot(2,1,1);
stem(xi,'k.');
subplot(2,1,2);
stem(tu,xu,'k.');

figure(3);
M = 8;
h = lininterp(M);
t = 0:10;
tu = 0:80;
x = 10*sin(3*pi*t/10);
xu = upsamp(x,M);
xi = conv(h,xu);
subplot(2,1,1);
stem(xi,'k.');
subplot(2,1,2);
stem(tu,xu,'k.');
