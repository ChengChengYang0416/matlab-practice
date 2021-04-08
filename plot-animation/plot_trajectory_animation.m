% M2 M1
%   X
% M3 M4
close all;
delta_t = 0.01;
t = 0:delta_t:10;
central = zeros(3, length(t));                              % coordinate for central of uav
M1 = zeros(3, length(t));                                   % coordinate for motor_1 (right front)
M2 = zeros(3, length(t));                                   % coordinate for motor_2 (left front)
M3 = zeros(3, length(t));                                   % coordinate for motor_3 (left rear)
M4 = zeros(3, length(t));                                   % coordinate for motor_4 (right rear)

curve = animatedline('LineWidth', 0.5);                     % create line in animation
set(gca, 'XLim', [0 10], 'YLim', [0 10], 'ZLim', [0 10]);   % set the x, y, z axis in animation
view(-25, 20);                                              % set the view
grid on;
hold on;
xlabel('$X(m)$', 'Interpreter','latex'), ylabel('$Y(m)$', 'Interpreter','latex'), zlabel('$Z(m)$', 'Interpreter','latex', 'rotation', 0);

for i = 1:length(t)
    % produce the trajectory of the multirotor
    if(i == 1)
        central(:, i) = 1;

    elseif(i < 200)
        central(1, i) = central(1, i-1) + 2*delta_t;
        central(2, i) = central(2, i-1) + 2*delta_t;
        central(3, i) = central(3, i-1);

    elseif(i < 400)
        central(1, i) = central(1, i-1);
        central(2, i) = central(2, i-1);
        central(3, i) = central(3, i-1) + delta_t;

    elseif(i < 600)
        central(1, i) = central(1, i-1) - 0.5*delta_t;
        central(2, i) = central(2, i-1) + 2*delta_t;
        central(3, i) = central(3, i-1) - 0.2*delta_t;

    else
        central(1, i) = central(1, i-1) + 1.2*delta_t;
        central(2, i) = central(2, i-1) - 0.5*delta_t;
        central(3, i) = central(3, i-1) + delta_t;
    end

    % position of each motor
    M1(1, i) = central(1, i) + 0.5;
    M2(1, i) = central(1, i) - 0.5;
    M3(1, i) = central(1, i) - 0.5;
    M4(1, i) = central(1, i) + 0.5;
    M1(2, i) = central(2, i) + 0.5;
    M2(2, i) = central(2, i) + 0.5;
    M3(2, i) = central(2, i) - 0.5;
    M4(2, i) = central(2, i) - 0.5;
    M1(3, i) = central(3, i);
    M2(3, i) = central(3, i);
    M3(3, i) = central(3, i);
    M4(3, i) = central(3, i);

    % add the points of the motors and central of the multirotors on the figure
    addpoints(curve, central(1, i), central(2, i), central(3, i));
    head = scatter3(central(1, i), central(2, i), central(3, i), 'filled', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'b');
    line_M1 = line([M1(1, i) central(1, i)], [M1(2, i) central(2, i)], [M1(3, i) central(3, i)], 'Color', 'g', 'LineWidth', 1, 'Marker', 'x');
    line_M2 = line([M2(1, i) central(1, i)], [M2(2, i) central(2, i)], [M2(3, i) central(3, i)], 'Color', 'g', 'LineWidth', 1, 'Marker', 'x');
    line_M3 = line([M3(1, i) central(1, i)], [M3(2, i) central(2, i)], [M3(3, i) central(3, i)], 'Color', 'g', 'LineWidth', 1, 'Marker', 'x');
    line_M4 = line([M4(1, i) central(1, i)], [M4(2, i) central(2, i)], [M4(3, i) central(3, i)], 'Color', 'g', 'LineWidth', 1, 'Marker', 'x');
    drawnow;
    
    % save for video
    F(i) = getframe(gcf);
    
    % delete the past points and lines
    delete(head);
    delete(line_M1);
    delete(line_M2);
    delete(line_M3);
    delete(line_M4);
end

% the last points and lines
scatter3(central(1, length(t)), central(2, length(t)), central(3, length(t)), 'filled', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'b');
line_M1 = line([M1(1, length(t)) central(1, length(t))], [M1(2, length(t)) central(2, length(t))], [M1(3, length(t)) central(3, length(t))], 'Color', 'g', 'LineWidth', 1, 'Marker', 'x');
line_M2 = line([M2(1, length(t)) central(1, length(t))], [M2(2, length(t)) central(2, length(t))], [M2(3, length(t)) central(3, length(t))], 'Color', 'g', 'LineWidth', 1, 'Marker', 'x');
line_M3 = line([M3(1, length(t)) central(1, length(t))], [M3(2, length(t)) central(2, length(t))], [M3(3, length(t)) central(3, length(t))], 'Color', 'g', 'LineWidth', 1, 'Marker', 'x');
line_M4 = line([M4(1, length(t)) central(1, length(t))], [M4(2, length(t)) central(2, length(t))], [M4(3, length(t)) central(3, length(t))], 'Color', 'g', 'LineWidth', 1, 'Marker', 'x');

% produce the video
video = VideoWriter('quadrotor_animation.avi', 'Uncompressed AVI');
video.FrameRate = 120;
open(video)
writeVideo(video, F);
close(video)
