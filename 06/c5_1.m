%/*************************************************************************
% > File Name: c5_1.m
% > Author: genki_chen
% > Mail: genki_chen@aliyun.com 
% > Created Time: 2017/11/18 10:22:39
% ************************************************************************/

clear all;
close all;
clf;
clc;
%up cos gun jiang
k = 10;
m = 4;
beta = 0.32;
h = Rcos(k,m,beta);
in = zeros(1,101);
in(11) = 1;
out = conv(in,h);
t = 0:0.01:1;

figure(1)
stem(t,out(1:101),'x');
grid;
% xlabel('ʱ��');
% ylabel('���');

figure(2);
freqz(h,1)

%δ�Ӵ�
figure(3)
[H, w]=freqz(h,1);
w = w';
H = H';
plot(w/pi,abs(H));
grid;
xlabel('frequency non windows');
ylabel('|H(f)|');
%�Ӵ�
a=-4:0.1:4;
w=0.54+0.46*cos(pi*a/4);
wbp=h.*w;
[H, w]=freqz(wbp,1);

figure(4);
plot(w/pi,abs(H));
grid;
xlabel('frequency windows');
ylabel('|H(f)|');
