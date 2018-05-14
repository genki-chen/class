%/*************************************************************************
% > File Name: c5_3.m
% > Author: genki_chen
% > Mail: genki_chen@aliyun.com 
% > Created Time: 2017年11月09日 星期四 15时35分28秒
% ************************************************************************/

clear;
close all;
clc;

order = 20;								% degree of polynomials
f = [0 0.2 0.22 0.28 0.3 0.4 0.42 0.48 0.5 0.6 0.62 1];	% frequency points 修改处
amp = [1 1 0 0 1 1 0 0 1 1 0 0];				% amplitude response                     修改处
[b,a] = yulewalk(order,f,amp);			% synthesize filter
freqz(b,a)								% display results
