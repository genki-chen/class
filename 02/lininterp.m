%/*************************************************************************
% > File Name: lininterp.m
% > Author: genki_chen
% > Mail: genki_chen@aliyun.com 
% > Created Time: 2017/10/19 16:40:06
% ************************************************************************/

function h=lininterp(M)
h1 = zeros(1,(M-1));
for j = 1:(M-1);
	h1(j) = j/M;
end
h = [0,h1,1,fliplr(h1)];
