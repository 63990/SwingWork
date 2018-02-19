function [r, dr_dtheta, dr_dtheta_dot] = radius(theta, theta_dot)
%RADIUS How the effective radius of the pendulum varies in time

theta_dot_lim = 0.01;
theta_lim = 0.1;
h = 0.05; % half the possible change in radius
r_av = 10; % average radius
m = 15; % sets rise rate stnading up
n = 5; % sets down rate sitting down


if (theta_dot > 0) && (abs(theta) < theta_lim)
    % As theta approaches 0 from the negative theta direction (theta_dot >
    % 0), the swinger gets to theta = theta_lim. At this point the swinger
    % begins to stand.
    r = r_av + h*tanh(m*theta);
    dr_dtheta = (h*m)/(cos(m*theta)^2);
    dr_dtheta_dot = 0;
elseif (theta_dot < 0) && (abs(theta) < theta_lim)
    % As theta approaches 0 from the positive theta direction (theta_dot <
    % 0), the swinger gets to theta = theta_lim. At this point the swinger
    % begins to stand.
    r = r_av + h*tanh(-m*theta);
    dr_dtheta = (-h*m)/(cos(-m*theta)^2);
    dr_dtheta_dot = 0;
elseif (theta > 0) && (abs(theta_dot) < theta_dot_lim)
    % As theta increases positively, the swinger goes up to maximum of the swing.
    % Theta_dot decreases as theta goes the the maximum until theta_dot ==
    % theta_dot_lim. At this point the person sits. 
    r = r_av + h*tanh(n*theta_dot);
    dr_dtheta = 0;
    dr_dtheta_dot = (h*n)/(cos(n*theta_dot)^2);
elseif (theta < 0) && (abs(theta_dot) < theta_dot_lim)
    % As theta increases negatively, the swinger goes up to maximum of the swing.
    % Theta_dot decreases as theta goes the the maximum until theta_dot ==
    % theta_dot_lim. At this point the person sits. 
    r = r_av + h*tanh(-n*theta_dot);
    dr_dtheta = 0;
    dr_dtheta_dot = (-h*n)/(cos(-n*theta_dot)^2);
elseif (theta*theta_dot) > 0
    % If theta and theta_dot are both the same sign then the swinger is 
    % accelerating towards the maximum of the swing. In this case they should
    % be standing.
    r = r_av + h;
    dr_dtheta = 0;
    dr_dtheta_dot = 0;
else
    % If theta and theta_dot are different signs then the swinger is 
    % accelerating towards theta = 0. In this case they should be sitting.
    r = r_av - h;
    dr_dtheta = 0;
    dr_dtheta_dot = 0;
end
% 
% if (theta < 0.1) && (theta > -0.1) 
%     If theta and theta_dot are both the same sign then the swinger is 
%     accelerating towards the maximum of the swing. In this case they should
%     be standing.
%     r = r_av + h;
%     dr_dtheta = 0;
%     dr_dtheta_dot = 0;
% else
%     If theta and theta_dot are different signs then the swinger is 
%     accelerating towards theta = 0. In this case they should be sitting.
%     r = r_av - h;
%     dr_dtheta = 0;
%     dr_dtheta_dot = 0;
% end