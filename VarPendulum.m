function v_dot = VarPendulum(~, v)
%VARPENDULUM The pendulum equation for changing r.

g = 9.81;
theta = v(2);
theta_dot = v(1);
[r_dot, r] = body(theta_dot, theta);
v_dot = [(2*r_dot*theta_dot - g*sin(theta))/r, theta_dot]';
end
