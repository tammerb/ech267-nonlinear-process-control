function dxdt = ex92(t,x)

dxdt = [x(2); -x(1) + x(2)*(1 - 3*x(1)^2 - 2*x(2)^2)];