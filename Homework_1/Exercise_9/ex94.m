function dxdt = ex94(t,x)

dxdt = [x(1)+x(2)-x(1)*(abs(x(1))+abs(x(2))); -2*x(1)+x(2)-x(2)*(abs(x(1))+abs(x(2)))];