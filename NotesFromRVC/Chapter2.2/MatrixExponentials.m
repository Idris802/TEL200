% x-axis rotation
R = rotx(0.3); 
disp(R)

S = logm(R);
disp(S)

disp(vex(S))

[th, w] = trlog(R);
disp("Angle")
disp(th)
disp("Axis")
disp(w)

disp(expm(S))

% R = expm( skew([1 0 0] * 0.3)) = expm(S)

% Simple example of a skew symmetric matrix
SkewSymmetricMatrix = skew([1 2 3]);
disp("The skew symmetric matrix")
disp(SkewSymmetricMatrix)

% Taking the inverse to get back the original vector
inverse = vex(SkewSymmetricMatrix);
disp("The original vector of the skew symmetric matrix")
disp(inverse)