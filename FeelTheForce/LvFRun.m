clear
global m_g n_g
m_g = 0.5;
n_g = 25;
mass = 71;
solvemodel
F = findforce(rads,theta,theta_dot,t,mass);
plot(t,F)
hold on
plot(t,theta*1e4)
plot(t,(rads-5.53)*1e4)