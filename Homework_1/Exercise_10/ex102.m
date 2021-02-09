function dxdt = ex102(t,x)

dxdt = [x(2); x(1) + x(2)- 3*atan(x(1) + x(2))];