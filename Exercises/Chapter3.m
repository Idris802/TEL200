%% 3.7

% tpoly(0, 1, 50, 1, 0)

% This shows the initial and final velocity to be 0 when
% plotting the trajectory from 0 to 1. The motion is smooth.

% Putting in the fourth argument for a high initial velocity 
% leads to a significant overshoot. Due to high velocity it
% takes time to slow down, therefor the trajectory will backtrack
% tpoly(0, 1, 50, 1, 0)

% a large final velocity 
tpoly(0, 1, 50, 0, 1)

%% 3.8

lspb(0, 1, 50, 0.021) % for smaller initial velocity 
                      % the velocity tends to be constant at zero

                      
lspb(0, 1, 50, 0.039) % for larger initial velocity 
                      % the velocity tends to increase 
                      % at a constant rate and then 
                      % decrease at a constant rate




% The minimum bound of lspb is 0.021 and the max is 0.04
                   