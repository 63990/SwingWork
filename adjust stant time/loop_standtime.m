%% set global m and n
global shift
%setting too high a shift breats equation (max ~~ 0.12)
shift_mat = -0.15:0.0001:0.15;
times_mat=200*ones(length(shift_mat),1);

%% Loop for varying m and n
for i=1:1:length(shift_mat)
    
%% Set shift value
shift=shift_mat(i)

%solve model
solvemodel

%% Envolope (find and add upper to plot)
%[upper,lower] = envelope(theta,100,'peak');
%plot(t,upper)
%hold on;

%% Save variables to file
%filename = sprintf('Varyingvals_shift_%d.mat', shift);
%save(filename)

%%Find when gets to full rotation
for j=2:1:length(t)
    if (theta(j-1)*theta(j))<-1
        break
    end
end
times_mat(i,1)=t(j);
% k=find(theta>3.13,1);
% if isempty(k)
%     k=t(end);
% else
%     times_mat(i,1)=t(k);
% end

end

%legend('-0.09','-0.06','-0.03','+0.00','+0.03','+0.06','+0.09')

figure
plot(shift_mat,times_mat)
