% Solves the pendulum equation

% Close open figures
close all

%% Declare initial conditions
T_start = 0;
T_end = 200 ;
t = T_start:0.01:T_end;
theta_dot0 = -0.15;
theta0 = pi/33;

%% Solve the eqaution
options = odeset('RelTol', 1e-4,'AbsTol',1e-7);
[~, v] = ode45(@pendulum, t, [theta0, theta_dot0],options);

%% Extract values
theta = wrapToPi(v(:,1));
theta_dot = v(:,2);

%% Plot results
figure
plot(t, theta);

rads = zeros(length(t),1);
drad_dtheta = zeros(length(t),1);
drad_dtheta_dot = zeros(length(t),1);
for i = 1:length(theta)
[rads(i,1),drad_dtheta(i,1), drad_dtheta_dot(i,1)] = radius(theta(i),theta_dot(i));
end

hold on
plot(t,(rads-10))

yticks([-pi/2 -3*pi/8 -pi/4 -pi/8 0 pi/8 pi/4 3*pi/8 pi/2])
set(gca, 'TickLabelInterpreter', 'latex',...
    'yticklabels', {'$-\frac{\pi}{2}$','$-\frac{3\pi}{8}$','$-\frac{\pi}{4}$','$-\frac{\pi}{8}$','$0$','$\frac{\pi}{8}$','$\frac{\pi}{4}$','$\frac{3\pi}{8}$','$\frac{\pi}{2}$'},...
    'fontsize', 18)
xlabel('time (s)')
ylabel('$\theta$ (rad.)','interpreter','latex')
hold off

% Sanity checks
figure
plot(theta, theta_dot)
xlabel('$\theta$','interpreter','latex')
ylabel('$\dot{\theta}$','interpreter','latex')

figure
plot(t,theta)
hold on
plot(t,theta_dot)
legend({'$\theta$','$\dot{\theta}$'},'interpreter','latex')
