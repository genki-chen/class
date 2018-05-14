%/*************************************************************************
% > File Name: Rcos.m
% > Author: genki_chen
% > Mail: genki_chen@aliyun.com 
% > Created Time: 2017/11/18 10:26:14
% ************************************************************************/

function h = Rcos(k,m,beta)
n = 0:2*m*k;
z = (n/k) - m +eps;
t1 = cos(beta*pi*z);
t2 = sin(pi*z)./(pi*z);
t3 = 1-4*beta*beta*z.*z;
h = t2.*t1./t3;

