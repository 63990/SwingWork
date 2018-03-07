t=0:pi/10000:8*pi;
theta=sin(t);
theta_dot=cos(t);
r=t;
global shift
shift_mat = -0.1:0.1:0.1;

for j=1:1:3
    shift=shift_mat(j);
for i=1:1:80001
    [r(j,i), dr_dtheta, dr_dtheta_dot] = radius(theta(i), theta_dot(i));
end
    plot(t,r(j,:)-7)
    hold on
end

plot(t,theta)
hold on
plot(t,theta_dot)