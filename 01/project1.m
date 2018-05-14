
%fs=50;

clear;
clc;
clf;
t=0:0.001:2;
%N=1024;
%Ndata=256;

%n=0:Ndata;


f1=2;
f2=4;
fs=10;
%t=n/fs;

x=5*cos(2*pi*t*f1)+3*sin(2*pi*t*f2);
figure(1);
subplot(2,1,1);
plot(t,x);
xlabel('t');
ylabel('x(t)');
% title('ԭʼ');
%dt=0.1;
wm=2*pi*fs;
n=length(t);
k=0:n-1;
w=k*wm/n;
x1=x*exp(-1i*t'*w);
subplot(2,1,2);
plot(w/(2*pi),abs(x1));
xlabel('f(Hz)');
ylabel('X(f)');

fs=10;
ts=1/fs;
n1=0:ts:20;
xa=5*cos(2*pi*n1*f1*ts)+3*sin(2*pi*n1*f2*ts);
figure(2);
subplot(2,1,1);
stem(n1,xa);
xlabel('t');
ylabel('x_{a}(t)');
% title('ʱ�����');
x=5*cos(2*pi*n1*f1)+3*sin(2*pi*n1*f2);
wm=2*pi*fs;
n=length(t);
k=0:n-1;
w=k*wm/n;
x2=x*exp(-1i*n1'*w)*ts;
subplot(2,1,2);
plot(w/(2*pi),abs(x2));
xlabel('f(Hz)');
ylabel('X_{a}(f)');
% title('�����ź�Ƶ��');
