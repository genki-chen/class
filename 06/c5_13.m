%/*************************************************************************
% > File Name: c5_13.m
% > Author: genki_chen
% > Mail: genki_chen@aliyun.com 
% > Created Time: 2017/11/18 10:45:17
% ************************************************************************/

clear all;
close all;
clf;
clc;

order = 50;
fs =100;
fa = 20;
fb = 22;

fa = fa/(fs/2);
fb = fb/(fs/2);
f = [0,fa,fb,1];
amp = [1 1 0 0];
b = remez(order,f,amp);

figure(1);
stem(b,'o');
xlabel('sample No.');
ylabel('ampel');

figure(2);
freqz(b,1);

%��Ĳ���
order = 20;
fa = 20;
fb = 25;
fa = fa/(fs/2);
fb = fb/(fs/2);
f = [0 fa fb 1];
amp = [1 1 0 0];
b = remez(order,f,amp); 
figure(3)
stem(b,'xk');
xlabel('sample No.');
ylabel('ampel');
figure(4)
freqz(b,1);
