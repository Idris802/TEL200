% Creates a rotation matrix
R = rot2(0.2);
disp("Matrix Values")
disp(R)

% Takes the determinant of the rotation matrix R
Determinant = det(R);
disp("The determinant of R")
disp(Determinant)

% Creates a symbolic theta which then is used in 
% the angle unit of the matrix 
syms theta
R = rot2(theta);
disp("Matrix with theta Symbols")
disp(R)

% Multplying R without simplification
RNotSimple = R * R;
disp("Messy output without simplification")
disp(RNotSimple)


% Multplying R with simplification
RSimple = simplify(R * R);
disp("Clean output with simplification")
disp(RSimple)

% Determinant of R without simplifiication 
Determinant = det(R);
disp("Without simplification the determinant looks lik this")
disp(Determinant)


% Determinant of R with simplifiication
DeterminantSimplified = simplify(det(R));
disp("With simplification the determinant looks lik this")
disp(DeterminantSimplified)
