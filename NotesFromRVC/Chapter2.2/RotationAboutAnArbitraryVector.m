% Rotation about angle ZYX 
RotationZYX = rpy2r(0.1, 0.2, 0.3);

% Determining the angle and the vector that are related by a 
% a single rotation for two coordinate frames
[theta, vector] = tr2angvec(RotationZYX);
disp("This is the angle roation about som axis in space")
disp(theta)
disp("This is the vector where the roation occurs")
disp(vector)

% The vector is encoded in the eigenvalues of RotationZYX
[x, e] = eig(RotationZYX);
disp("The eigenvalue is equal to one and the vector lies " + ...
    "in the third column of x.")
disp(x)
disp(e)

% a complex pair λ = cosθ ±i sinθ where θ is the 
% rotation angle. The angle of rotation for a complex 
% pair is given by.
thetaComplex = angle(e(1, 1));
disp(thetaComplex)

% The inverse problem can be solved by the Rodrigues' 
% rotation formula. This formula converts angle and 
% vector to a roatation matrix.
RodriguesRotation = angvec2r(pi/2, [1 0 0]);
disp("A rotation of pi/2 about the x-axis.")
disp(RodriguesRotation)