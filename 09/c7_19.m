% File: c7_rejex1.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
R = 7;										% default value of R
M = 2/pi;									% value of M
N = input('Input number of points N > ');	% set N
fx = zeros(1,N);							% array of output samples
u1 = rand(1,N); u2 = rand(1,N);				% generate u1 and u2
v1 = R*u1*2-R;									% generate v1
v2 = (M/R)*rand(1,N);						% generate v2 (g(x))
kpts = 0;									% initialize counter
for k=1 :N
   if v2(k)<(M/(R*R))*sqrt(R*R-v1(k)*v1(k));
      kpts=kpts+1;							% increment counter
      fx(kpts)=v1(k);   					% save output sample
   end
end
fx = fx(1:kpts);
[N_samp,x] = hist(fx,20);					% get histogram parameters
subplot(2,1,1)
bar(x,N_samp,1)								% plot histogram
ylabel('Number of Samples')
xlabel('Independent Variable - x')
subplot(2,1,2)
yt = (M/R/R)*sqrt(R*R-x.*x);				% calculate pdf
del_x = x(3)-x(2);							% determine bin width
p_hist = N_samp/kpts/del_x;					% probability from histogram
plot(x,yt,'k',x,p_hist,'ok')				% compare
ylabel('Probability Density')
xlabel('Independent Variable - x')
legend('true pdf','samples from histogram',3)
text = ['The number of points accepted is ',...
      num2str(kpts,15),' and N is ',num2str(N,15),'.'];
disp(text)
% End of script file.