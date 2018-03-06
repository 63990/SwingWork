%% set global m and n
global shift
shift_mat = -0.1:0.025:0;

figure();
hold on

%% Loop for varying m and n
for i=1:1:5
    
%% Set shift value
shift=shift_mat(i);

%solve model
solvemodel

%% Envolope (find and add upper to plot)
[upper,lower] = envelope(theta,5,'peak');
figure(10)
plot(t,upper)
hold on;

%% Save variables to file
filename = sprintf('Varyingvals_shift_%d.mat', shift);
save(filename)

end

