function value = cgpdf(x,mean,sigma)
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
variance=sigma.^2;
value=(exp((((real(x)-mean).^2)+((imag(x)-mean).^2))/(-2*variance)))/(2*pi*variance);
% End of function file.
