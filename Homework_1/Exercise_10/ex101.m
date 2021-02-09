function dxdt = ex101(t,x)

dxdt = [-x(2); x(1) - x(2)*(1 - x(1)^2 + 0.1*x(1)^4)];