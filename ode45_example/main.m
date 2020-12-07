% This is an example for ode45 differential equation solver
close all;

% solved by ode45
A = 1;
B = 2;
tspan_1 = [0 5];
tspan_2 = [0 20];
x0 = [0 1];
y0 = [0 0.01];
[t_1, y] = ode45(@(t, y) odefcn(t, y, A, B), tspan_1, y0);
[t_2, x] = ode45(@(t, x) odeverify(t, x), tspan_2, x0);

% solved by hand calculation
dt = 0.001;
sim_t  = 20;
t = 0:dt:sim_t;
x_hand = zeros(length(t), 2);
for i = 1:length(t)
    x_hand(i, 1) = t(i);
    x_hand(i, 2) = 0.5*t(i)*t(i);
end

figure(1)
plot(t_1, y(:, 1), '-o', t_1, y(:, 2), '-.')
legend('$y_{1}$', '$y_{2}$', 'Interpreter', 'latex')
title({'$\dot{y_{1}}=y_{2}$';'$\dot{y_{2}}=\frac{A}{B}ty_{1}$'}, 'Interpreter', 'latex')
xlabel('Time(sec)')

figure(2)
plot(t_2, x(:, 1), '-o', t_2, x(:, 2), '-.')
hold on;
plot(t, x_hand(:, 1), t, x_hand(:, 2));
legend('$x_{1}$', '$x_{2}$', '$x_{1h}$', '$x_{2h}$', 'Interpreter', 'latex')
title({'$\dot{x_{1}}=1$';'$\dot{x_{2}}=t$'}, 'Interpreter', 'latex')
xlabel('Time(sec)')