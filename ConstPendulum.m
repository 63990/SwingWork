function v_dot = ConstPendulum(~, v)
%PENDULUM The pendulum equation, transfomred to 1st order, with constant r
g = 9.81;
l = 1;
v_dot = [-(g/l)*sin(v(2)), v(1)]';
end
