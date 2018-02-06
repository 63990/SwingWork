function [r_dot, r] = body(theta_dot, theta)
%BODY Describe how the body move in time (r(t) and r'(t))
%   Set R_Method
R_method = 1;


%% R_method = 1
%{
The person stands up once they are past the lowest point in the swing.
They crouch down once they are coming down.
In this case the person stands up instantly so can be considered a square
wave: __|--|__
%}
    if R_method == 1
        if (theta>0 && theta_dot>0) || (theta<0 && theta_dot<0)
            r=1;
        else 
            r=0.8;
        end
        
        r_dot = 0;
    end

%% if R_method = 2
%{
The person stands up once they are past the lowest point in the swing.
They crouch down once they are coming down.
In this case the person stands up over a period of time: __/--\__
%}



end

