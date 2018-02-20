% Kiiking swing 
% editted from https://gereshes.com/2018/02/19/how-to-pump-a-swing-using-math/
close all

%% Parameters
theta_0 = -0.1;
theta_dot_0 = 0;
theta_states = [theta_0,theta_dot_0];

t_start = 0;
t_end = 10;

sit_r = 2.7;

stand_r = 2.3;

timespan = [t_start,t_end+.0001];

evaluated_t = [0];

all_theta_states = theta_states;

r_vals = stand_r;

options = odeset('Events',@theta0); % Breakout parameters



% Begin the integration 

while (evaluated_t(end)<t_end)

[current_t, evaluated_theta_states]=ode45( @sitandstand,timespan,theta_states,options);

theta_states = evaluated_theta_states(end,:);

evaluated_t = [evaluated_t; current_t];

all_theta_states =[all_theta_states; evaluated_theta_states];

timespan=[evaluated_t(end), t_end+.0001];


% Add in the additional angular momentum from standing up

if(all_theta_states(end-2,1)*all_theta_states(end-2,2)<0)

    theta_states(2) = theta_states(2)*(sit_r/stand_r)^2;

end

end

%Plotting

figure()
plot(all_theta_states(:,1),all_theta_states(:,2))
grid on
grid minor
ylabel('$\dot{\theta}$')
xlabel('$\theta$')

figure()
plot(evaluated_t, all_theta_states(:,1))
ylabel('$\theta$')
xlabel('$t$')

figure()
plot(evaluated_t, all_theta_states(:,2))
hold on
plot(evaluated_t, all_theta_states(:,1))

