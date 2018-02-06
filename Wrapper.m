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

% Plotting
figure;
plot(t, wrapToPi(v(:,2)));
title('Oscillation Change');
xlabel('time (s)');
ylabel('theta (rad)');