% File: c6_nltvde.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
w2b=0; w2c=0;					% initialize integrators
yd=0; y=0;						% initialize differential equation
tfinal = 50;					% simulation time
fs = 100;						% sampling frequency
delt = 1/fs;					% sampling period
npts = 1+fs*tfinal;			    % number of samples simulated
ydv = zeros(1,npts);			% vector of dy/dt samples
yv = zeros(1,npts);	            % vector of y(t) samples
%
% beginning of simulation loop
%
for i=1:npts
   t = (i-1)*delt;			                % time
   if t<20
      ydd = 4*exp(-t/2)-3*yd*abs(y)-9*y;	% de for t<20
   else
      ydd = 4*exp(-t/2)-3*yd-9*y;			% de for t>=20
   end
   w1b=ydd+w2b;								% first integrator - step 1
   w2b=ydd+w1b;								% first integrator - step 2
   yd=w1b/(2*fs);							% first integrator output
   w1c=yd+w2c;								% second integrator - step 1
   w2c=yd+w1c;								% second integrator - step 2
   y=w1c/(2*fs); 							% second integrator output
   ydv(1,i) = yd;							% build dy/dt vector
   yv(1,i) = y;								% build y(t) vector   
end
%
% end of simulation loop
%
plot(yv,ydv)								% plot phase plane	
xlabel('y(t)')								% label x axis
ylabel('dy/dt')								% label y zxis
% End of script file.