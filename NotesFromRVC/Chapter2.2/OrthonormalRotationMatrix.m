% Computing elementary rotation matrices of 3D coordinate frames

% Doing a rotation about the x-axis
R = rotx(pi/2);
disp("A rotation about the x-axis")
disp(R)
% trplot(R)
% To do a rotation about the other axis use
% roty & rotz

% NB: The rotation matrix represents a pose

% Visulaizing the rotation of the matrix roation matrix R
tranimate(R)

% Visualizes in 3d 
% tranimate(R, '3d')

% Example of compounding or combining of rotation
% First we rotate it about its x-axis and the it's y-axis
R = rotx(pi/2) * roty(pi/2);
disp("Rotating first in about the x-axis and then the y-axis")
disp(R)
% trplot(R)


% Reversing the roation above
R = roty(pi/2) * rotx(pi/2);
disp("Rotating first in about the y-axis and then the x-axis")
disp(R)
% trplot(R)