%均匀随机变量到高斯
clear all
close all
clc
N=600000;
n=N;
No1 = 1;                                  %这里改学号
No2 = 6;
[bm1 bm2]=c7_boxmul(N);
% [po1 po2]=c7_polar(N);
y_exp1=bm1;
y_exp2=bm2;
[N_samp1,x1] = hist(y_exp1,100);            % get histogram parameters
[N_samp2,x2] = hist(y_exp2,100);            % get histogram parameters
%{
subplot(2,1,1)
bar(x,N_samp,1)                         % plot histogram
ylabel('Number of Samples')
xlabel('Independent Variable - x')
%}
figure(1);
% subplot(2,1,1)
y1 = 1/(No1*sqrt(2*pi))*exp(-x1.*x1/(2*No1*No1));                     % calculate pdf
y2 = 1/(No2*sqrt(2*pi))*exp(-x2.*x2/(2*No2*No2));                     % calculate pdf
del_x1 = x1(3)-x1(2);      % determine bin width
del_x2 = x2(3)-x2(2); 
p_hist1 = N_samp1/n/del_x1;                % BM?��
p_hist2 = N_samp2/n/del_x2;                % BM?��
% p_hist = N_samp/n/del_x*4/pi;         %
plot(x1,y1,x1,p_hist1,'o',x2,y2,x2,p_hist2,'x')                 % compare
% subplot(2,1,2)
% plot(x2,y2,x2,p_hist2,'x')                 % compare
ylabel('Probability Density')
xlabel('Independent Variable - x')
legend('true pdf','samples from histogram',1);
IIR
figure(4)
p_hist1 = filter(b1,a1,p_hist1);                % BM?��
p_hist2 = filter(b2,1,p_hist2);                % BM?��
% p_hist = N_samp/n/del_x*4/pi;         %
plot(x1,y1,x1,p_hist1,'o',x2,y2,x2,p_hist2,'x') 
