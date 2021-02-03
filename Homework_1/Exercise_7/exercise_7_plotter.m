clc
clear

a11 = 0;
a12 = -1;
a21 = 1;
a22 = 2;

m1 = 1;
m2 = 0;
m3 = 0;
m4 = 1;

tspan = linspace(0,5);

x0a = [1,0]
x0b = [2,0]
x0c = [3,0]
x0d = [4,0]
x0e = [5,0]
x0f = [-1,0]
x0g = [-2,0]
x0h = [-3,0]
x0i = [-4,0]
x0j = [-5,0]
x_initial_conditions = [x0a; x0b; x0c; x0d; x0e; x0f; x0g; x0h; x0i; x0j];

z0a = [1,-.2];
z0b = [1,.2];
z0c = [-1,-.6];
z0d = [-1,.6];
z0e = [1,-1];
z0f = [1,1];
z0g = [-1,-1.4];
z0h = [-1,1.4];
z0i = [1,-1.8];
z0j = [1,1.8];

z_initial_conditions = [z0a; z0b; z0c; z0d; z0e; z0f; z0g; z0h; z0i; z0j];
k =10;
x_trajectories = zeros(100,2,k);
z_trajectories = zeros(100,2,k);

for i = 1:k
    [~, x] = ode45(@(t,x) odefun(t,x, a11, a12, a21, a22), tspan, x_initial_conditions(i,:));
    x_trajectories(:,:,i) = x;
    [~, z] = ode45(@(t,z) odefun(t,z, m1, m2,m3, m4), tspan, z_initial_conditions(i,:));
    z_trajectories(:,:,i) = z;
end


s = 20; % arrow locations
zs= 40; % arrow locations offset for z plots

as = .05; % arrow scaling factor
zas = 40; % arrow scaling factor for z plots

tiledlayout(1,2)
nexttile
plot(x_trajectories(:,1,1), x_trajectories(:,2,1))
arrowhead([x_trajectories(9,1,1) x_trajectories(11,1,1)],[x_trajectories(9,2,1) x_trajectories(11,2,1)], 'black', [as as], 2);
hold on
for j = 2:k
    plot(x_trajectories(:,1,j), x_trajectories(:,2,j))
    arrowhead([x_trajectories(s,1,j) x_trajectories(s+1,1,j)],[x_trajectories(s,2,j) x_trajectories(s+1,2,j)], 'black', [as as], 2);
end
title('Original Coordinates')
xlabel('x1')
ylabel('x2')
xlim([-10,10])
ylim([-10,10])
hold off

nexttile
plot(z_trajectories(:,1,1), z_trajectories(:,2,1))
arrowhead([z_trajectories(s+zs,1,1) z_trajectories(s+1+zs,1,1)],[z_trajectories(s+zs,2,1) z_trajectories(s+1+zs,2,1)], 'black', [as*zas as*zas*.5], 2);
hold on
for j = 2:k
    plot(z_trajectories(:,1,j), z_trajectories(:,2,j))
    arrowhead([z_trajectories(s+zs,1,j) z_trajectories(s+1+zs,1,j)],[z_trajectories(s+zs,2,j) z_trajectories(s+1+zs,2,j)], 'black', [as*zas as*zas*.5], 2);
end
title('Modal Coordinates')
xlabel('z1')
ylabel('z2')
xlim([-50,50])
ylim([-50,50])
hold off
