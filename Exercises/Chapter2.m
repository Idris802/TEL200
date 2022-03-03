%% 2.5

% A matrix with a rotation about the XYZ axes
RotationMatrix = rotx(pi/3) * roty(pi/2) * rotz(pi/6);
disp(RotationMatrix)

% visualising the matrix rotation 
tranimate(RotationMatrix,'3d')

% a) using our rotation matrix to transform a vector
vector = [2 0 0]';

% Initial plot of the vetctor 
plot3([0 vector(1)], [0 vector(2)], [0 vector(3)], 'r')
axis([-0.5 2.5 -0.5 2.5 -0.5 2.5])
set(findall(gca, 'Type', 'Line'), 'LineWidth', 3);

% Transforming the vector
VectorTransformation = RotationMatrix * vector;
disp(VectorTransformation)

% Plot of the vetor after the transformation 
figure 
plot3([0 VectorTransformation(1)], ...
    [0 VectorTransformation(2)], ...
    [0 VectorTransformation(3)])
axis([-0.5 2.5 -0.5 2.5 -0.5 2.5])
set(findall(gca, 'Type', 'Line'), 'LineWidth', 3);

% b) 
RotationMatrixInverted = inv(RotationMatrix);
disp("")
disp("Multyplying an original matrix by its inverse " + ...
    "equals the identity matrix")
disp(RotationMatrix * RotationMatrixInverted)

disp("")
disp("Reversed order gives the same results")
disp(RotationMatrixInverted * RotationMatrix)

disp("")
disp("The determinant of the rotation matrix")
disp(det(RotationMatrix))

disp("")
disp("The determinant of the inverse of " + ...
    "the rotation matrix")
disp(det(inv(RotationMatrix)))

%% 2.7

RotationXY = rotx(90, "deg") * roty(90, "deg");
tranimate(RotationXY)

% Reversing the order of the multiplication 
RotationYX = roty(90, "deg") * rotx(90, "deg");
tranimate(RotationYX)

vector = [1 0 0]';

% Initial position of the vector 
plot3([0 vector(1)], [0 vector(2)], [0 vector(3)])
axis([-1 2 -1 1 -1 1])
set(findall(gca, 'Type', 'Line'), 'LineWidth', 3);

% Tranforming the vector by RotationXY
VectorXYTransformation = RotationXY * vector;

% plot after the transformation XY
plot3([0 VectorXYTransformation(1)], ...
    [0 VectorXYTransformation(2)], ...
    [0 VectorXYTransformation(3)])
axis([-1 2 -1 1 -1 1])
set(findall(gca, 'Type', 'Line'), 'LineWidth', 3);

% Tranformin the vector by RotationYX
VectorYXTransformation = RotationYX * vector;

% plot after the transformation YX
plot3([0 VectorYXTransformation(1)], ...
    [0 VectorYXTransformation(2)], ...
    [0 VectorYXTransformation(3)])
axis([-1 2 -1 1 -1 1])
set(findall(gca, 'Type', 'Line'), 'LineWidth', 3);


