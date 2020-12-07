function dxdt = odeverify(t, x)
% dx1/dt = 1
% dx2/dt = t
dxdt = zeros(2, 1);
dxdt(1) = 1;
dxdt(2) = t;