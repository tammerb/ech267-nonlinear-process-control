clear
clc

tspan = linspace(0,10, 200);
% n = 5; % plot scaling factor
% m = 4; % other plot scaling factor
% nn = 1.9;
% mm = 7;

x0a = [1,0];
x0b = [2,0];
x0c = [3,0];
% x0d = [.56,0];
% x0e = [.6,0];
% x0f = [-10,3.6];
% x0g = [-10,3.5];
% x0h = [-10,3.4];
% x0i = [10,-5];
% x0j = [10,-4];
% x0k = [10,-3.8];
% x0l = [10,-3.7];
% x0m = [10,-3.6];
% x0n = [10,-3.6];
% x0o = [10,-3.5];
% x0p = [10,-3.4];
% x_initial_conditions = [x0a; x0b; x0c; x0d; x0e; x0f; x0g; x0h; x0i; x0j; x0k; x0l; x0m; x0n; x0o; x0p];x_initial_conditions = [x0a; x0b; x0c; x0d; x0e; x0f; x0g; x0h; x0i; x0j; x0k; x0l; x0m; x0n; x0o; x0p];
x_initial_conditions = [x0a; x0b; x0c];
k = 3;
x_trajectories = zeros(200,2,k);


for i = 1:k
    [~,x] = ode45(@ex103,tspan, x_initial_conditions(i,:));
    x_trajectories(:,:,i) = x;
end

s = 1; % arrow locations
as = 3; % arrow scaling factor

plot(x_trajectories(:,1,1), x_trajectories(:,2,1))
arrowhead([x_trajectories(s,1,1) x_trajectories(s+1,1,1)],[x_trajectories(s,2,1) x_trajectories(s+1,2,1)], 'black', [as as], 2);
hold on
for j = 2:k
    plot(x_trajectories(:,1,j), x_trajectories(:,2,j))
    arrowhead([x_trajectories(s,1,j) x_trajectories(s+1,1,j)],[x_trajectories(s,2,j) x_trajectories(s+1,2,j)], 'black', [as as], 2);
end
title('Phase Diagram')
xlabel('x1')
ylabel('x2')
xlim([-10,10])
ylim([-10,10])
hold off