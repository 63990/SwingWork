function v_dot = pendulum(~, v)
%PENDULUM Models the behavior of a pendulum
%   v is a vector [theta, theta_dot]'
%   v_dot is a vector [theta_dot, theta_double_dot]'

% Define acceleration due to gravity
g = 9.81; %ms^(-2)

% Unpack the variables
theta = v(1);
theta_dot = v(2);

% Find the radius and derivatives
[r, dr_dtheta, dr_dtheta_dot] = radius(theta, theta_dot);

% Calculate the second time differential of theta
theta_double_dot = (-g*sin(theta) - 2*(theta_dot^2)*dr_dtheta)/...
                         (r + 2*theta_dot*dr_dtheta_dot);

v_dot = [theta_dot, theta_double_dot]';

end
