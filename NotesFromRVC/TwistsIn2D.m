C = [1 2]';

% Twist creates a vector with two components about point C
tw = Twist('R', C);

% creating a SE(2) transformation for a unit twist 
% by 2 radians
T = tw.T(2);

% The center of the rotation or the pole of the 
% transformation can be found from
CenterOfTransformation = tw.pole;

% Creating a translational motion in the direction of (1, 1)
tw = Twist('T', [1 1]); % Gives (0.70711 0.70711; 0)
Transform = tw.T(sqrt(2));

T = transl2(2, 3) * trot2(0.5);
disp("This is the original tranformation")
disp(T)


tw = Twist(T); % This give (2.7082 2.4372; 0.5) where 0.5 is the radians

% then our original homogenous transformation is given by 
OriginalT = tw.T;
% no additional arguments are given because in our tw the radians is 
% implicit
disp("From twist back to original transformation.")
disp(OriginalT)