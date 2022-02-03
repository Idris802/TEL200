% Creating a rotation matrix
R = rot2(0.3); 
disp("This is the rotation matrix with 0.3 as the radians")
disp(R)

% computing the logarithm of our matrix
S = logm(R);
disp("This is the logarithm of the rotation matrix")
disp(S)


% Since S is a 2 x 2 skew-symmetric matrix 
% Then it has only one unique element

% Taking the inverse of S
Inverse = vex(S);
disp("The inverse of the skew-symmetric matrix")
disp(Inverse)

% Recovering the matrix from the logarithm 
% using the built matlab matrix exponential
OriginalRotationMatrix = expm(S);
disp("Back to original matrix before logarithm")
disp(OriginalRotationMatrix)


% Proving that the original rotation matrix 
% is equivivalent to the exponential of the skew-symmetric
% matrix
SkewSymmetric = expm(skew(0.3));

if R == SkewSymmetric
    disp("Both matrices are the same")
    disp(R)
    disp(" = ")
    disp(SkewSymmetric)
end



