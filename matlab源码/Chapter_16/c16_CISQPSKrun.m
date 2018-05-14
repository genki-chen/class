% file: c16_CISQPSKrun.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
function BER_CIS=CISQPSKrun(N,Eb,No,ChanAtt,...
	TimingBias,TimingJitter,PhaseBias,PhaseJitter,CISBias)
fs = 1e+6;       						% sampling rate (samples/second)
SymRate = 1e+5;  						% symbol rate (symbols/second)
Ts = 1/fs; 								% sampling period
TSym = 1/SymRate;						% symbol period
SampPerSym = fs/SymRate;				% samples per symbol
SymToSend = N;   						% symbols to be transmitted
ChanBW = 4.99e+5;						% bandwidth of channel (Hz)
CISWeightIntegrator = 1;				% importance sampling weight
CISWeightIntegratorOld = 1;			    % importance sampling weight
MeanCarrierPhaseError = PhaseBias;	    % mean of carrier phase
StdCarrierPhaseError = PhaseJitter;	    % std dev of phase error
MeanSymbolSyncError = TimingBias;	    % mean symbol sync error
StdSymbolSyncError = TimingJitter;	    % std dev symbol sync error
ChanGain = 10^(-ChanAtt/20);			% channel gain (linear units)
TxBitClock = Ts/2;						% Tx clock period
RxBitClock = Ts/2;						% RX clock period
TxSymSent = 1;							% Tx symbol counter
RxSymDemod = 0;							% Rx symbol counter
%
RxNoiseStd = sqrt((10^((No-30)/10))*(fs/2));	% std dev of noise
TxSigAmp = sqrt(10^((Eb-30)/10)*SymRate);		% signal amplitude
probe1 = zeros((SymToSend+1)*SampPerSym,1);	    % probe 1 memory
probe1counter = 1;								% initialize probe 1
probe2 = zeros((SymToSend+1)*SampPerSym,1);	    % probe 2 memory
probe2counter = 1;								% initialize probe 2
%
% Buffers that contain the transmitted and received data.
%
[unused,SourceBitsI] = random_binary(SymToSend,1);
[unused,SourceBitsQ] = random_binary(SymToSend,1);
%
% Differentially Encode the transmitted data
%
TxBitsI = SourceBitsI*0; TxBitsQ = SourceBitsQ*0;
for k=2:length(TxBitsI)
    TxBitsI(k) = or(and(not(xor(SourceBitsI(k),SourceBitsQ(k))),...
                 xor(SourceBitsI(k),TxBitsI(k-1))), ...
                 and(xor(SourceBitsI(k),SourceBitsQ(k)),...
                 xor(SourceBitsQ(k),TxBitsQ(k-1))));
    TxBitsQ(k) = or(and(not(xor(SourceBitsI(k),SourceBitsQ(k))),...
                 xor(SourceBitsQ(k),TxBitsQ(k-1))), ...
                 and(xor(SourceBitsI(k),SourceBitsQ(k)),...
                 xor(SourceBitsI(k),TxBitsI(k-1))));
