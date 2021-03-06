% Implementing ZYZ sequence of the 3-angle representation of 
% Euler's rotation
R = rotz(0.1) * roty(0.2) * rotz(0.3);
disp("Rotation about three axis")
disp(R)

% The rotation of the three angles can be done more efficiently
%                   phi|theta|psi
RotationZYZ = eul2r(0.1, 0.2, 0.3);
disp("Rotation about three axis ZYZ using eul2r")
disp(RotationZYZ)

% Converting our transformation to euler angles using the 
% inverse function 
EulerAngles = tr2eul(RotationZYZ);
disp("The euler angles of ZYZ sequence of rotation are")
disp(EulerAngles)

%                     phi|theta|psi
RotationZYZ = eul2r(0.1, -0.2, 0.3);
disp("Rotation about three axis ZYZ using eul2r where " + ...
    "theta = -0.2")
disp(RotationZYZ)

EulerAngles = tr2eul(RotationZYZ);
disp("Eulerangles of ZYZ sequence of rotation are for when " + ...
    "theta=-0.2")
disp(EulerAngles)

% The corresponding rotation matrix
RotationMatrixZYZ = eul2r(EulerAngles);
disp("Original rotation matrix is restored by the euler angles " + ...
    "by taking the rotation about the three axis ZYZ")
disp(RotationMatrixZYZ)


% Creating a rotation matrix for when theta = 0, about the
% axis ZYZ
RotationMatrixZYZ = eul2r(0.1, 0, 0.3);
disp("The roatation matrix about axis ZYZ for when theta = 0 " + ...
    "is: ")
disp(RotationMatrixZYZ)

% Taking the inverse of the matrix gives the euler angles
EulerAngles = tr2eul(RotationMatrixZYZ);
disp("theta = 0 gives the identinty matrix for the rotation " + ...
    "about y axis, hence the resulting in a multiplication " + ...
    "of two matrices about the same axis which is the sum " + ...
    "of the two angles about that axis.")
disp(EulerAngles)

% Rotation in the ZYX sequnece is given by 
% rpy2r(ty, tp, tr)
R = rpy2r(0.1, 0.2, 0.3);
disp(R)

% The inverse is given by
Inverse = tr2rpy(R);
disp(Inverse)