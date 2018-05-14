%/*************************************************************************
% > File Name: c4_12.m
% > Author: genki_chen
% > Mail: genki_chen@aliyun.com 
% > Created Time: 2017年11月03日 星期五 19时53分08秒
% ************************************************************************/

clear;
close all;
clc;
figure(1);
t=0:0.001:1;
x=5*(2+sin(2*pi*t)).*cos(20*pi*t+pi/6);
z=hilbert(x);
f0=10;
xl=z.*exp(-1i*2*pi*f0*t);
xd=real(xl);
xq=-1i*(xl-xd);
subplot(2,1,1)
plot(t,xd); title('xd (t)');
subplot(2,1,2);
plot(t,xq); title('xq (t)');

figure(2);
yd = (7*xd)/sqrt(xd.*xd+xq.*xq);
yq = (7*xq)/sqrt(xd.*xd+xq.*xq);
yl = yd+1i*yq;
z1 = exp(1i*2*pi*f0*t)*yl;
y = real(z1);
plot(t,y);
title('硬限幅器输出y(t)');
xlabel('t');
ylabel('y(t)');

figure(3);
 t=0.0001:0.0001:1;
 At = 5*(2+sin(2*pi*t));
 seta = pi/6;
 xt = At.*cos(2*pi*f0*t+seta);
 xlt = At.*exp(1i*seta);
 B = 7;
 Y2 = hilbert(real(xlt));
 y = Y2.*exp(-1i*2*pi*f0*t);
 xdty = real(y);
 xqty = imag(y);
 ydt = (B*xdty)./sqrt((xdty.^2)+(xqty.^2));
 yqt = (B*xqty)./sqrt((xdty.^2)+(xqty.^2));
 ylt = ydt + 1i*yqt;
 subplot(3,1,1);
 plot(ydt);
 title('yd(t)');
 subplot(3,1,2);
 plot(yqt);
 title('yq(t)');
 subplot(3,1,3);
 plot(abs(ylt));
 title('y(t)的复包络');
 
 figure(4);
t=0.001:0.001:1;
x=5*(2+sin(2*pi*t)).*cos(20*pi*t+pi/6);
z=hilbert(x);
 f0=10;
 xl = z.*exp(-1i*2*pi*f0*t);
 xd = real(xl);
 xq = -1i*(xl-xd);
 yd = (7*xd)/sqrt(xd.*xd+xq.*xq);
 yq = (7*xq)/sqrt(xd.*xd+xq.*xq);
 yl = yd+1i*yq;
 z1 = exp(1i*2*pi*f0*t)*yl;
 y = real(z1);
 yt = 7*cos(20*pi*t+pi/6);
 subplot(2,1,1);
 plot(t,y);
 title('仿真结果');
 subplot(2,1,2);
 plot(t,yt);
 title('解析结果'); 

figure(5);
t=0:0.001:1;
xd=5*(2+sin(2*pi*t)*cos(pi/6));
xq=5*(2+sin(2*pi*t)*sin(pi/6));
yd=7*cos(pi/6);
yq=7*sin(pi/6);
subplot(2,2,1);plot(t,xd);
subplot(2,2,2);plot(t,xq);
subplot(2,2,3);stem(yd);
subplot(2,2,4);stem(yq);
