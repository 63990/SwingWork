function [F] = findforce(r, theta, theta_dot, t, m)
% FINDFORCE find the force in the kiikers legs
%
% INPUTS
% r         :the radial distance from pivot to COM as a function of time
% theta     :the angle of the swing as a function of time
% theta_dot :the first time derivative of theta
% t         :time
% m         :mass of kiiker
% 
% OUTPUTS
% F         :the tension in the swing arm and therefore the force in the
%            kiikers legs
%
% METHOD
% From the derivation of the pendulum equation using newton's second law in
% polar coordinates we have the following expresion for force in the radial
% direction:
% 
%         r_double_dot - r*(theta_dot^2) = g*cos(theta) - F/m           (1)
% 
% giving
%
%        F = m*(r*(theta_dot^2) + g*cos(theta) - r_double_dot)          (2)
%
% where r_double_dot is the second time derivative of r, g is acceleration
% due to gravity and all other variables are desribed above.
% 
% r_double_dot is found using the central difference equation and the F is 
% found using (2).

%% Find r_double_dot
% Central difference approximation:
%
%                     f(x - h) - 2*f(x) + f(x + h)
%            f"(x) ~= ----------------------------                      (3)
%                                 h^2
%
% Forward difference approximation:
%
%                     f(x) - 2*f(x + h) + f(x + 2*h)
%            f"(x) ~= ------------------------------                    (4)
%                                 h^2
%
% Backward difference approximation:
%
%                     f(x - 2*h) - 2*f(x - h) + f(x)
%            f"(x) ~= ------------------------------                    (5)
%                                 h^2

% Use (3) to find interior points
% find numerator
num = r(1:end-2) - 2*r(2:end-1) + r(3:end);
% find denominator using average h (dt) around r
den = ((t(3:end) - t(1:end-2))/2).^2;
r_double_dot_mid = num./den';
size(r_double_dot_mid)

% Noting that the change from (3) to (4) and (5) is just a notation shift 
% we can say:
% f"(1) = f"(2) and f"(end) = f"(end-1)
r_double_dot = [r_double_dot_mid(1); r_double_dot_mid; r_double_dot_mid(end)];

%% Find force using (2)
g = 9.81; % m*s^(-2)
F = m*(r.*(theta_dot.^2) + g*cos(theta) - r_double_dot);
end

