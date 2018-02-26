%% set global m and n
global m_g n_g
m_mat = 5:2:15;
n_mat = 5:4:25;

figure();
hold on

%% Loop for varying m and n
for i=1:1:6
for j=1:1:6
    
    %% Set m and n values
m_g=m_mat(i);
n_g=n_mat(j);

solvemodel

%% Envolope (find and add upper to plot)
[upper,lower] = envelope(theta,10,'peak');
plot(t,upper)
hold on;

%% Save variables to file
filename = sprintf('Varyingvals_m.%d_n.%d.mat', m_g,n_g);
save(filename)

end
end

