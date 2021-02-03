function dxdt = odefun(t,x, a11, a12, a21, a22)
dxdt = zeros(2,1);
dxdt(1) = a11*x(1)+a12*x(2);
dxdt(2) = a21*x(1)+a22*x(2);
end