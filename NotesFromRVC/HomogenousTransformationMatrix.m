% Creating a homogenous transformation which represents a trasnlation
% of x = 1 & y = 2
% in the matrix T = |cos(t) -sin(t)  x|
                  % |sin(t) cos(t)   y|
                  % |  0      0      1|
% Followed by the rotation angle t = 30 in degrees

% Here transl2 creates the realative pose with finite translation but 0
% rotation. While trot2 creates a realtive pose with finite roataton 
% but 0 translation
T1 = transl2(1, 2) * trot2(30, 'deg');
disp("This is the transformation of a homogenous matrix")
disp(T1)

% Plotting of T1
plotvol([0 5 0 5]);
trplot2(T1, 'frame', '1', 'color', 'b')

% Creating other realtive poses which have the displacement x = 2 & y = 1
T2 = transl2(2, 1);
disp(T2)

trplot2(T2, 'frame', '2', 'color', 'r')

T3 = T1 * T2;
disp(T3)

trplot2(T3, 'frame', '3', 'color', 'g')

T4 = T2 * T1;
disp(T4)

trplot2(T4, 'frame', '4', 'color', 'c')

% Defining a point relative to the world at the coordinates (3, 2)
P = [3; 2];

% Now we add this column vector P to our plot
plot_point(P, 'label', 'P', 'solid', 'ko');

% Describing the point p at coordinate frame {1}
% see EquationNotes or equation 2.1 in RVC

% P1 = inv(T1) * [P; 1];

% e2h converts euclidean coordinates to homogenous 
% (i.e of the same kind) and h2e performs the inverse
% conversion
P1 = h2e(inv(T1) * e2h(P));
