function [r, dr_dtheta, dr_dtheta_dot] = radius(theta, theta_dot)
%RADIUS How the effective radius of the pendulum varies in time

% return the radius and derivatives (*CURRENTLY CONSTANT RADIUS*)
r = 1;
dr_dtheta = 0*theta;
dr_dtheta_dot = 0*theta_dot;
end

