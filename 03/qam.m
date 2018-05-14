%/*************************************************************************
% > File Name: qam.m
% > Author: genki_chen
% > Mail: genki_chen@aliyun.com 
% > Created Time: 2017/10/28 11:20:21
% ************************************************************************/
function [xd,xq] = qam(x,y,m,n)
xd = mary(x,m,n);
xq = mary(y,m,n);
