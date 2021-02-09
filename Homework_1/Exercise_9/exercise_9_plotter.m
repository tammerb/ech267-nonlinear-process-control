clear
clc

tspan = linspace(0,5, 100);
n = .01; % plot scaling factor
m = .01; % other plot scaling factor

x0a = [0,1*m];
x0b = [1*n,1*n];
x0c = [1*m,0];
x0d = [-1*n,1*n];
x0e = [-1*m,0];
x0f = [-1*n,-1*n];
x0g = [0,-1*m];
x0h = [1*n,-1*n];
x_initial_conditions = [x0a; x0b; x0c; x0d; x0e; x0f; x0g; x0h];
k = 8;
x_trajectories = zeros(100,2,k);


for i = 1:k
    [~,x] = ode45(@ex93,tspan, x_initial_conditions(i,:));
    x_trajectories(:,:,i) = x;
end

s = 70; % arrow locations
as = 0.7; % arrow scaling factor

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
xlim([-1,1])
ylim([-1,1])
hold off