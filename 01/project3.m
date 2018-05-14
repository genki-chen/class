clear;
A=5
b1=4;
Fc = 0.1:0.01:1.5;
L=length(Fc);
for i = 1 : L
   snr(i)=4.7712+20*log10(Fc(i))+6.0206*b1;
end
figure(1)
plot(Fc,snr);
xlabel('Fc');
ylabel('Signal-to-noise ratio');
grid on