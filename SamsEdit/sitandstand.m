function [ theta_dot_states ] = sitandstand( time, theta_states )

r_0 = 2.5;

g = 9.81;

dr = 0.2;

% Separate states
theta = theta_states(1);
theta_dot = theta_states(2);
if ((theta*theta_dot)>0)

    r = r_0 + dr; %Sitting

else

    r = r_0 - dr; %Standing

end

theta_dotdot = -g*sin(theta)...
                /(r);

          
theta_dot_states = [theta_dot,theta_dotdot]';

end