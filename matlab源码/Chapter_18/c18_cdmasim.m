% File: c18_cdmasim.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
function [BER,ErrorRun]=c18_cdmasim(N,SF,EbNo,NumInterferers,MPathDelay,Kfactor_dB)
rand('state',sum(100*clock)); randn('state',sum(100*clock));
NIterate = 1e3;										% default block size
NumberOfIterations = ceil(N/NIterate);
ErrorState = 0; ErrorRun = []; RunCount = 1;        % itialize
Kfactor = 10^(Kfactor_dB/10);	                    % convert to linear units
EbNolinear = 10^(EbNo/10);                          % convert to linear units
MPathComponents = length(MPathDelay);
%
% Randomly determine the ampliutde in each multipath component and store as
% vector. Determine the total power in all of the scattered components.
%
MPathAmp(2:MPathComponents) = rand(MPathComponents-1,1);
ScatPower = MPathAmp*MPathAmp.';
%
% Determine the amplitude of the LOS component.
%
MPathAmp(1) = sqrt(ScatPower*Kfactor);
%
% Determine which component has the largest energy (ampliutde).
% Normalize vector so that the strongest component has unit amplitude.
%
[fee MaxComponent] = max(MPathAmp); MPathAmp = MPathAmp/fee;
%
% Design IIR filter for fading signal.
%
FilterOrder = 4; Ripple = 0.5; BW = 0.01;   % filter parameters
[b,a] = cheby1(FilterOrder,Ripple,BW);        %4th order fitler
%
% Error checking.
%
if NumInterferers > (SF-1)
   error(['NumInterferers must not exceed ',int2str(SF-1),'!'])
end
if length(MPathDelay) ~= length(MPathAmp)
   error('MPathDelay and MPathAmp must have the same length')
end
if min(MPathDelay) < 0
   error('MPathDelay must not have negative components')
end
fee = diff(MPathDelay);
if min(fee) <= 0
   error('MPathDelay must be monotonically increasing')
end
clear fee
%
% End Error Checking.
%
% Generate spreading sequences. The spreading sequences for the interferers
% are shifted versions of the desired sequence with a shift offset.
%
DesiredSequence = MSequence(SF+1);          % desired signal
offset = fix(length(DesiredSequence)/(NumInterferers+1));
M = length(DesiredSequence);
for k=1:NumInterferers
   InterfererSequence(k,:) = ...
      [DesiredSequence(M-(k-1)*offset:M) DesiredSequence(1:M-1-(k-1)*offset)];
end
%
% The simulation loop begins here.
% 
zf = zeros(FilterOrder,MPathComponents);
for cnt=1:NumberOfIterations
   %
   % Generate symbols for dsired and interfering users and spread.
   %
   DesiredSymbols = sign(rand(1,NIterate)-0.5);
   InterferingSymbols = sign(rand(NumInterferers,NIterate)-0.5);
   DesiredChips = reshape(DesiredSequence.'*DesiredSymbols,1,M*NIterate);
   for k=1:NumInterferers
      InterferingChips(k,:) = ...
         reshape(InterfererSequence(k,:).'*InterferingSymbols (k,:),1,M*NIterate);
   end
   %
   % Generate noise.
   %
   NoiseAmplitude = sqrt(SF/(2*EbNolinear));
   MaxDelay = max(MPathDelay);
   DesiredNoise = NoiseAmplitude*randn(1,M*NIterate+MaxDelay);
   %
   % Apply multipath.
   %
   MPathLinAmp = MPathAmp;
   MPathComponents = length(MPathDelay);
   DesiredMPathSignal = zeros(1,M*NIterate+MaxDelay);
   if NumInterferers > 0,
      InterferingMPathSignal = zeros(NumInterferers,M*NIterate+MaxDelay);
      for k=1:MPathComponents
         index=1+MPathDelay(k):NIterate*M+MPathDelay(k);
         InterferingMPathSignal(:,index) = ...
            InterferingMPathSignal(:,index) + MPathLinAmp(k)*InterferingChips;
      end
   end
   for k=1:MPathComponents
      if k==1, fading = ones(1,M*NIterate);
      else
         fading = randn(size(DesiredSymbols))+j*randn(size(DesiredSymbols));
         [fading zf(:,k)] = filter(b,a,fading,zf(:,k));  
         % The zf(:,k) ensures continuity from block to block.
         fading = interp(fading,SF);
         fading = abs(fading / sqrt(mean(fading.*conj(fading))));
      end
      if k == MaxComponent
         fadesign = sign(fading); 
      end
      faa(k,:) = MPathLinAmp(k)*fading;
      index = 1+MPathDelay(k):NIterate*M+MPathDelay(k);
      DesiredMPathSignal(index) = ...
         DesiredMPathSignal(index) + (MPathLinAmp(k)*fading).*DesiredChips;
   end
   %
   % Add intererence and noise.
   %
   if NumInterferers > 0
      IncomingSignal = ...
         DesiredMPathSignal + sum(InterferingMPathSignal,1) + DesiredNoise;
   else
      IncomingSignal = DesiredMPathSignal + DesiredNoise;
   end
   % 
   % Receive and Detect Incoming Signal (Correlation receiver assumed)
   %
   index = 1+MPathDelay(MaxComponent):M*NIterate+MPathDelay(MaxComponent);
   IncomingChips = reshape(fadesign.*IncomingSignal(index),M,NIterate);
   DespreadSymbols = DesiredSequence * IncomingChips;
   DetectedSymbols = sign(DespreadSymbols);
   %
   % Compute Bit Error Rate
   %
   ErrorVector = 0.5*abs(DetectedSymbols-DesiredSymbols);
   ErrorsIterate(cnt) = sum(ErrorVector);
   BERIterate(cnt) = ErrorsIterate(cnt)/NIterate;
   for k=1:NIterate
      if (ErrorVector(k) == 0) & (ErrorState == 0)
         RunCount = RunCount+1;
      elseif (ErrorVector(k) == 0) & (ErrorState == 1)
         ErrorRun = [ErrorRun RunCount]; RunCount = 1; ErrorState = 0;
      elseif (ErrorVector(k) == 1) & (ErrorState == 0)
         ErrorRun = [ErrorRun RunCount]; RunCount = 1; ErrorState = 1;
      elseif (ErrorVector(k) == 1) & (ErrorState == 1)
         RunCount = RunCount+1;
      else
         s1 = sprintf('ErrorVector(%d)=%d, ErrorState=%d! Unexpected Condition!');
         error(s1);
      end
   end
end
Errors = sum(ErrorsIterate); BER = mean(BERIterate);
ErrorRun = [ErrorRun RunCount];
% End of function file.