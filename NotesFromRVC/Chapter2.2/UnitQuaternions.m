% Coverting a rotation matrix to a unit quaternion

RotationMatrix = rpy2r(0.1, 0.2, 0.3);

% The uni quaternion
q = UnitQuaternion(RotationMatrix);
disp("The first element s is a scalar in R and the second is a vector " + ...
    "in R³")
disp(q)

q = q * q;
disp(q)

% The inverse of a quaternion should give a negative vector v
InverseQuaternion = inv(q);
disp(q)

% The inverse of a quaternion times a quternion should give the 
% zero vector and 1 as a scalar aka the identity quaternion
disp(InverseQuaternion * q)

disp(q/q)

QuaternionToRotationMatrix = q.R;
disp(QuaternionToRotationMatrix)

% Plotting the orientation of the quaternion
q.plot()

disp(q)
disp(q*[1 0 0]')