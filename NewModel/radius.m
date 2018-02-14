function [r, dr_dtheta, dr_dtheta_dot] = radius(theta, theta_dot)
%RADIUS How the effective radius of the pendulum varies in time

theta_dot_lim = 0.1;
theta_lim = pi/6;
h = 0.1; % half the possible change in radius
r_av = 0.9; % average radius
m = 20; % sets rise rate stnading up
n = 20; % sets down rate sitting down

if (theta_dot > 0) && (abs(theta) < theta_lim)
    r = r_av + h*tanh(m*theta);
    dr_dtheta = (h*m)/(cos(m*theta)^2);
    dr_dtheta_dot = 0;
elseif (theta_dot < 0) && (abs(theta) < theta_lim)
    r = r_av + h*tanh(-m*theta);
    dr_dtheta = (-h*m)/(cos(-m*theta)^2);
    dr_dtheta_dot = 0;
elseif (theta > 0) && (abs(theta_dot) < theta_dot_lim)
    r = r_av - h*tanh(n*theta_dot);
    dr_dtheta = 0;
    dr_dtheta_dot = (-h*n)/(cos(n*theta_dot)^2);
elseif (theta < 0) && (abs(theta_dot) < theta_dot_lim)
    r = r_av - h*tanh(-n*theta_dot);
    dr_dtheta = 0;
    dr_dtheta_dot = (h*n)/(cos(-n*theta_dot)^2);
elseif (theta*theta_dot) > 0
    r = r_av + h;
    dr_dtheta = 0;
    dr_dtheta_dot = 0;
else
    r = r_av - h;
    dr_dtheta = 0;
    dr_dtheta_dot = 0;
end


