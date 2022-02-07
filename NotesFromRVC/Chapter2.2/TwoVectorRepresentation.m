%                ax|ay|az
ApproachVector = [1 0 0];

%                  ox|oy|oz
OrientationVector = [0 1 0];

% The two unit vectors then defines the rotation vector
RotationVector = oa2r(OrientationVector, ApproachVector);
disp("The roration of the approach and orientation vectors.")
disp(RotationVector)

