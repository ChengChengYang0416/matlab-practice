function dydt = odefcn(t, y, A, B)
% dy1/dt = y2
% dy2/dt = (A/B)*t*y1
dydt = zeros(2, 1);
dydt(1) = y(2);
dydt(2) = (A/B)*t.*y(1);