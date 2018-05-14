clear;
figure
L=5;
A=5;
S=A^2/2;
D=10-(-10);
Fc=sqrt(S)/(D/2);
for i=2:L
    b(i)=2^i;
end
for i=1:L
    snr(i)=4.7712+20*log10(Fc)+6.0206*b(i);
end
plot(b,snr)
xlabel('b');
ylabel('Signal-to-noise ratio');
grid on