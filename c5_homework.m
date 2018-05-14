%/*************************************************************************
% > File Name: c5_homework.m
% > Author: genki_chen
% > Mail: genki_chen@aliyun.com 
% > Created Time: 2017��11��12�� ������ 15ʱ00��36��
% ************************************************************************/
%�����������100�Ĳ����� 20�Ľ�ֹƵ����д��

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
xlabel('Ƶ��')				% label x axis
ylabel('������Ӧ')		
title('ʵ��Ϊ������˹�˲���������Ϊ�б�ѩ��1���˲���');
