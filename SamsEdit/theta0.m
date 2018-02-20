function [position,isterminal,direction] = theta0(t,y)

position = y(1); % The value that we want to be zero

isterminal = 1;  % Halt integration 

direction = 0;   % The zero can be approached from either direction

end