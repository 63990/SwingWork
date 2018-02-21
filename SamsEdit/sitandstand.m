function [ theta_dot_states ] = sitandstand( time, theta_states )

r_av = 2.5;

g = 9.81;

h = 0.2;
theta_lim = 0.01;
theta_dot_lim = 0.1;
m = 15; % sets rise rate stnading up
n = 25; % sets down rate sitting down
multiplier = 1.1; % increase size of tanh function

% Separate states
theta = theta_states(1);
theta_dot = theta_states(2);

if (theta_dot > 0) && (abs(theta) < theta_lim)
    % As theta approaches 0 from the negative theta direction (theta_dot >
    % 0), the swinger gets to theta = theta_lim. At this point the swinger
    % begins to stand.
    r = r_av + multiplier*h*tanh(m*theta);
    dr_dtheta = (multiplier*h*m)/(cosh(m*theta)^2);
    dr_dtheta_dot = 0;
elseif (theta_dot < 0) && (abs(theta) < theta_lim)
    % As theta approaches 0 from the positive theta direction (theta_dot <
    % 0), the swinger gets to theta = theta_lim. At this point the swinger
    % begins to stand.
    r = r_av + multiplier*h*tanh(-m*theta);
    dr_dtheta = (-multiplier*h*m)/(cosh(-m*theta)^2);
    dr_dtheta_dot = 0;
elseif (theta > 0) && (abs(theta_dot) < theta_dot_lim)
    % As theta increases positively, the swinger goes up to maximum of the swing.
    % Theta_dot decreases as theta goes the the maximum until theta_dot ==
    % theta_dot_lim. At this point the person sits. 
    r = r_av + multiplier*h*tanh(n*theta_dot);
    dr_dtheta = 0;
    dr_dtheta_dot = (multiplier*h*n)/(cosh(n*theta_dot)^2);
elseif (theta < 0) && (abs(theta_dot) < theta_dot_lim)
    % As theta increases negatively, the swinger goes up to maximum of the swing.
    % Theta_dot decreases as theta goes the the maximum until theta_dot ==
    % theta_dot_lim. At this point the person sits. 
    r = r_av + multiplier*h*tanh(-n*theta_dot);
    dr_dtheta = 0;
    dr_dtheta_dot = (-multiplier*h*n)/(cosh(-n*theta_dot)^2);
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

theta_dotdot = -g*sin(theta)...
                /(r);

          
theta_dot_states = [theta_dot,theta_dotdot]';

end