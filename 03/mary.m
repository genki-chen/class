%/*************************************************************************
% > File Name: mary.m
% > Author: genki_chen
% > Mail: genki_chen@aliyun.com 
% > Created Time: 2017/10/28 11:16:04
% ************************************************************************/
function y= mary(levels,m,n)
l = m*n;                         
y = zeros(1,l-n+1);             
lm1 = levels-1;
x=2*fix(levels*rand(1,m))-lm1;
for i = 1:m                      
        k = (i-1)*n+1;
        y(k) = x(i);
end
y = conv(y,ones(1,n));           

