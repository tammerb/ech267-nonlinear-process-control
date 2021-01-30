clear
clc

syms k1 k2
k1 = 2;
k2 = 1;
A = [[-k1 0 0]; [k1 -k2 0]; [0 k2 0]];
B = zeros(3,1);
C = [1 0 0];
D = zeros(1,1);

sys = ss(A,B,C,D);
x0 = [1 0 0];

[y,t,x] = initial(sys, x0);
plot(t, x)
legend('cA', 'cB', 'cC')
xlabel('Time')
ylabel('Concentration (mol/vol)')
title('Simulation of chemical reaction model')