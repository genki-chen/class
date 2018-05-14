clear all;
close all;
clc;                        
w2a=0;w2b=0;
s2=0.1;s4=0.1;         
tfinal=50;fs=100;delt=1/fs;twofs=2*fs;
npts=1+fs*tfinal;
x=zeros(1,npts);y=zeros(1,npts);
t=0:delt:tfinal;
for i=1:npts
    s1=exp(i)-5*s2-s4 ;
    w1a=s1+w2a;
    w2a=s1+w1a;
    s2=w1a/twofs;
    s3=exp(2*i)+s2-s4;      
    w1b=s3+w2b;
    w2b=s3+w1b;
    s4=w1b/twofs;  
    x(i)=s2;y(i)=s4;
    xv(1,i) = s1;             % build dy/dt vector
    yv(1,i) = s3; 

end
plot(x,y)
xlabel('x');
ylabel('y');
figure;plot(y)
figure;plot(x);xlabel('i');ylabel('x(t)');grid on
figure;plot(y);xlabel('i');ylabel('y(t)');grid on
