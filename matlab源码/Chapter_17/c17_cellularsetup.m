% File: c17_cellularsetup.m
% Software given here is to accompany the textbook: W.H. Tranter, 
% K.S. Shanmugan, T.S. Rappaport, and K.S. Kosbar, Principles of 
% Communication Systems Simulation with Wireless Applications, 
% Prentice Hall PTR, 2004.
%
% ===== Pre-defined parameters =========================================
r_cell = 1000;		% cell radius (in meters)
n_co_ch_users = 6;	% number of co-channel users
P_BS = 0;			% BS transmitter power (in dBW)
P_MS = 0;			% MS transmitter power (in dBW)
corr_fwd = 0.0;		% correlation coefficient - forward link
corr_rev = 0.0;		% correlation coefficient - reverse link
K = 1;			    % constant in the link equation
in_beam = 0;		% maximum gain of the sectorized antennas (in dB)
%
% --- Limits (angles) of each sector ---
%
sector_min = zeros(6,3);
sector_max = zeros(6,3);
sector_min(:,1) = (pi/3)*[-3:2]';
sector_min([1:3],2) = pi/3*[-3 -1 1]';
sector_min(1,3) = -pi;
sector_max(:,1) = sector_min(:,1) + pi/3;
sector_max([1:3],2) = sector_min([1:3],2) + 2*pi/3;
sector_max(1,3) = pi;
%
% --- Center of each sector ----
%
phi_center = zeros(6,3);
phi_center(:,1) = (pi/3)*[-3:2]';
phi_center([1:3],2) = (pi/3)*[-3 -1 1]';
%
% --- Beamwidth of each sector ---
%
phi_BW = [1 2 6]*pi/3;
%
% --- Number of sectors ----- 
%
num_sectors = [6 3 1];
%
% ===== User Inputs =========================================
%
num_snapshots = input('Number of snapshots = '); 
cluster_size = input('Cluster size (3, 4 or 7) = ');
n_path = input('Path loss exponent = ');
sigma_int = input('Shadowing std deviation - interference (dB) = ');
sigma_S = input('Shadowing std deviation - desired signal (dB) = ');
sec = input('Sectorization (1=>60-sectoring, 2=>120-sectoring, 3=>omni). enter ---> ');
ftb = input('Front-to-back ratio of the BS antennas (dB) = ');
out_beam = in_beam - ftb;
% End of script file.