% Creates a plot from -5 to 4 in x directions and -1 to 5 
% in y direction.
plotvol([-5 4 -1 5]);

% Creating a coordinate frame {0}
T0 = eye(3, 3);
trplot2(T0, 'frame', '0')

% Creating frame X
X = transl2(2, 3);
trplot2(X, 'frame', 'X')

% Crreating a rotation of 115 degrees = 2 radians
% for test
R = trot2(2);

% Making the frame X rotate 115 degreed approximately 2 radians

% R * X Makes it rotate about the origin 
trplot2(R * X, 'framelabel', 'RX', 'color', 'r'); 

% X * R Makes it rotate about the origin of the frame {X}
trplot2(X * R, 'framelabel', 'XR', 'color', 'r');

% Making a new point in order to make our coordinate frame 
% roatate about it.
C = [1 2]';
plot_point(C, 'label', ' C', 'solid', 'ko')

% Computing the transformation and making it rotate about
% about point C
RC = transl2(C) * R * transl2(-C);
disp(RC)

trplot2(RC * X, 'framelabel', 'XC', 'color', 'r');

