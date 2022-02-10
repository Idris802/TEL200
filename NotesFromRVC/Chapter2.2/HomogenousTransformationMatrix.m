% A Homogenous matrix transformation is defined by
T = transl(1, 0, 0) * trotx(pi/2) * transl(0, 1, 0);
disp(T)
% First we take a step of 1 unit in the x-direction with 
% then we rotate pi/2 or 90 degrees around the x-axis, and
% then finally we take a walk along the y axis whis was 
% previosuly the z axis.

% Plotting the coordinate frame of the transformation
trplot(T)

% The rotation matrix of the transformation T is given by
TransformationToRotation = t2r(T);
disp(TransformationToRotation)

% The translational components is given by
disp(transl(T)')