end
%
% Make a complex data stream of the I and Q bits
%
TxBits = ((TxBitsI*2)-1)+(sqrt(-1)*((TxBitsQ*2)-1));
%
% Initialize transmitter and the receiver integrate and dump filter.
%
RxIntegrator = 0;
TxBitClock = 2*TSym;
%
% Design the channel filter and state array (if needed. 
% 
[b,a] = butter(2,ChanBW/(fs/2));
b = [1]; a = [1];								% bypass filter
[junk,FilterState] = filter(b,a,0);
%
% Loop once for each sample.
%
while TxSymSent < SymToSend
   %
   % Update transmitter clock. Get new data bits if required.
   %
   TxBitClock = TxBitClock+Ts;
   if TxBitClock > TSym
      TxSymSent = TxSymSent+1;					% get new bit
      %
      % We don't want the clock to increase to infinity. so 
      % subtract off an integer number of Tb seconds.
      % 
      TxBitClock = mod(TxBitClock,TSym);
      %
      % Get the new bit and appropriately.
      %
      TxOutput = TxBits(TxSymSent)*TxSigAmp;
   end
   [Rx,FilterState] = filter(b,a,TxOutput,FilterState);
   %
   % Add white Gaussian noise to the signal.
   % First create unbiased (Monte Carlo) noise and then bias.
   %
   UnbiasedNoise = RxNoiseStd*(randn(1,1)+sqrt(-1)*randn(1,1));
   BiasedNoise = CISBias*UnbiasedNoise;
   %
   % Calculate the CIS weight for this particular noise sample
   %
   CISWeight = cgpdf(BiasedNoise,0,RxNoiseStd)./cgpdf(BiasedNoise,0,CISBias*RxNoiseStd);
   %
   % Since we are using white noise, the total CIS weight will just be the
   % product of the individuals CIS weights.  
   %
   CISWeightIntegrator = CISWeightIntegrator*CISWeight;
   Rx = (ChanGain*Rx)+BiasedNoise;
   %
   % Phase rotation due to receiver carrier synchronization error.
   %
   PhaseRotation = exp(sqrt(-1)*2*pi*...
       (MeanCarrierPhaseError+(randn(1,1)*StdCarrierPhaseError))/360);
   Rx = Rx*PhaseRotation;
   probe1(probe1counter) = Rx; probe1counter = probe1counter+1;
   %
   % Update the Integrate and Dump Filter at the receiver
   RxIntegrator = RxIntegrator+Rx;
   probe2(probe2counter) = RxIntegrator; probe2counter=probe2counter+1;
   %
   % Update the receiver clock, to see if it is time to
   % sample and dump the integrator.
   %
   RxBitClock = RxBitClock+Ts;
   RxTSym = TSym*(1+MeanSymbolSyncError+(StdSymbolSyncError*randn(1,1)));
   if RxBitClock > RxTSym
      RxSymDemod = RxSymDemod+1;
      RxBitsI(RxSymDemod) = round(sign(real(RxIntegrator))+1)/2;
      RxBitsQ(RxSymDemod) = round(sign(imag(RxIntegrator))+1)/2;
      RxBitsCISWeight(RxSymDemod) = CISWeightIntegrator*CISWeightIntegratorOld;
      %
      % Make sure the receive clock does not increase to infinity.
      % 
      RxBitClock = RxBitClock-TSym;
      %
      % Dump the integrator.
      %
      RxIntegrator = 0;
      CISWeightIntegratorOld = CISWeightIntegrator;
      CISWeightIntegrator = 1;
   end
end
%
% Differential decoder.
%
SinkBitsI = SourceBitsI*0;
SinkBitsQ = SourceBitsQ*0;
for k=2:RxSymDemod
    SinkBitsI(k) = or(and(not(xor(RxBitsI(k),RxBitsQ(k))),...
                   xor(RxBitsI(k),RxBitsI(k-1))),...
                   and(xor(RxBitsI(k),RxBitsQ(k)),...
                   xor(RxBitsQ(k),RxBitsQ(k-1))));
    SinkBitsQ(k) = or(and(not(xor(RxBitsI(k),RxBitsQ(k))),...
                   xor(RxBitsQ(k),RxBitsQ(k-1))),...
                   and(xor(RxBitsI(k),RxBitsQ(k)),...
                   xor(RxBitsI(k),RxBitsI(k-1))));
end
%
% Look for best time delay between input and output, 100 bits.
%
[C,Lags] = vxcorr(SourceBitsI(10:110),SinkBitsI(10:110));
[MaxC,LocMaxC] = max(C);
BestLag = Lags(LocMaxC);
%
% Adjust time delay to match best lag
%
if BestLag > 0
    SourceBitsI = SourceBitsI(BestLag+1:length(SourceBitsI));
    SourceBitsQ = SourceBitsQ(BestLag+1:length(SourceBitsQ));
    RxBitsCISWeight = RxBitsCISWeight(BestLag+1:length(RxBitsCISWeight));
elseif BestLag < 0
    SinkBitsI = SinkBitsI(-BestLag+1:length(SinkBitsI));
    SinkBitsQ = SinkBitsQ(-BestLag+1:length(SinkBitsQ));
    RxBitsCISWeight = RxBitsCISWeight(-BestLag+1:length(RxBitsCISWeight));
end
%
% Make all arrays the same length.
%
TotalBits = min(length(SourceBitsI),length(SinkBitsI));
TotalBits = TotalBits-20;
SourceBitsI = SourceBitsI(10:TotalBits);
SourceBitsQ = SourceBitsQ(10:TotalBits);
SinkBitsI = SinkBitsI(10:TotalBits);
SinkBitsQ = SinkBitsQ(10:TotalBits);
RxBitsCISWeight = RxBitsCISWeight(10:TotalBits);
%
% Find the number error events and the BER.
%
IErrors = SourceBitsI ~= SinkBitsI;
QErrors = SourceBitsQ ~= SinkBitsQ;
BER_CIS = sum(IErrors.*RxBitsCISWeight)+sum(QErrors.*RxBitsCISWeight);
BER_CIS = BER_CIS/(2*length(SourceBitsI));
% End of function file.
