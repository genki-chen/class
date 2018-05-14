%这是比较版


clear all
close all
clc
N=100000;
[out1,out2]=c7_boxmul(N);%BM?��
[samp1,x1] = hist(out1,100);            % get histogram parameters
[samp2,x2] = hist(out2,100);
figure(1)
subplot(2,1,1)
bar(x1,samp1,1);                         % plot histogram
ylabel('Number of Samples')
xlabel('Independent Variable - x')
subplot(2,1,2)
bar(x2,samp2,1); 

figure(2)
y1 = 1/sqrt(2*pi)*exp(-x1.*x1/2).*exp(-x2.*x2/2);                     % calculate pdf
del_x1 = x1(3)-x1(2);                                   % determine bin width
p_hist1 = samp1/N/del_x1;      
y2 = 1/sqrt(2*pi*6)*exp(-x2.*x2/(2*36));                     % calculate pdf
del_x2 = x2(3)-x2(2);                                  % determine bin width
p_hist2 = samp2/N/del_x2;                % BM?��
plot(x1,y1,'k',x1,p_hist1,'ok',x2,y1,'r',x2,p_hist2,'+')                 % compare
% plot(x2,y1,'r',x2,p_hist2,'+')

ylabel('Probability Density')
xlabel('Independent Variable - x')
legend('true pdf','samples from histogram',1)


%{

figure(3)
subplot(2,1,1)
[out3,out4]=c7_polar(N);
[samp3,x3] = hist(out3,100);            % get histogram parameters
[samp4,x4] = hist(out4,100);
bar(x3,samp3,1);                         % plot histogram
ylabel('Number of Samples')
xlabel('Independent Variable - x')
subplot(2,1,2)
bar(x4,samp4,1); 

figure(4)
y2 = 1/sqrt(2*pi)*exp(-x3.*x3/2).*exp(-x4.*x4/2);                     % calculate pdf
del_x3 = x3(3)-x3(2);                      % determine bin width
p_hist3 = samp3/N/del_x3;      

del_x4= x4(3)-x4(2);                      % determine bin width
p_hist4 = samp4/N/del_x4;                % BM?��

plot(x3,y2,'k',x3,p_hist3,'ok')                 % compare
plot(x4,y2,'r',x4,p_hist4,'+')

ylabel('Probability Density')
xlabel('Independent Variable - x')
legend('true pdf','samples from histogram',1)

%}