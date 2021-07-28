% read experiment data from bag file and plot the trajectory
close all;

% if the bag file is available, use rosbag() to read it
bag_select = "2021-07-21-12-04-53.bag";
bag = rosbag(bag_select);

% parameters for plotting
length_of_t = 3911;
states_null_x = 730;
states_null_y = 730;
states_null_z = 730;

% select subset messages filtered by the specific topic
t_bag = select(bag, 'topic', 'rosout');
x_bag = select(bag, 'topic', 'uav/x');
y_bag = select(bag, 'topic', 'uav/y');
z_bag = select(bag, 'topic', 'uav/z');
xd_bag = select(bag, 'topic', 'uav/x_des');
yd_bag = select(bag, 'topic', 'uav/y_des');
zd_bag = select(bag, 'topic', 'uav/z_des');

% read data from message list as structures
t_msgStructs = readMessages(t_bag, 'DataFormat', 'struct');
x_msgStructs = readMessages(x_bag, 'DataFormat', 'struct');
y_msgStructs = readMessages(y_bag, 'DataFormat', 'struct');
z_msgStructs = readMessages(z_bag, 'DataFormat', 'struct');
xd_msgStructs = readMessages(xd_bag, 'DataFormat', 'struct');
yd_msgStructs = readMessages(yd_bag, 'DataFormat', 'struct');
zd_msgStructs = readMessages(zd_bag, 'DataFormat', 'struct');

% read data in a cell array, now we can use the array to plot the figure
t = cellfun(@(m) double(m.Header.Stamp.Sec), t_msgStructs);
t_nsec = cellfun(@(m) double(m.Header.Stamp.Nsec), t_msgStructs);
x = cellfun(@(m) double(m.Data), x_msgStructs);
y = cellfun(@(m) double(m.Data), y_msgStructs);
z = cellfun(@(m) double(m.Data), z_msgStructs);
xd = cellfun(@(m) double(m.Data), xd_msgStructs);
yd = cellfun(@(m) double(m.Data), yd_msgStructs);
zd = cellfun(@(m) double(m.Data), zd_msgStructs);

% remove the useless data and adjust the time array
t(length_of_t:end) = [];
t_nsec(length_of_t:end) = [];
t = t - t(1);
t = t + t_nsec*10^(-9);
x(1:states_null_x) = [];
y(1:states_null_y) = [];
z(1:states_null_z) = [];
x(length_of_t:end) = [];
y(length_of_t:end) = [];
z(length_of_t:end) = [];
xd(1:states_null_x) = [];
yd(1:states_null_y) = [];
zd(1:states_null_z) = [];
xd(length_of_t:end) = [];
yd(length_of_t:end) = [];
zd(length_of_t:end) = [];

% position
figure;
set(subplot(311), 'Position', [0.15, 0.7, 0.78, 0.22])
plot(t, x, 'b', 'Linewidth', 2)
hold on
plot(t, xd, 'r', 'Linewidth', 2)
grid on;
ylim([-1.6 1.6])
xlim([0, t(end)])
y_label = ylabel('$X$ $\mathrm{\left(m\right)}$', 'Interpreter', 'latex', 'rotation', 0);
set(y_label, 'Units', 'Normalized', 'Position', [-0.11, 0.43]);
legend('$X$', '$X_{d}$', 'Interpreter', 'latex')
title('Position', 'Fontsize', 11)

set(subplot(312), 'Position', [0.15, 0.4, 0.78, 0.22])
plot(t, y, 'b', 'Linewidth', 2)
hold on
plot(t, yd, 'r', 'Linewidth', 2)
grid on;
ylim([-1.0 1.0])
xlim([0, t(end)])
y_label = ylabel('$Y$ $\mathrm{\left(m\right)}$', 'Interpreter', 'latex', 'rotation', 0);
set(y_label, 'Units', 'Normalized', 'Position', [-0.11, 0.43]);
legend('$Y$', '$Y_{d}$', 'Interpreter', 'latex')

set(subplot(313), 'Position', [0.15, 0.1, 0.78, 0.22])
plot(t, z, 'b', 'Linewidth', 2)
hold on
plot(t, zd, 'r', 'Linewidth', 2)
grid on;
ylim([0.0 1.5])
xlim([0, t(end)])
y_label = ylabel('$Z$ $\mathrm{\left(m\right)}$', 'Interpreter', 'latex', 'rotation', 0);
set(y_label, 'Units', 'Normalized', 'Position', [-0.11, 0.43]);
xlabel('Time (sec)', 'FontSize', 11);
legend('$Z$', '$Z_{d}$', 'Interpreter', 'latex')
