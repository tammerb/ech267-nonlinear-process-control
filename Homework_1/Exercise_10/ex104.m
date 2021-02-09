function dxdt = ex103(t,x)
syms phi(y)
phi(y) = piecewise(abs(y)<=1, y^3+0.5*y, abs(y)>1, 2*y-0.5*sign(y));
p = double(phi(x(1) - x(2)));
dxdt = [x(2); -x(2) - 1.0*p];