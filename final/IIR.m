

order = 50;								% degree of polynomials
f = [0 0.2 0.22 0.33 0.35 0.45 0.47 1];	% frequency points 修改处
amp = [1 1 0 0 1 1 0 0 ];				% amplitude response                     修改处
[b1,a1] = yulewalk(order,f,amp);			% synthesize filter
b2 = remez(order,f,amp);
figure(2)
freqz(b1,a1);
figure(3)
freqz(b2,1);