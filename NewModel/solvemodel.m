% Solves the pendulum equation
%% Declare initial conditions
T_start = 0;
T_end = 20;
theta_dot0 = -1.5;
theta0 = pi/33;

%% Solve the eqaution
[t, v] = ode45(@pendulum, [T_start T_end], [theta0, theta_dot0]);

%% Extract values
theta = wrapToPi(v(:,1));
theta_dot = v(:,2);

%% Plot results
plot(t, theta);