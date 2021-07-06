% read experiment data from bag file and plot the trajectory
close all;

% parameters for plotting
bag_select = "2021-06-19-17-01-adaptive-tune.bag";
length_of_t = 3811;
states_null_x = 420;
states_null_y = 420;
states_null_z = 420;

% read data from bag file
bag = rosbag(bag_select);

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

% plot x and x_d
figure
subplot(311)
plot(t, x, 'b', 'Linewidth', 2)
hold on
plot(t, xd, 'r', 'Linewidth', 2)
y_label = ylabel('$X$', 'Interpreter', 'latex', 'rotation', 0); grid on;
set(y_label, 'Units', 'Normalized', 'Position', [-0.11, 0.47]);
ylim([-1.6 1.6])
xlim([0, t(end)])
legend('$X$', '$X_{d}$', 'Interpreter', 'latex')
title('$Position$ $in$ $the$ $X$ $direction$ $(m)$', 'Interpreter', 'latex')

% plot y and y_d
subplot(312)
plot(t, y, 'b', 'Linewidth', 2)
hold on
plot(t, yd, 'r', 'Linewidth', 2)
y_label = ylabel('$Y$', 'Interpreter', 'latex', 'rotation', 0); grid on;
set(y_label, 'Units', 'Normalized', 'Position', [-0.11, 0.47]);
ylim([-1.5 1.5])
xlim([0, t(end)])
legend('$Y$', '$Y_{d}$', 'Interpreter', 'latex')
title('$Position$ $in$ $the$ $Y$ $direction$ $(m)$', 'Interpreter', 'latex')

% plot z and z_d
subplot(313)
plot(t, z, 'b', 'Linewidth', 2)
hold on
plot(t, zd, 'r', 'Linewidth', 2)
y_label = ylabel('$Z$', 'Interpreter', 'latex', 'rotation', 0); grid on;
set(y_label, 'Units', 'Normalized', 'Position', [-0.11, 0.47]);
ylim([0.5 3.0])
xlim([0, t(end)])
legend('$Z$', '$Z_{d}$', 'Interpreter', 'latex')
title('$Position$ $in$ $the$ $Z$ $direction$ $(m)$', 'Interpreter', 'latex')
