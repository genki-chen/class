%/*************************************************************************
% > File Name: upsamp.m
% > Author: genki_chen
% > Mail: genki_chen@aliyun.com 
% > Created Time: 2017/10/19 16:57:57
% ************************************************************************/

function out = upsamp(in,M)
L = length(in);
out = zeros(1,(L-1)*M+1);
for j=1:L
	out(M*(j-1)+1)=in(j);
end
