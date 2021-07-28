% figure setting example
close all;

% generate sine wave and cosine wave to plot
t = linspace(0, 10, 1000);
sin_data = sin(t);
cos_data = cos(t);

% one subplot, [left bottom width height], modify the dimension of the
% figure in the array
figure
subplot('Position', [0.17, 0.1, 0.76, 0.8]);
plot(t, sin_data, 'b', 'Linewidth', 2)
hold on
plot(t, cos_data, 'r', 'Linewidth', 2)
grid on
ylim([-1.5 1.5])
xlim([0, t(end)])
y_label = ylabel('$X$ (m)', 'Interpreter', 'latex', 'rotation', 0);
set(y_label, 'Units', 'Normalized', 'Position', [-0.13, 0.47]);
xlabel('Time (sec)', 'Fontsize', 11)
legend('$sin$', '$cos$', 'Interpreter', 'latex')
title('Position', 'Fontsize', 11)

% two subplot, [left bottom width height], modify the dimension of the
% figure in the array
figure;
set(subplot(211), 'Position', [0.17, 0.55, 0.76, 0.35])
plot(t, sin_data, 'b', 'Linewidth', 2)
hold on
plot(t, cos_data, 'r', 'Linewidth', 2)
grid on
ylim([-1.5 1.5])
xlim([0, t(end)])
y_label = ylabel('$X$ (m)', 'Interpreter', 'latex', 'rotation', 0);
set(y_label, 'Units', 'Normalized', 'Position', [-0.13, 0.44]);
legend('$sin$', '$cos$', 'Interpreter', 'latex')
title('Position', 'Fontsize', 11)

set(subplot(212), 'Position', [0.17, 0.1, 0.76, 0.35])
plot(t, sin_data, 'b', 'Linewidth', 2)
hold on
plot(t, cos_data, 'r', 'Linewidth', 2)
grid on
ylim([-1.5 1.5])
xlim([0, t(end)])
y_label = ylabel('$Y$ (m)', 'Interpreter', 'latex', 'rotation', 0);
set(y_label, 'Units', 'Normalized', 'Position', [-0.13, 0.44]);
xlabel('Time (sec)', 'Fontsize', 11)
legend('$sin$', '$cos$', 'Interpreter', 'latex')

% three subplot, [left bottom width height], modify the dimension of the
% figure in the array
figure;
set(subplot(311), 'Position', [0.17, 0.7, 0.76, 0.2])
plot(t, sin_data, 'b', 'Linewidth', 2)
hold on
plot(t, cos_data, 'r', 'Linewidth', 2)
grid on
ylim([-1.5 1.5])
xlim([0, t(end)])
y_label = ylabel('$X$ (m)', 'Interpreter', 'latex', 'rotation', 0);
set(y_label, 'Units', 'Normalized', 'Position', [-0.13, 0.41]);
legend('$sin$', '$cos$', 'Interpreter', 'latex')
title('Position', 'Fontsize', 11)

set(subplot(312), 'Position', [0.17, 0.4, 0.76, 0.2])
plot(t, sin_data, 'b', 'Linewidth', 2)
hold on
plot(t, cos_data, 'r', 'Linewidth', 2)
grid on
ylim([-1.5 1.5])
xlim([0, t(end)])
y_label = ylabel('$Y$ (m)', 'Interpreter', 'latex', 'rotation', 0);
set(y_label, 'Units', 'Normalized', 'Position', [-0.13, 0.41]);
legend('$sin$', '$cos$', 'Interpreter', 'latex')

set(subplot(313), 'Position', [0.17, 0.1, 0.76, 0.2])
plot(t, sin_data, 'b', 'Linewidth', 2)
hold on
plot(t, cos_data, 'r', 'Linewidth', 2)
grid on
ylim([-1.5 1.5])
xlim([0, t(end)])
y_label = ylabel('$Z$ (m)', 'Interpreter', 'latex', 'rotation', 0);
set(y_label, 'Units', 'Normalized', 'Position', [-0.13, 0.41]);
xlabel('Time (sec)', 'Fontsize', 11)
legend('$sin$', '$cos$', 'Interpreter', 'latex')

% four subplot, [left bottom width height], modify the dimension of the
% figure in the array
figure;
set(subplot(411), 'Position', [0.17, 0.75, 0.76, 0.15])
plot(t, sin_data, 'b', 'Linewidth', 2)
hold on
plot(t, cos_data, 'r', 'Linewidth', 2)
grid on
ylim([-1.5 1.5])
xlim([0, t(end)])
y_label = ylabel('$X$ (m)', 'Interpreter', 'latex', 'rotation', 0);
set(y_label, 'Units', 'Normalized', 'Position', [-0.13, 0.38]);
legend('$sin$', '$cos$', 'Interpreter', 'latex')
title('Position', 'Fontsize', 11)

set(subplot(412), 'Position', [0.17, 0.53, 0.76, 0.15])
plot(t, sin_data, 'b', 'Linewidth', 2)
hold on
plot(t, cos_data, 'r', 'Linewidth', 2)
grid on
ylim([-1.5 1.5])
xlim([0, t(end)])
y_label = ylabel('$Y$ (m)', 'Interpreter', 'latex', 'rotation', 0);
set(y_label, 'Units', 'Normalized', 'Position', [-0.13, 0.38]);
legend('$sin$', '$cos$', 'Interpreter', 'latex')

set(subplot(413), 'Position', [0.17, 0.32, 0.76, 0.15])
plot(t, sin_data, 'b', 'Linewidth', 2)
hold on
plot(t, cos_data, 'r', 'Linewidth', 2)
grid on
ylim([-1.5 1.5])
xlim([0, t(end)])
y_label = ylabel('$Z$ (m)', 'Interpreter', 'latex', 'rotation', 0);
set(y_label, 'Units', 'Normalized', 'Position', [-0.13, 0.38]);
legend('$sin$', '$cos$', 'Interpreter', 'latex')

set(subplot(414), 'Position', [0.17, 0.1, 0.76, 0.15])
plot(t, sin_data, 'b', 'Linewidth', 2)
hold on
plot(t, cos_data, 'r', 'Linewidth', 2)
grid on
ylim([-1.5 1.5])
xlim([0, t(end)])
y_label = ylabel('$W$ (m)', 'Interpreter', 'latex', 'rotation', 0);
set(y_label, 'Units', 'Normalized', 'Position', [-0.13, 0.38]);
xlabel('Time (sec)', 'Fontsize', 11)
legend('$sin$', '$cos$', 'Interpreter', 'latex')
