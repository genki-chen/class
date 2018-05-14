clear all;
close all;
clc;
w2b=0; w2c=0;    % initialize integrators 初始化积分器
yd=0.1; y=0;   % initialize differential equation 初始化微分方程
tfinal = 50;               % simulation time
fs = 100;                   % sampling frequency
delt = 1/fs;                    % sampling period
npts = 1+fs*tfinal;         % number of samples simulated
ydv = zeros(1,npts);            % vector of dy/dt samples
yv = zeros(1,npts);        % vector of y(t) samples
%
% beginning of simulation loop
%
for i=1:npts
   t = (i-1)*delt;                       % time
   ydd = 20*sin(2*t)-4*yd-8*y;   % de for t
   w1b=ydd+w2b;             % first integrator - step 1
   w2b=ydd+w1b;             % first integrator - step 2
   yd=w1b/(2*fs);               % first integrator output
   w1c=yd+w2c;              % second integrator - step 1
   w2c=yd+w1c;              % second integrator - step 2
   y=w1c/(2*fs);                % second integrator output
   ydv(1,i) = yd;               % build dy/dt vector
   yv(1,i) = y;                 % build y(t) vector   
end
figure;plot(yv,ydv);xlabel(' y(t)');ylabel(' dy/dt ');grid on
figure;plot(yv);xlabel('t');ylabel('y(t)');grid on
