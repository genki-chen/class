% File: twt_data1.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
% x in a vector  of input complex envelope values
% y is a vector of output complex envelope values
% First column is input power in real values (real power)
% Second colum is real output power;
% Third column is phase offset in degrees.
% Data is assumed to be increasing order of input power 
% First entry should be input power = 0.0, output power = 0.0, pahswe = xxx
% Last entry should be well beyond the max value of the input signal power.
%
data=[     
    0         0        32.8510
    0.0110    0.0500   32.8510
    0.0120    0.0560   32.7570
    0.0140    0.0630   32.6540
    0.0150    0.0700   32.4840
    0.0170    0.0790   32.3210
    0.0190    0.0880   32.1930
    0.0220    0.0980   31.9740
    0.0250    0.1100   31.5650
    0.0280    0.1230   31.2160
    0.0310    0.1370   30.8170
    0.0350    0.1520   30.4400
    0.0390    0.1690   30.0840
    0.0440    0.1890   29.6240
    0.0500    0.2100   29.1450
    0.0560    0.2330   28.6350
    0.0630    0.2570   28.0410
    0.0700    0.2840   27.3180
    0.0790    0.3130   26.3990
    0.0890    0.3440   25.6150
    0.1000    0.3770   24.8700
    0.1120    0.4130   23.9820
    0.1250    0.4510   23.0500
    0.1410    0.4910   22.0380
    0.1580    0.5320   21.0060
    0.1770    0.5730   19.9700
    0.1990    0.6150   18.6400
    0.2230    0.6570   17.3930
    0.2510    0.6970   16.0620
    0.2820    0.7370   14.8880
    0.3160    0.7770   13.5740
    0.3540    0.8130   12.2540
    0.3980    0.8480   11.0110
    0.4460    0.8770    9.7070
    0.5010    0.9050    8.3830
    0.5620    0.9320    6.9150
    0.6300    0.9510    5.4690
    0.7070    0.9700    4.1550
    0.7950    0.9810    2.8770
    0.8910    0.9920    1.4660
    1.0000    1.0000         0
    1.1220    0.9980   -1.5710
    1.2580    0.9980   -3.0480
    1.4120    0.9890   -4.7500
    1.5840    0.9820   -6.5670
    1.7780    0.9760   -8.3850
    1.9950    0.9700  -10.2020
    2.2480    0.9630  -12.0190
    2.5110    0.9570  -13.8360
    2.8120    0.9510  -15.6530
    3.1620    0.9450  -17.4710
    3.5480    0.9380  -19.2880
    3.9810    0.9320  -21.1050
    4.4660    0.9260  -22.9220
    5.0110    0.9200  -24.7390
    5.6230    0.9140  -26.5570];
% End of data file.