% figure setting example
close all;

% one subplot, [left bottom width height], modify the dimension of the
% figure in the array
figure
subplot('Position', [0.17, 0.1, 0.76, 0.8]);

% two subplot, [left bottom width height], modify the dimension of the
% figure in the array
figure;
set(subplot(211), 'Position', [0.17, 0.55, 0.76, 0.35])

set(subplot(212), 'Position', [0.17, 0.1, 0.76, 0.35])

% three subplot, [left bottom width height], modify the dimension of the
% figure in the array
figure;
set(subplot(311), 'Position', [0.17, 0.7, 0.76, 0.2])

set(subplot(312), 'Position', [0.17, 0.4, 0.76, 0.2])

set(subplot(313), 'Position', [0.17, 0.1, 0.76, 0.2])

% four subplot, [left bottom width height], modify the dimension of the
% figure in the array
figure;
set(subplot(411), 'Position', [0.17, 0.75, 0.76, 0.15])

set(subplot(412), 'Position', [0.17, 0.53, 0.76, 0.15])

set(subplot(413), 'Position', [0.17, 0.32, 0.76, 0.15])

set(subplot(414), 'Position', [0.17, 0.1, 0.76, 0.15])
