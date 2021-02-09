function dxdt = ex91(t,x)

dxdt = [x(2); x(1) - 2*atan(x(1) + x(2))];