%% set global m and n
global shift
%setting too high a shift breats equation (max ~~ 0.12)
shift_mat = -0.09:0.03:0.09;


%% Loop for varying m and n
for i=1:1:7
    
%% Set shift value
shift=shift_mat(i);

%solve model
solvemodel

%% Envolope (find and add upper to plot)
[upper,lower] = envelope(theta,25,'peak');
plot(t,upper)
hold on;

%% Save variables to file
filename = sprintf('Varyingvals_shift_%d.mat', shift);
save(filename)

end

legend('-0.09','-0.06','-0.03','+0.00','+0.03','+0.06','+0.09')
