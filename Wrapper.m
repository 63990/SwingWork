% This is a wrapper which solves and plots the function VarPendulum

% Close all previous things and clear memory
close all;
% clear all;

% Set inital parameters
T_start = 0;
T_end = 20;
theta_dot0 = 0;
theta0 = pi/32;

% Solve t and v 
[t, v] = ode45(@VarPendulum, [T_start T_end], [theta_dot0 theta0]);
theta = v(:,2);
theta_dot = v(:,1);

r = zeros(length(theta));
for i = 1:length(theta)
[~, r(i)] = body(theta_dot(i),theta(i));
end
% Plotting
figure;
hold on;
plot(t, wrapToPi(v(:,2)));
plot(t, r-0.9);
title('Oscillation Change');
xlabel('time (s)');
ylabel('theta (rad)');