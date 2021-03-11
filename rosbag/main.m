%% bag reading
close all;

% create BagSelection object, check the AvailableTopics
bag = rosbag("33-51-91.bag");

%% simulation time
sim_t = 50;

% select subset messages filtered by the topic 'clock'
clock_error = select(bag, 'topic', 'clock');

% read data with structures
clock_error_msgStructs = readMessages(clock_error, 'DataFormat', 'struct');

% return data in a cell array
time_error = cellfun(@(m) double(m.Clock_.Sec), clock_error_msgStructs);
total_time_error = time_error(end) - time_error(1);
time_ratio_error = sim_t/total_time_error;


%% reading error
error = select(bag, 'topic', '/error');
error_msgStructs = readMessages(error, 'DataFormat', 'struct');

% check MessageType
error_msgStructs{1}

% return data in a cell array
error_position_x = cellfun(@(m) double(m.Pose.Pose.Position.X), error_msgStructs);
error_position_y = cellfun(@(m) double(m.Pose.Pose.Position.Y), error_msgStructs);
error_position_z = cellfun(@(m) double(m.Pose.Pose.Position.Z), error_msgStructs);

error_position_x = error_position_x(1:(int32((length(error_position_x)*time_ratio_error))));
error_position_y = error_position_y(1:(int32((length(error_position_y)*time_ratio_error))));
error_position_z = error_position_z(1:(int32((length(error_position_z)*time_ratio_error))));

t_error = linspace(0, sim_t, length(error_position_x));

%% plot
figure(1)

% error in x-direction
subplot(3, 1, 1);
plot(t_error, error_position_x, 'LineWidth', 1.5);
y = ylabel('$e_{p_{x}}$', 'Interpreter', 'latex', 'rotation', 0); grid on;
set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.41], 'FontSize', 10);
title('$Position$ $Error$ $(m)$', 'Interpreter', 'latex', 'FontSize', 10)

% error in y-direction
subplot(3, 1, 2);
plot(t_error, error_position_y, 'LineWidth', 1.5);
y = ylabel('$e_{p_{y}}$', 'Interpreter', 'latex', 'rotation', 0); grid on;
set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.41], 'FontSize', 10);

% error in z-direction
subplot(3, 1, 3);
plot(t_error, error_position_z, 'LineWidth', 1.5);
y = ylabel('$e_{p_{z}}$', 'Interpreter', 'latex', 'rotation', 0); grid on;
set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.41], 'FontSize', 10);
xlabel('$Time(sec)$', 'Interpreter', 'latex');
