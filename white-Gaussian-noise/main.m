% white Gaussian noise generator
% dBw-dBm-W converter : http://www.elecfans.com/tools/dbm.htm
close all;

% generate white Gaussian noise with 1000*3 matrix, -10dBW(0.099watts)
noise = wgn(1000, 3, -10);

% variance of the matrix
var(noise)

% plot the data
plot(noise)
